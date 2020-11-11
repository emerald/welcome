/*
 * Welcome Queue
 *
 * Written by Olav & Gaute 11.11.2020
 */

#ifndef _EMERALD_WQUEUE_H
#define _EMERALD_WQUEUE_H

#define E_NEEDS_STRING

#include "types.h"
#include "storage.h"
#include "system.h"

extern int conforms(AbstractType a, AbstractType b);

/*
 * Before using this, one must define the following:
 *	WQueueDomainType	- a typedef for the domain
 */
typedef struct State *WQueueDomainType;

/* kommentar */
 typedef struct WQueueRecord {
     WQueueDomainType state;
     AbstractType at;
     struct WQueueRecord *next, *prev;
 } WQueueRecord, *WQueue;

/* kommentar */
WQueue WQueueCreate(void);

/* kommentar */
void WQueueDestroy(WQueue q);

/* kommentar */
void WQueueInsert(WQueue q, WQueueDomainType s, AbstractType at);

/* kommentar */
WQueueDomainType WQueueFindAndRemove(WQueue q, AbstractType at);

/* kommentar */
void WQueuePrint(WQueue q);

/* Print out String object */
#define PRINTF(format, str) { 					\
		char buf[str->d.items + 1]; 			\
		buf[str->d.items] = 0; 					\
		memcpy(buf, str->d.data, str->d.items); \
		printf(format, buf); 					\
	}

#endif
