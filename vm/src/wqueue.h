/*
 * Welcome Queue
 *
 * Written by Olav & Gaute 11.11.2020
 */

#ifndef _EMERALD_WQUEUE_H
#define _EMERALD_WQUEUE_H

#include "types.h"
#include "vm_i.h"


/* kommentar */
 typedef struct WQueueRecord {
     State *state;
     AbstractType at;
     struct WQueueRecord *next, *prev;
 } WQueueRecord, *WQueue;

/* kommentar */
WQueue WQCreate(void);

/* kommentar */
void WQDestroy(WQueue q);

/* kommentar */
void WQInsert(WQueue q, State *s, AbstractType at);

/* kommentar */
State* WQFindAndRemove(WQueue q, AbstractType at);

#endif
