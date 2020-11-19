/*
 * Welcome queue implementation
 *
 * Written by Olav & Gaute 11.11.2020
 */

#define E_NEEDS_STRING
#include "system.h"
#include "wqueue.h"
#include "vm_i.h"

/* Helper function for removing an element from the queue */
static WQueueRecord* WQueueRemoveRecord(WQueueRecord *r) {
    r->prev->next = r->next;
    r->next->prev = r->prev;
    vmFree((char *)r);
}

/* Create a new queue */
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

/* Destroy queue */
void WQueueDestroy(WQueue q) {
    WQueueRecord *record;

    if (q && !ISNIL(q)) {
        record = q;
        while ((record = record->next) != q)
            vmFree((char *)record);
        vmFree((char *)record);
    }
}

/* Create a list element of s and at and insert it into q */
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

/*
 * Search for an element with an abstract type conforming to the at parameter
 * and remove it. The state of the element is returned, or NULL if none was
 * found.
 */
WQueueDomainType WQueueFindAndRemove(WQueue q, AbstractType at) {
    WQueueRecord *record;
    WQueueDomainType s;

    for (record = q->prev; record != q; record = record->prev) {
        if (!RESDNT(record->state->firstThing)) {
                    WQueueRemoveRecord(record);
                    continue;
        }
        if(conforms(at, record->at)) {
            s = record->state;
            WQueueRemoveRecord(record);
            return s;
        }
    }

    return NULL;
}

/* Print information on the content of the queue (for debugging)  */
void WQueuePrint(WQueue q) {
    WQueueRecord *record;
    WQueueDomainType s;
    int i;

    /* Find length of q */
    i = 0;
    for (record = q->prev; record != q; record = record->prev) i++;

    printf("Printing welcome queue with %d records:\n", i);
    for (record = q->prev; record != q; record = record->prev) {
        PRINTF("\t- Object %s is welcoming object of type ", record->state->cp->d.name);
        PRINTF("%s\n", record->at->d.name);
    }
}
