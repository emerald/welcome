/*
 * Copyright (C)
 * Norman C. Hutchinson and the University of British Columbia, 1998
 */
#define E_NEEDS_STRING
#define E_NEEDS_SOCKET
#define E_NEEDS_SIGNAL
#define E_NEEDS_IOV
#define E_NEEDS_TCP
#define E_NEEDS_NETDB
#define E_NEEDS_ERRNO
#define E_NEEDS_IFADDRS
#include "system.h"

#include "assert.h"
#include "types.h"
#include "mqueue.h"
#include "storage.h"
#include "misc.h"

Node myid;

MQueue incoming;

#ifdef DISTRIBUTED
#include "dist.h"
#include "remote.h"
#include "io.h"

#ifdef WIN32
extern int gettimeofday(struct timeval *, void *);
#endif /* not WIN32 */

#ifndef SELECTSIZE_T
#define SELECTSIZE_T size_t
#endif
#ifndef SELECTFD_T
#define SELECTFD_T fd_set
#endif
#ifndef SELECTCONST
#define SELECTCONST const
#endif

#define MAXOTHERS 128
#define MAXBROADCASTADDRS 10
static int nothers;
struct other {
	Node id;
	int s;
	char silent;
} others[MAXOTHERS], cache;

/*
 * Forward declarations.
 */

static void setupReader(struct other *ri);
static void ListenerCB(int, EDirection, void *);

extern int checkSameUser, beDiscoverable;
extern struct timeval inc_tm;
static int brd_socket, last_ad = 0;
static Bits32 broadcastaddrs[MAXBROADCASTADDRS];

static void pipeHandler(int signalnumber) {
	TRACE(dist, 1, ("Got SIGPIPE"));
}

/*
 * Send length and message.
 */
ssize_t Dwrite2(int fd, void *buf1, size_t n1, void *buf2, size_t n2) {
	int res;
	struct iovec v[2];
	int howmany = 2;
	v[0].iov_base = buf1;
	v[0].iov_len = n1;
	v[1].iov_base = buf2;
	v[1].iov_len = n2;
	TRACE(dist, 4, ("write2 on %d for %d+%d bytes", fd, n1, n2));
	if (fd < 0) return -1;
	while (1) {
#ifdef WIN32
		res = send(fd, v[0].iov_base, v[0].iov_len, 0);
#else
		res = writev(fd, v, howmany);
#endif /* WIN32 */
		TRACE(dist, 4, ("write2 wrote %d", res));
		if ((unsigned)res == v[0].iov_len + v[1].iov_len) {
			res = n1 + n2;
			break;
		}
		else if (res > 0) {
			/* Only wrote a part, fix up things */
			if ((unsigned)res < v[0].iov_len) {
				v[0].iov_len -= res;
				v[0].iov_base += res;
			}
			else {
				res -= v[0].iov_len;
				v[0].iov_len = v[1].iov_len - res;
				v[0].iov_base = v[1].iov_base + res;
				v[1].iov_base = 0;
				v[1].iov_len = 0;
				howmany = 1;
			}
		}
		else if (res <= 0 && errno == EINTR) {
			/*
			 * Go around the loop.
			 */
		}
		else {
			TRACE(dist, 1, ("write2 on %d for %d+%d bytes returned %d, errno = %d",
			                fd, n1, n2, res, errno));
			break;
		}
	}
	TRACE(dist, 4, ("write2 returning %d", res));
	return res;
}

struct header {
	int length;
};

static int mysocket;

struct nbo {
	unsigned int ipaddress;
	unsigned short port, epoch;
	int userid;
};

static NotifyFunction notifyFunction;

void DRegisterNotify(NotifyFunction f) {
	assert(notifyFunction == 0);
	notifyFunction = f;
}

/*
 * AKA deleteOther.
 * Remove all instances of o from others-array. Decrease nothers accordingly.
 */
static void nukeother(struct other o) {
	int from, to;
	TRACE(dist, 8, ("Nuking %x.%x (%d)", ntohl(o.id.ipaddress), o.id.port, o.s));
	for (from = 0, to = 0; from < nothers; from++) {
		if (others[from].s == o.s) {
			TRACE(dist, 8, ("  Nuking %x.%x (%d)", ntohl(others[from].id.ipaddress), others[from].id.port, others[from].s));
			/* don't do this one */
		}
		else {
			if (from != to) {
				others[to++] = others[from];
			}
			else {
				to++;
			}
		}
	}
	TRACE(dist, 7, ("Nothers went from %d to %d", nothers, to));
	nothers = to;
	cache.id.ipaddress = cache.id.port = cache.s = 0;
}

static void maximizeSocketBuffers(int s) {
#if defined(SO_SNDBUF) && defined(SO_RCVBUF)
	int size = 0, mid, low, high;
	socklen_t len;
	int which = SO_SNDBUF;
	do {
		len = sizeof(low);
		if (getsockopt(s, SOL_SOCKET, which, (char *)&low, &len) >= 0) {
			low = low / 1024;
			high = 128;
			while (low < high) {
				mid = size = ((low + high) / 2) * 1024;
				if (size == low * 1024 || size == high * 1024) break;
				TRACE(dist, 14, ("Range [%d-%d], trying size %d", low * 1024, high * 1024, size));
				if (setsockopt(s, SOL_SOCKET, which, (char *)&size, sizeof(size)) < 0) {
					TRACE(dist, 13, ("Resetting high to %d", mid / 1024));
					high = mid / 1024;
				}
				else {
					TRACE(dist, 13, ("Resetting low to %d", mid / 1024));

					low = mid / 1024;
				}
			}
		}
		TRACE(dist, 3, ("Set socket buffer size to %d", size));
		which = (which == SO_SNDBUF ? SO_RCVBUF : -1);
	} while (which != -1);
#endif
}

static char *formatIPAddress(Bits32 addr, char *buffer) {
	sprintf(buffer, "%d.%d.%d.%d",
	        (addr & 0xff000000) >> 24, (addr & 0x00ff0000) >> 16,
	        (addr & 0x0000ff00) >> 8, (addr & 0x000000ff));
	return buffer;
}

static int isLocalAddress(Bits32 addr) {
	return ((addr & 0xff000000) == 0x7f000000);
}

static void checkForStrangeness() {
	int i, prev = -1;
	TRACE(dist, 7, ("  Looking for strangeness"));
	for (i = 0; i < nothers; i++) {
		TRACE(dist, 8, ("  Looking at %#x.%4x %d %s", ntohl(others[i].id.ipaddress), others[i].id.port, others[i].s, isLocalAddress(ntohl(others[i].id.ipaddress)) ? "Local" : "Not local"));
		if (!isLocalAddress(ntohl(others[i].id.ipaddress))) {
			if (prev != -1 && others[prev].s == others[i].s && others[prev].id.ipaddress != others[i].id.ipaddress) {
				char b1[32], b2[32];
				/* Strangeness */
				TRACE(dist, 9, ("Strange, others[%d] = %#x %d", prev, ntohl(others[prev].id.ipaddress), others[prev].s));
				TRACE(dist, 9, ("Strange, others[%d] = %#x %d", i, ntohl(others[i].id.ipaddress), others[i].s));
				printf("Found two different addresses for a node (%s and %s)\n",
				       formatIPAddress(ntohl(others[prev].id.ipaddress), b1),
				       formatIPAddress(ntohl(others[i].id.ipaddress), b2));
				printf("This node probably has a non-working but enabled network interface\n");
				printf("Emerald doesn't deal well with this\n");
			}
			prev = i;
		}
	}
}

void unmute(Node srv) {
	int i;

	for (i = 0; i < nothers; i++) {
		if (SameNode(srv, others[i].id)) {
			if (others[i].silent)
				TRACE(merge, 6, ("unmuting node with port %d", others[i].id.port));
			others[i].silent = 0;
		}
	}
}

/*
 * In short:
 * Find socket of node and set cache (global) to it.
 * If create = 1, and socket doesn't exist:
 * 			Create the socket
 *			Connect to node
 *			Create an other based on node and new socket with empty epoch and
 *			add it to others.
 *			Exchange epoch/nbo info with node
 *			Update Node *t with new info
 *			Allocate new other and add the node and the socket to it
 *			Setup ReaderCB as handler for new socket.
 *			If new node is unique: Add new other to others[], this time with
 *			correct epoch.
 * If silent = 1:
 *			The handshake is performed in silent mode, so that the receiving
 *			node will not trigger a node-up event.
 */
int findsocket(Node *t, int create, int silent) {
	int i, addrlen, s, pos, res;
	struct sockaddr_in addr;
	struct other *o, localcopy;
	struct nbo nbo;
	SELECTFD_T set;

	TRACE(dist, 7, ("in find socket for %#x.%4x", ntohl(t->ipaddress), t->port));
	if (cache.id.ipaddress == t->ipaddress && cache.id.port == t->port && cache.s) {
		TRACE(dist, 8, ("find socket returning %d from cache", cache.s));
		return cache.s;
	}
	for (i = 0; i < nothers; i++) {
		TRACE(dist, 9, ("  Looking at %#x.%4x", ntohl(others[i].id.ipaddress), others[i].id.port));
		if (others[i].id.ipaddress == t->ipaddress && others[i].id.port == t->port) {
			cache = others[i];
			TRACE(dist, 8, ("find socket returning %d", cache.s));
			return cache.s;
		}
	}
	if (!create) return -1;
#if defined(WIN32) && defined(SO_SYNCHRONOUS_NONALERT)
	{
		int optionValue = SO_SYNCHRONOUS_NONALERT;
		int err;
		err = setsockopt(INVALID_SOCKET,
		                 SOL_SOCKET,
		                 SO_OPENTYPE,
		                 (char *)&optionValue,
		                 sizeof(optionValue));
		if (err != NO_ERROR) {
			printf("setsockopt: OPENTYPE failed with %d\n", err);
			abort();
		}
	}
#endif
	if ((s = socket(AF_INET, SOCK_STREAM, 0)) < 0) return -1;
	memset(&addr, 0, sizeof(addr));
	addr.sin_family = AF_INET;
	addr.sin_port = htons(0);
	addr.sin_addr.s_addr = 0;
	if (bind(s, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
		perror("findsocket.bind");
		closesocket(s);
		return -1;
	}
	memset(&addr, 0, sizeof(addr));
	addr.sin_family = AF_INET;
	addr.sin_port = htons(t->port);
	addr.sin_addr.s_addr = t->ipaddress;
	addrlen = sizeof(addr);

	TRACE(dist, 1, ("Trying to connect to %08lx.%04x", ntohl(addr.sin_addr.s_addr), ntohs(addr.sin_port)));
	if (connect(s, (struct sockaddr *)&addr, addrlen) < 0) {
		TRACE(dist, 3, ("Connect failed with errno %d %s", errno, strerror(errno)));
		closesocket(s);
		return -1;
	}
	{
		int on = 1;
		if (setsockopt(s, IPPROTO_TCP, TCP_NODELAY, (char *)&on, sizeof (on)) < 0) {
			closesocket(s);
			perror("setsockopt");
			return -1;
		}
	}
	maximizeSocketBuffers(s);

	localcopy.id = *t;
	localcopy.s = s;
	localcopy.silent = silent;
	TRACE(dist, 9, ("Inserting %#x.%d -> %d in others[%d]", ntohl(t->ipaddress), t->port, localcopy.s, nothers));
	pos = nothers;
	others[nothers++] = localcopy;

	{
		nbo.ipaddress = myid.ipaddress;
		nbo.port = htons(myid.port);
		nbo.epoch = htons(myid.epoch);
		nbo.userid = htonl(getuid() | (silent ? SILENT_MODE_FLAG : 0));

		if (writeToSocketN(localcopy.s, &nbo, sizeof(nbo)) != sizeof(nbo)) {
				TRACE(dist, 0, ("Couldn't exchange epoch info"));
				closesocket(localcopy.s);
				nothers--;
				return -1;
		}

		/*
		 * Two nodes may try to connect to each other at the same time. To
		 * avoid infinite blocking, nodes must be able to accept incoming
		 * connections while waiting for the handshake to complete.
		 *
		 * This may lead to duplicate connections. In those cases, only one
		 * socket will be used by each node.
		 */
		while (1) {
			FD_ZERO(&set);
			FD_SET(localcopy.s, &set);
			FD_SET(mysocket, &set);

			res = real_select((localcopy.s > mysocket
							 ? localcopy.s : mysocket) + 1,
						 	 &set, NULL, NULL, NULL);
			if (res < 0) {
				perror("findsocket.real_select");
				closesocket(localcopy.s);
				nukeother(localcopy);
				return -1;
			}
			if (FD_ISSET(localcopy.s, &set)) break;
			ListenerCB(mysocket, EIO_Read, NULL);
		}

		if (readFromSocketN(localcopy.s, &nbo, sizeof(nbo)) != sizeof(nbo)) {
			TRACE(dist, 0, ("Couldn't exchange epoch info"));
			closesocket(localcopy.s);
			nukeother(localcopy);
			return -1;
		}

		if (checkSameUser && getuid() != (int)ntohl(nbo.userid)) {
			printf("Permission denied - user mismatch local %d != remote %d\n",
					(int)getuid(), (int)ntohl(nbo.userid));
			closesocket(localcopy.s);
			nukeother(localcopy);
			return -1;
		}

		localcopy.id.ipaddress = nbo.ipaddress;
		localcopy.id.epoch = ntohs(nbo.epoch);
		assert(localcopy.id.port == ntohs(nbo.port));
		*t = localcopy.id;
		localcopy.silent = silent;
	}

	o = (struct other *)vmMalloc(sizeof *o);
	*o = localcopy;
	setupReader(o);

	if (silent) TRACE(merge, 6, ("connection in silent mode"));
	TRACE(dist, 2, ("find socket returning new %d", localcopy.s));
	cache = localcopy;
	if (!SameNode(others[pos].id, cache.id)) {
		TRACE(dist, 9, ("Inserting %#x.%d -> %d in others[%d]", ntohl(cache.id.ipaddress), cache.id.port, cache.s, nothers));
		others[nothers++] = cache;
	}
	checkForStrangeness();
	return cache.s;
}

static void callNotifyFunction(Node id, int comingup) {
	notifyFunction(id, comingup);
}

typedef struct ReaderState {
	struct other *ri;
	readBuffer rb;
	int readingLength, length;
} ReaderState;

/*
 * Read a new message from sock into the ReaderState (state).
 * Any message consists of two messages: the length of the following message and
 * the message itself. After reading the length, a buffer is allocated and
 * the rest of the message is expected. After reading the message, it is
 * inserted into the incoming MQueue, and any new message is expected to be
 * a length message.
 */
static void ReaderCB(int sock, EDirection d, void *state) {
	extern long nMessagesReceived, nBytesReceived;
	ReaderState *rs = state;
	int res;
	void *buffer = 0;

	if (!(res = tryReading(&rs->rb, sock))) return;
	if (res < 0 || res != rs->rb.goal) {
		/*
		 * Give up on this socket.
		 */
		resetHandler(sock, EIO_Read);
		resetHandler(sock, EIO_Except);
		closesocket(sock);
		if (notifyFunction && !rs->ri->silent) notifyFunction(rs->ri->id, 0);
		nukeother(*rs->ri);
		vmFree(rs->ri);
		vmFree(rs);
	}
	else if (rs->readingLength) {
		nBytesReceived += sizeof(rs->length);
		rs->length = ntohl(rs->length);
		rs->readingLength = 0;
		if (rs->length > 0) {
			buffer = vmMalloc(rs->length);
			setupReadBuffer(&rs->rb, buffer, rs->length, 0, readFromSocket);
		}
		else {
			TRACE(dist, 0, ("Negative length %d", rs->length));
		}
	}
	else {
		nBytesReceived += rs->length;
		nMessagesReceived++;
		assert(ntohl(*(int *)rs->rb.buffer) == 0xdeafdeaf);
		MQueueInsert(incoming, rs->ri->id, rs->length, rs->rb.buffer);
		setupReadBuffer(&rs->rb, &rs->length, sizeof(rs->length), 0, readFromSocket);
		rs->readingLength = 1;
	}
}

/*
 * Setup handlers for ri and allocate a ReaderState for it.
 */
static void setupReader(struct other *ri) {
	ReaderState *rs = (ReaderState *)vmMalloc(sizeof(*rs));
	rs->ri = ri;
	rs->readingLength = 1;
	setupReadBuffer(&rs->rb, &rs->length, sizeof(rs->length), 0, readFromSocket);
	setHandler(rs->ri->s, ReaderCB, EIO_Read, rs);
	setHandler(rs->ri->s, ReaderCB, EIO_Except, rs);
}

typedef struct {
	struct other *ri;
	struct nbo nbo;
	readBuffer rb;
} ListenerState;

static int checkUserOK(int local, int remote) {
	if (checkSameUser && local != remote) {
		printf("Permission denied - user mismatch local %d != remote %d\n",
		       local, remote);
		return 0;
	}
	else {
		return 1;
	}
}

static int update_epoch(struct other o) {
	for (int i = 0; i < nothers; i++) {
		if (others[i].id.ipaddress == o.id.ipaddress && others[i].id.port == o.id.port) {
			others[i] = o;
			return 0;
		}
	}
	return -1;
}

static u32 getMyIp() {
	struct ifaddrs *ifa, *tmp;
	int rc;
	u32 ip = 0;

	rc = getifaddrs(&ifa);
    if(rc < 0) {
		perror("getMyIp, getifaddrs");
		return 0;
	}

	for (tmp = ifa; tmp; tmp = tmp->ifa_next) {
        if (! (tmp->ifa_addr && tmp->ifa_addr->sa_family == AF_INET)) continue;
        if (! (strcmp(tmp->ifa_name, "lo"))) continue;
        ip = ((struct sockaddr_in*)tmp->ifa_addr)->sin_addr.s_addr;
		break;
    }

	freeifaddrs(ifa);
	return ip;
}

/*
 * Read a nbo containing information on the sender and store it in the others
 * array. Set up a reader for future communication, and call the notify function
 * to alert that a new Emerald node has connected.
 */
static void ListenerStage2(int sock, EDirection d, void *arg) {
	int res;
	ListenerState *ls = arg;
	if (!(res = tryReading(&ls->rb, ls->ri->s))) return;
	resetHandler(sock, EIO_Read);
	resetHandler(sock, EIO_Except);
	if (res != sizeof(ls->nbo) || !checkUserOK(getuid(), (~SILENT_MODE_FLAG & ntohl(ls->nbo.userid)))) {
		nukeother(*ls->ri);
		closesocket(ls->ri->s);
		vmFree(ls->ri);
	}
	else {
		ls->ri->id.port = ntohs(ls->nbo.port);
		ls->ri->id.ipaddress = ls->nbo.ipaddress;
		ls->ri->id.epoch = ntohs(ls->nbo.epoch);
		ls->ri->silent = ((SILENT_MODE_FLAG & ntohl(ls->nbo.userid)) != 0);
		TRACE(dist, 8, ("Inserting %#x.%4x.%4x -> %d in others[%d]", ntohl(ls->ri->id.ipaddress), ls->ri->id.port, ls->ri->id.epoch, ls->ri->s, nothers));
		if (update_epoch(*ls->ri)) others[nothers++] = *ls->ri;
		setupReader(ls->ri);
		if (notifyFunction && !ls->ri->silent) {
			callNotifyFunction(ls->ri->id, 1);
		}
	}
	checkForStrangeness();
	vmFree((char *)ls);
}

/*
 * Accept incoming connection and set up a new socket. Store information on the
 * new connection in the others array, and send an nbo back containing our
 * information. An expected nbo-reply is handled by ListenerStage2.
 */
static void ListenerCB(int sock, EDirection d, void *s) {
	int newsocket;
	struct sockaddr_in addr;
	socklen_t addrlen = sizeof(addr);
	int on = 1;
	ListenerState *ls = (ListenerState *)vmMalloc(sizeof(*ls));

	TRACE(dist, 1, ("ListenerCB on %d", sock));
	newsocket = accept(sock, (struct sockaddr *)&addr, &addrlen);
	if (newsocket < 0) return;
	if (setsockopt(newsocket, IPPROTO_TCP, TCP_NODELAY, (char *)&on, sizeof (on)) < 0) {
		closesocket(newsocket);
		perror("setsockopt");
		return;
	}
	maximizeSocketBuffers(newsocket);
	ls->ri = (struct other *)vmMalloc(sizeof *ls->ri);
	ls->ri->s = newsocket;
	ls->ri->id.ipaddress = addr.sin_addr.s_addr;
	ls->ri->id.port = ntohs(addr.sin_port);

	TRACE(dist, 1, ("Accepted new connection %d from %#x.%x",
  		  ls->ri->s, ntohl(ls->ri->id.ipaddress), ls->ri->id.port));
    TRACE(dist, 8, ("Inserting %#x.%x -> %d in others[%d]", ntohl(ls->ri->id.ipaddress), ls->ri->id.port, ls->ri->s, nothers));
	others[nothers++] = *ls->ri;
	ls->nbo.ipaddress = myid.ipaddress;
	ls->nbo.port = htons(myid.port);
	ls->nbo.epoch = htons(myid.epoch);
	ls->nbo.userid = htonl(getuid());
	checkForStrangeness();
	if (send(ls->ri->s, (char *)&ls->nbo, sizeof(ls->nbo), 0) != sizeof(ls->nbo)) {
		nukeother(*ls->ri);
		closesocket(ls->ri->s);
		vmFree(ls->ri);
		return;
	}
	setupReadBuffer(&ls->rb, &ls->nbo, sizeof(ls->nbo), 0, readFromSocket);
	setHandler(ls->ri->s, ListenerStage2, EIO_Read, ls);
	setHandler(ls->ri->s, ListenerStage2, EIO_Except, ls);
}

static void setupListener(int sock) {
	setHandler(sock, ListenerCB, EIO_Read, NULL);
}

/*
 * Set up initial listening socket, and set ListenerCB as its handler function.
 */
int DNetStart(unsigned int ipaddress, unsigned short port, unsigned short epoch) {
	struct sockaddr_in addr;
	socklen_t addrlen;
	int on = 1;
	char hostname[128];
#ifdef alpha
#pragma pointer_size long
#endif
	struct hostent *h;
#ifdef alpha
#pragma pointer_size short
#endif

	assert(myid.ipaddress == 0 && myid.port == 0 && myid.epoch == 0);
	if ((mysocket = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
		return -1;
	}
	memset(&addr, 0, sizeof(addr));
	addr.sin_family = AF_INET;
	addr.sin_port = htons(port);
	addr.sin_addr.s_addr = ipaddress;
	if (bind(mysocket, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
		closesocket(mysocket);
		return -1;
	}
	addrlen = sizeof(addr);
	if (getsockname(mysocket, (struct sockaddr *)&addr, &addrlen) < 0) {
		closesocket(mysocket);
		return -1;
	}
	TRACE(dist, 3, ("NetStart on %#lx.%d", addr.sin_addr.s_addr, ntohs(addr.sin_port)));
	if (listen(mysocket, 5) < 0) {
		closesocket(mysocket);
		return -1;
	}
	if (setsockopt(mysocket, SOL_SOCKET, SO_REUSEADDR, (char *)&on, sizeof (on)) < 0) {
		/* This is not a big deal, ignore it */
		TRACE(dist, 1, ("Failed to set SO_REUSEADDR socket option"));
	}
	/*
	 * Originally we did this all the time on not windows
	 */
	if (addr.sin_addr.s_addr == 0 || addr.sin_addr.s_addr == htonl(0x7f000001)) {
		if (gethostname(hostname, sizeof hostname) < 0) {
			printf("Can't get my own host name.\n");
			printf("Emerald won't work well between machines.\n");
		}
		else if ((h = gethostbyname(hostname)) == 0) {
			printf("Can't look up my own host name.\n");
			printf("Emerald won't work well between machines.\n");
		}
		else if (*(int*)h->h_addr != htonl(0x7f000101) || (addr.sin_addr.s_addr = getMyIp()) == 0) {
			memcpy(&addr.sin_addr.s_addr, h->h_addr, sizeof(unsigned int));
		}
	}
	myid.ipaddress = addr.sin_addr.s_addr;
	myid.port = ntohs(addr.sin_port);
	myid.epoch = epoch;
	TRACE(dist, 2, ("Net start on %04x.%04x.%04x", ntohl(myid.ipaddress), myid.port, myid.epoch));
	setupListener(mysocket);
	return 0;
}

static void discoveryCB (int sock, EDirection d, void *s) {
	char msg[DISCOVERY_MSGSIZE + 1];
	int rc;
	struct sockaddr_in sender;
	socklen_t socksize = sizeof(struct sockaddr_in);
	unsigned int em_sig, disc_sig, ip, sec, usec;
	unsigned short port, epoch;
	Node n;

	rc = recvfrom(sock, msg, DISCOVERY_MSGSIZE + 1, 0, (struct sockaddr*)&sender, &socksize);
	if(rc < 0) {
		perror("recvfrom in discoveryCB");
		return;
	} else if (rc != DISCOVERY_MSGSIZE) {
		return;
	}

	memcpy(&em_sig, &msg[0], sizeof(int));
	memcpy(&disc_sig, &msg[4], sizeof(int));
	memcpy(&ip, &msg[8], sizeof(int));
	memcpy(&port, &msg[12], sizeof(short));
	memcpy(&epoch, &msg[14], sizeof(short));
	memcpy(&sec, &msg[16], sizeof(int));
	memcpy(&usec, &msg[20], sizeof(int));

	em_sig = ntohl(em_sig);
	disc_sig = ntohl(disc_sig);
	if(EMERALDMARKER != em_sig || DISCOVERYMARKER != disc_sig) return;

	n.ipaddress = ip;
	n.port = ntohs(port);
	n.epoch = ntohs(epoch);

	handleDiscoveredNode(n, sec, usec);
}

int DDiscoverStart() {
	struct sockaddr_in broadcast_addr;
    int rc;
	int reuse = 1;
	char loopbackON = 1;
	int broadcastON = 1;

    broadcast_addr.sin_family = AF_INET;
    broadcast_addr.sin_port = htons(DISCOVERY_PORT);
    broadcast_addr.sin_addr.s_addr = INADDR_ANY;
    // Create the Socket
    int udpSocket = socket(AF_INET, SOCK_DGRAM, 0);
    if(udpSocket < 0) {
		perror("socket");
		return -1;
	}
    // Enable SO_REUSEADDR to allow multiple instances of this application to receive copies of the multicast datagrams.
    rc = setsockopt(udpSocket, SOL_SOCKET, SO_REUSEADDR, (char *)&reuse, sizeof(reuse));
    if(rc < 0) {
		perror("SO_REUSEADDR");
		close(udpSocket);
		return -1;
	}
    rc = setsockopt(udpSocket, IPPROTO_IP, IP_MULTICAST_LOOP, (char *)&loopbackON, sizeof(loopbackON));
	if(rc < 0) {
		perror("IP_MULTICAST_LOOP");
		close(udpSocket);
		return -1;
	}

    rc = setsockopt(udpSocket, SOL_SOCKET, SO_BROADCAST, (char *)&broadcastON, sizeof(broadcastON));
    if(rc < 0) {
		perror("SO_BROADCAST");
		close(udpSocket);
		return -1;
	}
	rc = bind(udpSocket, (struct sockaddr*)&broadcast_addr, sizeof(struct sockaddr_in));
	if(rc < 0) {
		perror("bind");
		close(udpSocket);
		return -1;
	}

	setHandler(udpSocket, discoveryCB, EIO_Read, NULL);
}

int DProd(Node *receiver) {
	int s = findsocket(receiver, 1, 0);
	return s;
}

/*
 * Message abstraction for Dwrite2.
 */
int DSend(Node receiver, void *sbuf, int slen) {
	unsigned int length;
	int s = -1, res = 1;
	extern char *NodeString(Node);
	extern long nMessagesSent, nBytesSent;
	noderecord *nr;


	if (SameNode(receiver, myid)) {
		res = -1;
	}
	else if (isNoNode(receiver)) {
		res = -1;
	}
	else {
		nr = getNodeRecordFromSrv(receiver);
		if (nr && !nr->up) {
			/*
			 * We have an entry for this node, and it is down.
			 */
			res = -1;
		}
		else {
			s = findsocket(&receiver, 1, 0);
			nMessagesSent++;
			nBytesSent += slen;

			TRACE(dist, 3, ("Send"));

			length = htonl(slen);
			res = Dwrite2(s, &length, sizeof(length), sbuf, slen);
			if (res != sizeof(length) + slen) {
				TRACE(dist, 1, ("DSend to %s, socket %d, for %d bytes returned %d\n",
				                NodeString(receiver), s, slen + sizeof(length), res));
				res = -1;
			}
		}
	}
	TRACE(dist, ((res < 0) ? 1 : 5), ("DSend %d to %s on %d returning %d", slen,
	                                  NodeString(receiver), s, res));
	return res;
}

void findBroadcastAddrs() {
	struct ifaddrs *ifa, *tmp;
	int rc, i = 0;

	memset(broadcastaddrs, 0, sizeof(Bits32) * MAXBROADCASTADDRS);

	rc = getifaddrs(&ifa);
    if(rc < 0) {
		perror("findBroadcastAddrs, getifaddrs");
		return;
	}

	for (tmp = ifa; tmp; tmp = tmp->ifa_next) {
        if (! (tmp->ifa_addr && tmp->ifa_addr->sa_family == AF_INET)) continue;
        if (! (strcmp(tmp->ifa_name, "lo"))) continue;
        if (tmp->ifa_flags & IFF_BROADCAST) {
            if(tmp->ifa_broadaddr) {
				broadcastaddrs[i++] = ((struct sockaddr_in*)tmp->ifa_broadaddr)->sin_addr.s_addr;
				if (i == MAXBROADCASTADDRS) break;
            }
        }
    }
	freeifaddrs(ifa);
}

void advertiseMe(){
	int i, rc, cur_time = time(NULL);
	static int counter = 0;
	Bits32 em_sig, disc_sig;
	Bits16 port, epoch;
	char msg[DISCOVERY_MSGSIZE], buf[16];

	static struct sockaddr_in broadcast_addr = {
		.sin_family = AF_INET,
	};
	broadcast_addr.sin_port = htons(DISCOVERY_PORT);

	if (cur_time - last_ad < ADVERTISEMENT_INTERVAL) return;

	TRACE(discovery, 4, ("Broadcasting advertising messages"));

	if (! (counter++ % 5)) findBroadcastAddrs();

	last_ad = cur_time;


	em_sig = htonl(EMERALDMARKER);
    disc_sig = htonl(DISCOVERYMARKER);
    port = htons(MyNode.port);
    epoch = htons(MyNode.epoch);

    memcpy(&msg[0], &em_sig, sizeof(int));
    memcpy(&msg[4], &disc_sig, sizeof(int));
    memcpy(&msg[8], &MyNode.ipaddress, sizeof(Bits32));
    memcpy(&msg[12], &port, sizeof(Bits16));
    memcpy(&msg[14], &epoch, sizeof(Bits16));
    memcpy(&msg[16], &inc_tm.tv_sec, sizeof(Bits32));
    memcpy(&msg[20], &inc_tm.tv_usec, sizeof(Bits32));

	for (i = 0; i < MAXBROADCASTADDRS; i++) {
		if(! broadcastaddrs[i]) break;
		TRACE(discovery, 8, ("broadcasting to: %s\n", formatIPAddress(ntohl(broadcastaddrs[i]), buf)));
		broadcast_addr.sin_addr.s_addr = broadcastaddrs[i];
		rc = sendto(brd_socket, msg, DISCOVERY_MSGSIZE, 0,
			(struct sockaddr*)&broadcast_addr, sizeof(struct sockaddr_in));
		if (rc < 0) perror("sendto-broadcast");
	}

}

void init_advertisement(){
	int reuse, broadcastON, ttl, rc;
	char loopbackON;

	TRACE(discovery, 1, ("INIT ADVERTISEMENT"));

	// Create the Socket
    brd_socket = socket(AF_INET, SOCK_DGRAM, 0);
    if(brd_socket < 0) {
		perror("socket");
		exit(EXIT_FAILURE);
	}

    // Enable SO_REUSEADDR to allow multiple instances of this application to receive copies of the multicast datagrams.
    reuse = 1;
    rc = setsockopt(brd_socket, SOL_SOCKET, SO_REUSEADDR, (char *)&reuse, sizeof(reuse));
    if(rc < 0) {
		perror("SO_REUSEADDR");
		close(brd_socket);
		exit(EXIT_FAILURE);
	}

 	loopbackON = 1;
    rc = setsockopt(brd_socket, IPPROTO_IP, IP_MULTICAST_LOOP, (char *)&loopbackON, sizeof(loopbackON));
    if(rc < 0) {
		perror("IP_MULTICAST_LOOP");
		close(brd_socket);
		exit(EXIT_FAILURE);
	}

    broadcastON = 1;
    rc = setsockopt(brd_socket, SOL_SOCKET, SO_BROADCAST, (char *)&broadcastON, sizeof(broadcastON));
    if(rc < 0) {
		perror("SO_BROADCAST");
		close(brd_socket);
		exit(EXIT_FAILURE);
	}

    ttl = 2;
    rc = setsockopt(brd_socket, IPPROTO_IP, IP_TTL, &ttl, sizeof(ttl));
    if(rc < 0)  {
		perror("IP_TTL");
		close(brd_socket);
		exit(EXIT_FAILURE);
	}
}

void processMessages(void) {
	if (MQueueSize(incoming) == 0) checkForIO(1);
	if (MQueueSize(incoming) > 0) serveRequest();
}

#endif

#ifdef __linux
# define sigvec     sigaction
# define sv_mask    sa_mask
# define sv_flags   sa_flags
# define sv_handler sa_handler
# define sv_onstack sa_mask /* ouch, this one really hurts */
#endif /* __linux */

#ifdef hp700
#define SIGVEC sigvector
#else
#define SIGVEC sigvec
#endif /* hp700 */

void establishHandler(int sig, void (*handler)(int)) {
#if defined(__svr4__) || defined(__SYSTYPE_SVR4__) || defined(CYGWIN)
	struct sigaction action;

	memset(&action, 0, sizeof(action));
	action.sa_handler = handler;
	sigaction(sig, &action, NULL);
#else
#if defined(WIN32) || defined(DOS)
	signal(sig, handler);
#else
	struct sigvec vec;
	memset(&vec, 0, sizeof(vec));

	vec.sv_handler = handler;
	SIGVEC(sig, &vec, NULL);
#endif
#endif
}

void DInit(void) {
	extern void sigdie(int);
	establishHandler(SIGINT, sigdie);
#if defined(SIGPIPE) && defined(DISTRIBUTED)
	establishHandler(SIGPIPE, pipeHandler);
#endif
	incoming = MQueueCreate();
}

#ifdef WIN32
void perror(const char *msg) {
	printf("%s: %d\n", msg, errno);
	fflush(stdout);
}
#endif /* WIN32 */

char *NodeString(Node srv) {
	static char buf[5][60];
	static int i = 0;
	char *rval;

	rval = buf[i]; i = (i + 1) % 5;
	sprintf(rval, "%08x.%04x.%04x", ntohl(srv.ipaddress), srv.port, srv.epoch);
	return rval;
}

int getplane() {
	int port = 0;
	extern int offsetbyuserid;
	char *plane = getenv("EMPLANE");
	if (plane) {
		port += mstrtol(plane, 0, 10);
	}
	else if (offsetbyuserid) {
		port += getuid() % EMERALDPORTSKIP;
	}
	return port;
}


int InitDist() {
	extern Node MyNode;
	extern OID MyBaseOID;
	int port;
	extern char *getenv(const char *);

	InitStorage();

	MyNode.epoch = random() & 0xffff;
	/* start up the network subsystem */
	port = EMERALDFIRSTPORT + getplane();

#ifdef DISTRIBUTED
	while (DNetStart(0,  port, MyNode.epoch) != 0) {
		port = EMERALDPORTPROBE(port);
		if (port > 0x10000) return -1;
	}
	if (DDiscoverStart() == -1) printf("Discovery mechanism failed."
										"Proceeding without discovery.\n");
#else
	myid.ipaddress = 0xdeadbeef;
	myid.port = port;
	myid.epoch = MyNode.epoch;
#endif
	MyNode.ipaddress = myid.ipaddress;
	MyNode.port = myid.port;
	MyNode.epoch = myid.epoch;
	MyBaseOID.ipaddress = ntohl(MyNode.ipaddress);
	MyBaseOID.port = MyNode.port;
	MyBaseOID.epoch = MyNode.epoch;

	return 0;
}