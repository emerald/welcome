#ifndef _EMERALD_MOVE_H
#define _EMERALD_MOVE_H

#ifndef _EMERALD_ISET_H
#include "iset.h"
#endif

#ifndef _EMERALD_REMOTE_H
#include "remote.h"
#endif

#define THIRD_PARTY_EMISSARY (1 << 7)

extern void sendNVars(Stream str, int n, int *args, Object ep, ConcreteType et);
extern void extractNVars(Stream str, int n, int *args, Object *epp, ConcreteType *etp, Node srv);
extern void findActivationsInObject(Object obj, Stream str);
extern int addActivations(struct State *state, Stream str, int ready);
extern int move(int option1, Object obj, Node srv, struct State *state);
extern void fixHere(Object o);
extern void doIsFixed(Object o, struct State *state, int option);
extern void unfixHere(Object o);
extern int isFixedHere(Object o);
extern void moveHandleDown(struct noderecord *);
extern int doEmissaryMoveRequest(int option1, Object obj, Node srv, State *state);
extern void handleEmissaryMoveRequest(RemoteOpHeader *h, Node srv, Stream str);
extern void handleEmissaryMoveReply(RemoteOpHeader *h, Node srv, Stream str);
#endif /* _EMERALD_MOVE_H */
