# Linux Kernel
[Wikipedia](https://en.wikipedia.org/wiki/Linux_kernel)

![](https://upload.wikimedia.org/wikipedia/commons/5/5b/Linux_kernel_map.png)

## Header files
[^header-wiki]
Header file | Standard | Description
--- | --- | ---
aio.h | POSIX | Asynchronous input and output
arpa/inet.h | POSIX | Functions for manipulating numeric IP addresses (part of Berkeley sockets)
assert.h | C | Verify assumptions
complex.h | C | Complex Arithmetic, see C mathematical functions
cpio.h | POSIX | Magic numbers for the cpio archive format
ctype.h | C | Character types
dirent.h | POSIX | Allows the opening and listing of directories
dlfcn.h | POSIX | Dynamic linking
errno.h | C | Retrieving Error Number
fcntl.h | POSIX | File opening, locking and other operations
fenv.h | C | Floating-Point Environment (FPE), see C mathematical functions
float.h | C | Floating-point types, see C data types
fmtmsg.h | POSIX | Message display structures
fnmatch.h | POSIX | Filename matching
ftw.h | POSIX | File tree traversal
glob.h | POSIX | Pathname "globbing" (pattern-matching)
grp.h | POSIX | User group information and control
iconv.h | POSIX | Codeset conversion facility
inttypes.h | C | Fixed sized integer types, see C data types
iso646.h | C | Alternative spellings, see C alternative tokens
langinfo.h | POSIX | Language information constants – builds on C localization functions
libgen.h | POSIX | Pathname manipulation
limits.h | C | Implementation-defined constants, see C data types
locale.h | C | Category macros, see C localization functions
math.h | C | Mathematical declarations, see C mathematical functions
monetary.h | POSIX | String formatting of monetary units
mqueue.h | POSIX | Message queue
ndbm.h | POSIX | NDBM database operations
net/if.h | POSIX | Listing of local network interfaces
netdb.h | POSIX | Translating protocol and host names into numeric addresses (part of Berkeley sockets)
netinet/in.h | POSIX | Defines Internet protocol and address family (part of Berkeley sockets)
netinet/tcp.h | POSIX | Additional TCP control options (part of Berkeley sockets)
nl_types.h | POSIX | Localization message catalog functions
poll.h | POSIX | Asynchronous file descriptor multiplexing
pthread.h | POSIX | Defines an API for creating and manipulating POSIX threads
pwd.h | POSIX | passwd (user information) access and control
regex.h | POSIX | Regular expression matching
sched.h | POSIX | Execution scheduling
search.h | POSIX | Search tables
semaphore.h | POSIX | POSIX semaphores
setjmp.h | C | Stack environment declarations
signal.h | C | Signals, see C signal handling
spawn.h | POSIX | Process spawning
stdarg.h | C | Handle Variable Argument List
stdbool.h | C | Boolean type and values, see C data types
stddef.h | C | Standard type definitions, see C data types
stdint.h | C | Integer types, see C data types
stdio.h | C | Standard buffered input/output, see C file input/output
stdlib.h | C | Standard library definitions, see C standard library
string.h | C | Several String Operations, see C string handling
strings.h | POSIX | Case-insensitive string comparisons
stropts.h | POSIX | Stream manipulation, including ioctl
sys/ipc.h | POSIX | Inter-process communication (IPC)
sys/mman.h | POSIX | Memory management, including POSIX shared memory and memory mapped files
sys/msg.h | POSIX | POSIX message queues
sys/resource.h | POSIX | Resource usage, priorities, and limiting
sys/select.h | POSIX | Synchronous I/O multiplexing
sys/sem.h | POSIX | XSI (SysV style) semaphores
sys/shm.h | POSIX | XSI (SysV style) shared memory
sys/socket.h | POSIX | Main Berkeley sockets header
sys/stat.h | POSIX | File information (stat et al.)
sys/statvfs.h | POSIX | File System information
sys/time.h | POSIX | Time and date functions and structures
sys/times.h | POSIX | File access and modification times
sys/types.h | POSIX | Various data types used elsewhere
sys/uio.h | POSIX | Vectored I/O operations
sys/un.h | POSIX | Unix domain sockets
sys/utsname.h | POSIX | Operating system information, including uname
sys/wait.h | POSIX | Status of terminated child processes (see wait)
syslog.h | POSIX | System error logging
tar.h | POSIX | Magic numbers for the tar archive format
termios.h | POSIX | Allows terminal I/O interfaces
tgmath.h | C | Type-Generic Macros, see C mathematical functions
time.h | C | Type-Generic Macros, see C date and time functions
trace.h | POSIX | Tracing of runtime behavior (DEPRECATED)
ulimit.h | POSIX | Resource limiting (DEPRECATED in favor of `sys/resource.h`)
unistd.h | POSIX | Various essential POSIX functions and constants
utime.h | POSIX | inode access and modification times
utmpx.h | POSIX | User accounting database functions
wchar.h | C | Wide-Character Handling, see C string handling
wctype.h | C | Wide-Character Classification and Mapping Utilities, see C character classification
wordexp.h | POSIX | Word-expansion like the shell would perform

[^header-wiki]: [C POSIX library - Wikipedia](https://en.wikipedia.org/wiki/C_POSIX_library)