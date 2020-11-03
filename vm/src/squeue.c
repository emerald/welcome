/* Generated by specialize genericqueue SQueue "struct State *"
 * Queues
 */

#include "system.h"

#include "squeue.h"
#include "assert.h"
#include "types.h"

/* Return a new, empty queue */
SQueue SQueueCreate() {
	register int i;
	register SQueue q;

	q = (SQueue) vmMalloc(sizeof(SQueueRecord));
	if (q == NULL) return NULL;
	q->size = 8;
	q->count = 0;
	q->first = 0;
	q->table = (SQueueDomainType *)
	           vmMalloc((unsigned) q->size * sizeof(SQueueDomainType));
	if (q->table == NULL) {
		vmFree(q);
		return NULL;
	}
	for (i = 0; i < q->size; i++) {
		q->table[i] = NULL;
	}
	return q;
}

void SQueueDestroy(SQueue q) {
	if (q && !ISNIL(q)) {
		vmFree((char *)q->table);
		vmFree((char *)q);
	}
}

/* Expand the array.  Each element in the table is copied
 * in the new table.  The new space is initialized to NULL
 */
static void ExpandTable(SQueue q) {
	register int oldTableSize = q->size, i;

	q->size = oldTableSize + oldTableSize;
	q->table = (SQueueDomainType *)
	           vmRealloc(q->table, (q->size * sizeof(SQueueDomainType)));
	for (i = 0; i < q->first; i++) {
		q->table[oldTableSize + i] = q->table[i];
		q->table[i] = NULL;
	}
}

/* Insert the value in q. */
void SQueueInsert(q, value)
register SQueue q;
register SQueueDomainType value;
{
	if (q->count >= q->size) ExpandTable(q);
	q->table[q->first + q->count - (q->first + q->count >= q->size ? q->size : 0)] = value;
	q->count++;
}

/* Insert the value in q. */
void SQueueInsertFront(q, value)
register SQueue q;
register SQueueDomainType value;
{
	if (q->count >= q->size) ExpandTable(q);
	if (--q->first < 0) q->first += q->size;
	q->table[q->first] = value;
	q->count++;
}

/* Remove a specific element, return 1 if it was found */
int SQueueYank(SQueue q, SQueueDomainType e) {
	int i, found = 0, x, y = 0;
	x = q->first;
	for (i = 0; i < q->count; i++) {
		if (found) {
			q->table[y] = q->table[x];
		}
		else if (q->table[x] == e) {
			found = 1;
		}
		y = x; x++; if (x == q->size) x = 0;
	}
	if (found) q->count--;
	return found;
}

/* Remove the value at the front of the queue */
SQueueDomainType SQueueRemove(q)
register SQueue q;
{
	SQueueDomainType r;
	if (!q || ISNIL(q) || q->count <= 0) return NULL;
	r = q->table[q->first];
	if (++q->first >= q->size) q->first = 0;
	q->count--;
	return r;
}

/* Remove the value at the front of the queue */
SQueueDomainType SQueueRemoveBack(q)
register SQueue q;
{
	SQueueDomainType r;
	int index;
	if (!q || ISNIL(q) || q->count <= 0) return NULL;
	index = q->first + q->count;
	if (index >= q->size) index -= q->size;
	r = q->table[index];
	q->count--;
	return r;
}

/* DEBUGGING: Print the q */
void SQueuePrint(q)
register SQueue q;
{
	SQueueDomainType value;
	int index;

	printf(
		"Dump of q @ 0x%05x, %d entr%s, max %d, first %d\n\
    Index\tValue\n",
		(int)q, q->count, q->count == 1 ? "y" : "ies",  q->size, q->first);
	for (index = 0; index < q->count; index++) {
		value = q->table[(q->first + index) % q->size];
		printf("%3d\t%10d\n", (q->first + index) % q->size, (int)value);
	}
}
