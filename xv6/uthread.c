#include "types.h"
#include "stat.h"
#include "user.h"
#include "uthread.h"

#define MAX_THREADS 16
#define STACK_SIZE  8192
 
#define FREE     0
#define RUNNABLE 1
#define RUNNING  2
#define ZOMBIE   3
 
struct context {
  uint edi;
  uint esi;
  uint ebx;
  uint ebp;
  uint eip;
};
void uswtch(struct context **old, struct context *new);
struct thread {
  int         state;
  tid_t       tid;
  char       *stack;
  struct context *ctx;
};
 
static struct thread table[MAX_THREADS];
static int           current;   
static int           next_tid = 1;
static struct context main_ctx;
 
static void thread_stub(void (*fn)(void*), void *arg);

void thread_init(void) {

  for (int i = 0; i < MAX_THREADS; i++)
    table[i].state = FREE;
 
  table[0].state = RUNNING;
  table[0].tid   = next_tid++;
  table[0].stack = 0;   
  table[0].ctx   = &main_ctx;
  current = 0;
}
 
static int pick_next(void) {
  for (int i = 1; i <= MAX_THREADS; i++) {
    int idx = (current + i) % MAX_THREADS;
    if (table[idx].state == RUNNABLE)
      return idx;
  }
  return -1;
}
 
tid_t thread_create(void (*fn)(void*), void *arg) {
  int slot = -1;
  for (int i = 1; i < MAX_THREADS; i++) {
    if (table[i].state == FREE) { slot = i; break; }
  }
  if (slot == -1) return -1;
 
  char *stk = malloc(STACK_SIZE);
  if (!stk) return -1;
  memset(stk, 0, STACK_SIZE);

  uint *sp = (uint*)(stk + STACK_SIZE);
  sp--;  *sp = (uint)arg;
  sp--;  *sp = (uint)fn;
  sp--;  *sp = 0xffffffff;
  sp--;  *sp = (uint)thread_stub;
  sp--;  *sp = 0;   /* ebp */
  sp--;  *sp = 0;   /* ebx */
  sp--;  *sp = 0;   /* esi */
  sp--;  *sp = 0;   /* edi */

  table[slot].state = RUNNABLE;
  table[slot].tid   = next_tid++;
  table[slot].stack = stk;
  table[slot].ctx   = (struct context*)sp;

  return table[slot].tid;
}

static void thread_stub(void (*fn)(void*), void *arg) {
  fn(arg);
 
  table[current].state = ZOMBIE;
  thread_yield();
 
  exit();
}
 
void thread_yield(void) {

  int next = pick_next();
  if (next == -1) return;

  int prev = current;
  if (table[prev].state == RUNNING)
    table[prev].state = RUNNABLE;
  table[next].state = RUNNING;
  current = next;

  uswtch(&table[prev].ctx, table[next].ctx);
}


int thread_join(tid_t tid) {

  int slot = -1;
  for (int i = 0; i < MAX_THREADS; i++) {
    if (table[i].tid == tid) { slot = i; break; }
  }
  if (slot == -1) return -1;
 

  while (table[slot].state != ZOMBIE)
    thread_yield();
 
  if (table[slot].stack)
    free(table[slot].stack);
  table[slot].state = FREE;
  table[slot].stack = 0;
  table[slot].ctx   = 0;
 
  return 0;
}