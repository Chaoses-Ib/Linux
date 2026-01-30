#import "@local/ib:0.1.0": *
#title[init Systems]
#a-badge[https://en.wikipedia.org/wiki/Init]

#q[In Unix-like computer operating systems, *init* (short for _initialization_) is the first process started during booting of the operating system.
- Init is a daemon process that continues running until the system is shut down.
- It is the direct or indirect ancestor of all other processes and automatically adopts all orphaned processes.
- Init is started by the kernel during the booting process; a kernel panic will occur if the kernel is unable to start it, or it should die for any reason.
- Init is typically assigned process identifier 1.
]
