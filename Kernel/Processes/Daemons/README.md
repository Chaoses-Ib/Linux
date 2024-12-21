# Daemons
[Wikipedia](https://en.wikipedia.org/wiki/Daemon_(computing))

> A daemon is a computer program that runs as a background process, rather than being under the direct control of an interactive user.

> In a Unix environment, the parent process of a daemon is often, but not always, the init process. A daemon is usually created either by a process forking a child process and then immediately exiting, thus causing init to adopt the child process, or by the init process directly launching the daemon. In addition, a daemon launched by forking and exiting typically must perform other operations, such as dissociating the process from any controlling terminal (tty). Such procedures are often implemented in various convenience routines such as `daemon(3)` in Unix.

[List of Unix daemons - Wikipedia](https://en.wikipedia.org/wiki/List_of_Unix_daemons)

## Development
Rust:
- [daemonize: Library for writing system daemons](https://github.com/knsd/daemonize/)

Python:
- [daemonize: Library for writing system daemons](https://github.com/knsd/daemonize/)