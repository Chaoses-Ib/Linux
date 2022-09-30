# Unix-like
A **Unix-like (UN\*X or \*nix)** operating system is one that behaves in a manner similar to a Unix system.[^wiki]

![](https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Unix_history-simple.svg/1200px-Unix_history-simple.svg.png)

Growing incompatibility among these systems led to the creation of interoperability standards, including POSIX and the Single UNIX Specification.

## POSIX
The **Portable Operating System Interface (POSIX)** is a family of standards specified by the IEEE Computer Society for maintaining compatibility between operating systems. POSIX defines both the system- and user-level application programming interfaces (API), along with command line shells and utility interfaces, for software compatibility (portability) with variants of Unix and other operating systems. POSIX is also a trademark of the IEEE. POSIX is intended to be used by both application and system developers.[^posix-wiki]

## Single UNIX Specification
The **Single UNIX Specification (SUS)** is a standard for computer operating systems, compliance with which is required to qualify for using the "UNIX" trademark. The standard specifies programming interfaces for the C language, a command-line shell, and user commands. The latest SUS consists of two parts: the base specifications technically identical to POSIX, and X/Open Curses specification. 

If an operating system is submitted to The Open Group for certification, and passes conformance tests, then it is deemed to be compliant with a UNIX standard such as UNIX 98 or UNIX 03. Very few BSD and Linux-based operating systems are submitted for compliance with the Single UNIX Specification, although system developers generally aim for compliance with POSIX standards, which form the core of the Single UNIX Specification.[^sus-wiki]

## Compatibility layers
Some non-Unix-like operating systems provide a Unix-like compatibility layer, with varying degrees of Unix-like functionality[^wiki]:
- Cygwin, MSYS, and MSYS2 each provide a GNU environment on top of the Microsoft Windows user API, sufficient for most common open source software to be compiled and run.
- Windows NT-type systems have a POSIX environmental subsystem.
- Windows Subsystem for Linux provides a Linux-compatible kernel interface developed by Microsoft and containing no Linux code, with Ubuntu user-mode binaries running on top of it.

[^wiki]: [Unix-like - Wikipedia](https://en.wikipedia.org/wiki/Unix-like)
[^posix-wiki]: [POSIX - Wikipedia](https://en.wikipedia.org/wiki/POSIX)
[^sus-wiki]: [Single UNIX Specification - Wikipedia](https://en.wikipedia.org/wiki/Single_UNIX_Specification)