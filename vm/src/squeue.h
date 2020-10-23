/* Generated by specialize genericqueue SQueue "struct State *"
 * Queues are a sequence of some domain.
 * Operations:
 *	create, destroy, insert, remove, insertfront, removeback, size, print
 *	foreach
 */

#ifndef _EMERALD_SQUEUE_H
#define _EMERALD_SQUEUE_H
/*
 * Before using this, one must define the following:
 *	SQueueDomainType	- a typedef for the domain
 */
typedef struct State * SQueueDomainType;

/*
 * Hidden, private type declarations.  The only thing
 * that applications of this package are to see is SQueue,
 * and they are to treat it as opaque:  that is, they may
 * assign it, and pass it as arguments, but not manipulate
 * what it points to directly.
 */

typedef struct SQueueRecord {
    SQueueDomainType *table;
    int size, first, count;
} SQueueRecord, *SQueue;

/* OPERATIONS */

/* Return a new, empty queue */
SQueue SQueueCreate(void);

/* Destroy a queue */
void SQueueDestroy(SQueue);

/* Insert the value at the rear of the queue */
void SQueueInsert(SQueue q, SQueueDomainType v);

/* Insert the value at the front of the queue */
void SQueueInsertFront(SQueue q, SQueueDomainType v);

/* Remove and return the value at the front of the queue */
SQueueDomainType SQueueRemove(SQueue q);

/* Remove and return the value at the back of the queue */
SQueueDomainType SQueueRemoveBack(SQueue q);

/* Remove a specific element from the SQueue, return 1 if found */
int SQueueYank(SQueue q, SQueueDomainType e);

/* DEBUGGING: Print the queue */
void SQueuePrint(SQueue q);

/* Iterate over the elements of the queue
 * At each iteration, SQueueValue is set to the next element
 * Usage:
 *	SQueueForEach(someSq, key) {
 *	  / * whatever you want to do with key * /
 *	} SQueueNext();
 */
#define SQueueForEach(q, value) \
  { \
    int SQueuexx_index, SQueuexx_count; \
    for (SQueuexx_index = (((q) && !ISNIL(q)) ? (q)->first: 0), SQueuexx_count = 0; \
	 SQueuexx_count < (((q) && !ISNIL(q)) ? (q)->count : 0); \
	 SQueuexx_count++, \
	 SQueuexx_index += \
	   (SQueuexx_index == (q)->size -1 ? -((q)->size - 1) : 1)) { \
      *(SQueueDomainType*)(&(value)) = (q)->table[SQueuexx_index]; \
      { 

#define SQueueNext() \
      } \
    } \
  }

/* Return the number of elements in SQueue */
#define SQueueSize(q) (((q) && !ISNIL(q)) ? (q)->count : 0)

#include "storage.h"

#endif /* _EMERALD_SQUEUE_H */