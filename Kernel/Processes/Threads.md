# Threads
[Wikipedia](https://en.wikipedia.org/wiki/Thread_(computing))

A thread is very much like a separate process, except for one difference: they share the same address space and thus can access the same data.[^three]

There are at least two major reasons one should use threads:
1. Parallelism
2. Avoid blocking program progress due to slow I/O

## POSIX Threads
[Wikipedia](https://en.wikipedia.org/wiki/Pthreads)

**POSIX Threads** (commonly known as **pthreads**) is an execution model that exists independently from a programming language, as well as a parallel execution model. It allows a program to control multiple different flows of work that overlap in time. Each flow of work is referred to as a thread, and creation and control over these flows is achieved by making calls to the POSIX Threads API.


[^three]: Operating Systems: Three Easy Pieces