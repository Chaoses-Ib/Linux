# Memory Management
## Dynamic memory allocation
The `sbrk()` function grows or shrinks the heap by adding incr to the kernel’s `brk` pointer. If successful, it returns the old value of `brk`, otherwise it returns −1 and
sets errno to ENOMEM. If incr is zero, then `sbrk()` returns the current value of `brk`. Calling `sbrk()` with a negative incris legal but tricky because the return value
(the old value of `brk`) points to `abs(incr)` bytes past the new top of the heap.[^csapp]

Fragmentation:
- Internal fragmentation: occurs when an allocated block is larger than the payload.
- External fragmentation: occurs when there is enough aggregate free memory to satisfy an allocate request, but no single free block is large enough to handle the request.

Since external fragmentation is difficult to quantify and impossible to predict, allocators typically employ heuristics that attempt to maintain small numbers of larger free blocks rather than large numbers of smaller free blocks.[^csapp]

Data structures:
- Implicit free list[^csapp]

  The advantage of an implicit free list is simplicity. A significant disadvantage is that the cost of any operation that requires a search of the free list, such as placing allocated blocks, will be linear in the total number of allocated and free blocks in the heap.

- Explicit free list[^csapp]

  A disadvantage of explicit lists in general is that free blocks must be large  enough to contain all of the necessary pointers, as well as the header and possibly a footer. This results in a larger minimum block size and increases the potential for internal fragmentation.

- Segregated free list[^csapp]

  The segregated fits approach is a popular choice with production-quality allocators such as the GNU malloc package provided in the C standard library because it is both fast and memory efficient. Search times are reduced because searches are limited to particular parts of the heap instead of the entire heap. Memory utilization can improve because of the interesting fact that a simple first-fit search of a segregated free list approximates a best-fit search of the entire heap.


[^csapp]: Computer Systems：A Programmer's Perspective