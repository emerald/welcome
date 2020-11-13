/*
 * Welcome queue implementation
 *
 * Written by Olav & Gaute 11.11.2020
 */

#define E_NEEDS_STRING
#include "system.h"
#include "wqueue.h"
#include "vm_i.h"

/* kommentar */
static WQueueRecord* WQueueRemoveRecord(WQueueRecord *r) {
    r->prev->next = r->next;
    r->next->prev = r->prev;
    vmFree((char *)r);
}

/* kommentar */
WQueue WQueueCreate(void) {
    WQueue q;

	q = (WQueue) vmMalloc(sizeof(WQueueRecord));
	if (q == NULL) return NULL;

    q->state = (WQueueDomainType ) JNIL;
    q->at = (AbstractType) JNIL;
    q->next = q;
    q->prev = q;
    return q;
}

/* kommentar */
void WQueueDestroy(WQueue q) {
    WQueueRecord *record;

    if (q && !ISNIL(q)) {
        record = q;
        while ((record = record->next) != q)
            vmFree((char *)record);
        vmFree((char *)record);
    }
}

/* kommentar */
void WQueueInsert(WQueue q, WQueueDomainType s, AbstractType at) {
    WQueueRecord *record;

    record = (WQueue) vmMalloc(sizeof(WQueueRecord));
    if (record == NULL) return;

    record->state = s;
    record->at = at;
    record->next = q->next;
    record->prev = q;
    q->next = record;
    record->next->prev = record;
}

/* kommentar */
WQueueDomainType WQueueFindAndRemove(WQueue q, AbstractType at) {
    WQueueRecord *record;
    WQueueDomainType s;

    for (record = q->prev; record != q; record = record->prev) {
        if(conforms(at, record->at)) {
            s = record->state;
            WQueueRemoveRecord(record);
            return s;
        }
    }

    return NULL;
}

/* kommentar */
void WQueuePrint(WQueue q) {
    WQueueRecord *record;
    WQueueDomainType s;
    int i;

    i = 0;
    for (record = q->prev; record != q; record = record->prev) i++;

    printf("Printing welcome queue with %d records:\n", i);

    for (record = q->prev; record != q; record = record->prev) {
        PRINTF("\t- Object %s is welcoming object of type ", record->state->cp->d.name);
        PRINTF("%s\n", record->at->d.name);
    }
}
