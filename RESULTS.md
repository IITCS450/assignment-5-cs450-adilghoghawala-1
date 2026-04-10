#RESULTS.md

#Limitations
- Max 16 threads (including main)
- 8192 bytes per thread stack
- Cooperative only — threads must yield manually
- Mutex does not support nesting

#Context-Switching Approach

The context switching is handled in 'uswitch.S'. Four callee-saved registers are saved (ebp, ebx, esi, edi) onto the current stack. Then saves the stack pointer into old, loads the new stack pointer, restores the registers, and returns, ending up in the new thread. 

Thread_create() creates the new thread stacks with registers zeroed and eip pointing to thread_stub. This calls the thread function and marks the thread ZOMBIE when it returns. The scheduler uses a round-robin, thread_join() yields in a loop until the target thread finishes.  