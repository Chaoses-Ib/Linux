# Exceptions
An **exception** is an abrupt change in the control flow in response to some
change in the processor’s state.[^csapp]

Classes[^csapp]:

Class | Cause | Async/sync | Return behavior
--- | --- | --- | ---
Interrupt | Signal from I/O device | Async | Always returns to next instruction
Trap | Intentional exception | Sync | Always returns to next instruction
Fault | Potentially recoverable error | Sync | Might return to current instruction
Abort | Nonrecoverable error | Sync | Never returns

In x86[^sdm]:
- An **interrupt** is an asynchronous event that is typically triggered by an I/O device.
- An **exception** is a synchronous event that is generated when the processor detects one or more predefined conditions while executing an instruction. The IA-32 architecture specifies three classes of exceptions: faults, traps, and aborts.
- The processor responds to interrupts and exceptions in essentially the same way. When an interrupt or exception is signaled, the processor halts execution of the current program or task and switches to a handler procedure that has been written specifically to handle the interrupt or exception condition. When the handler has completed handling the interrupt or exception, program control is returned to the interrupted program or task.

[^csapp]: Computer Systems：A Programmer's Perspective
[^sdm]: “Intel® 64 and IA-32 Architectures Software Developer Manuals.” https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html.