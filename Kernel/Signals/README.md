# Signals
Signals[^csapp]:

Number | Name | Default action | Corresponding event
--- | --- | --- | ---
1 | SIGHUP | Terminate | Terminal line hangup
2 | SIGINT | Terminate | Interrupt from keyboard
3 | SIGQUIT | Terminate | Quit from keyboard
4 | SIGILL | Terminate | Illegal instruction
5 | SIGTRAP | Terminate and dump core | Trace trap
6 | SIGABRT | Terminate and dump core | Abort signal from `abort()`
7 | SIGBUS | Terminate | Bus error
8 | SIGFPE | Terminate and dump core | Floating-point exception
9 | SIGKILL | Terminate | Kill program
10 | SIGUSR1 | Terminate | User-defined signal 1
11 | SIGSEGV | Terminate and dump core | Invalid memory reference (seg fault)
12 | SIGUSR2 | Terminate | User-defined signal 2
13 | SIGPIPE | Terminate | Wrote to a pipe with no reader
14 | SIGALRM | Terminate | Timer signal from `alarm()`
15 | SIGTERM | Terminate | Software termination signal
16 | SIGSTKFLT | Terminate | Stack fault on coprocessor
17 | SIGCHLD | Ignore | A child process has stopped or terminated
18 | SIGCONT | Ignore | Continue process if stopped
19 | SIGSTOP | Stop until next SIGCONT | Stop signal not from terminal
20 | SIGTSTP | Stop until next SIGCONT | Stop signal from terminal
21 | SIGTTIN | Stop until next SIGCONT | Background process read from terminal
22 | SIGTTOU | Stop until next SIGCONT | Background process wrote to terminal
23 | SIGURG | Ignore | Urgent condition on socket
24 | SIGXCPU | Terminate | CPU time limit exceeded
25 | SIGXFSZ | Terminate | File size limit exceeded
26 | SIGVTALRM | Terminate | Virtual timer expired
27 | SIGPROF | Terminate | Profiling timer expired
28 | SIGWINCH | Ignore | Window size changed
29 | SIGIO | Terminate | I/O now possible on a descriptor
30 | SIGPWR | Terminate | Power failure

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
Each signal type has a predefined *default action*, which is one of the following[^csapp]:
- The process terminates
- The process terminates and dumps core
- The process stops (suspends) until restarted by a SIGCONT signal
- The process ignores the signal

The `signal()` can change the action associated with a signal *signum*.

[^csapp]: Computer Systems：A Programmer's Perspective