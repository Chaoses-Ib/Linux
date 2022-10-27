# Exceptions
Classes[^csapp]:

Class | Cause | Async/sync | Return behavior
--- | --- | --- | ---
Interrupt | Signal from I/O device | Async | Always returns to next instruction
Trap | Intentional exception | Sync | Always returns to next instruction
Fault | Potentially recoverable error | Sync | Might return to current instruction
Abort | Nonrecoverable error | Sync | Never returns

[^csapp]: Computer Systems：A Programmer's Perspective