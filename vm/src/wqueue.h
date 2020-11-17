/*
 * Welcome Queue
 *
 * Written by Olav & Gaute 11.11.2020
 */

#ifndef _EMERALD_WQUEUE_H
#define _EMERALD_WQUEUE_H

#include "types.h"
#include "storage.h"

extern int conforms(AbstractType a, AbstractType b);

/*
 * Before using this, one must define the following:
 *	WQueueDomainType	- a typedef for the domain
 */
typedef struct State *WQueueDomainType;

/*
 * The welcome queue is a doubly linked list of states waiting for objects
 * conforming to the specified abstract type to be moved onto the local node.
 */
 typedef struct WQueueRecord {
     WQueueDomainType state;
     AbstractType at;
     struct WQueueRecord *next, *prev;
 } WQueueRecord, *WQueue;

/* Create a new queue */
WQueue WQueueCreate(void);

/* Destroy a queue */
void WQueueDestroy(WQueue q);

/* Insert an element into the queue */
void WQueueInsert(WQueue q, WQueueDomainType s, AbstractType at);

/*
 * Search for an element with an abstract type conforming to the at parameter
 * and remove it
 */
WQueueDomainType WQueueFindAndRemove(WQueue q, AbstractType at);

/* Print information on the content of the queue (for debugging)  */
void WQueuePrint(WQueue q);

/* Print out String object (for debugging) */
#define PRINTF(format, str) { 					\
		char buf[str->d.items + 1]; 			\
		buf[str->d.items] = 0; 					\
		memcpy(buf, str->d.data, str->d.items); \
		printf(format, buf); 					\
	}

#endif
