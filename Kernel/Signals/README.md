# Signals
## Sending
- System events
  
  e.g. divide-by-zero error, the termination of a child process
- `kill()`

## Delivering
A signal that has been sent but not yet received is called a **pending signal**. When a signal is **blocked**, it can be delivered, but the resulting pending signal will not be received until the process unblocks the signal.

For each process, the kernel maintains the set of pending signals in the `pending` bit vector, and the set of blocked signals in the `blocked` bit vector. At any point in time, there can be at most one pending signal of a particular type.

Blocking mechanism:
- Implicit blocking mechanism  
  By default, the kernel blocks any pending signals of the type currently being processed by a handler.
- Explicit blocking mechanism  
  Applications can explicitly block and unblock selected signals using the `sigprocmask()` and its helpers.

When the kernel switches a process *p* from kernel mode to user mode, it checks the set of unblocked pending signals (`pending & ~blocked`) for *p*. However, if the set is nonempty, then the kernel chooses some signal *k* in the set (typically the smallest *k*) and forces *p* to receive signal *k*.[^csapp]

## Receiving
Each signal type has a predeﬁned *default action*, which is one of the following[^csapp]:
- The process terminates
- The process terminates and dumps core
- The process stops (suspends) until restarted by a SIGCONT signal
- The process ignores the signal

The `signal()` can change the action associated with a signal *signum*.

[^csapp]: Computer Systems：A Programmer's Perspective