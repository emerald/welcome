/*
 * Welcome queue implementation
 *
 * Written by Olav & Gaute 11.11.2020
 */

#include "wqueue.h"

/* kommentar */
static WQueueRecord* WQRemoveRecord(WQueueRecord *r) {
    r->prev->next = r->next;
    r->next->prev = r->prev;
    vmFree((char *)r);
}

/* kommentar */
WQueue WQCreate(void) {
    WQueue q;

	q = (WQueue) vmMalloc(sizeof(WQueueRecord));
	if (q == NULL) return NULL;

    q->state = (State *) JNIL;
    q->at = (AbstractType) JNIL;
    q->next = q;
    q->prev = q;
    return q;
}

/* kommentar */
void WQDestroy(WQueue q) {
    WQueueRecord *record;

    if (q && !ISNIL(q)) {
        record = q;
        while ((record = record->next) != q)
            vmFree((char *)record);
        vmFree((char *)record);
    }
}

/* kommentar */
void WQInsert(WQueue q, State *s, AbstractType at) {
    WQueueRecord *record;

    record = (WQueue) vmMalloc(sizeof(WQueueRecord));
    if (record == NULL) return;

    record->state = s;
    record->at = at;
    record->next = q->next;
    record->prev = q;
    q->next = record;
}

/* kommentar */
State* WQFindAndRemove(WQueue q, AbstractType at) {
    WQueueRecord *record;
    State *s;

    for (record = q->prev; record != q; record = record->prev) {
        if(conforms(at, record->at)) {
            s = record->state;
            WQRemoveRecord(record);
            return s;
        }
    }

    return NULL;
}
