# Exit
## Terminating processes
```c
void exit(int status);
```

## Reaping child processes
```c
#include <sys/wait.h>

// waitpid(-1, &wstatus, 0)
pid_t wait(int *wstatus);

// Returns: PID of child if OK, 0 (if WNOHANG), or −1 on error
pid_t waitpid(pid_t pid, int *statusp, int options);
```

When `SIGCHLD` is sent to a process which has been suspended by calling `waitpid()`, what is the order between executing `SIGCHLD` handler and resuming from suspension by `waitpid()`?[^reap-waitpid-sigchld]

```c
#include <sys/wait.h>
#include <signal.h>
#include <stdio.h>

void sigchld_handler(int sig) {
    printf("sigchld: %d\n", wait(NULL));
}

int main() {
    signal(SIGCHLD, sigchld_handler);
    if (fork() == 0) {
        sleep(1);
        exit(0);
    }
    printf("main: %d\n", wait(NULL));
}
```
Output:
```
sigchld: -1
main: 12345
```
Note that although `sigchld_handler()` outputs first, it does not reap the child process.

[^reap-waitpid-sigchld]: [linux - What is the relation between SIGCHLD and `waitpid()` or`wait()`? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/616555/what-is-the-relation-between-sigchld-and-waitpid-orwait)