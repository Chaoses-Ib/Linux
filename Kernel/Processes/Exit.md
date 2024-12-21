# Exit
## Terminating processes
```c
void exit(int status);
```

## Reaping child processes
### Implementation
```cpp
// v6.1

wait(status) {
  sys_wait4(-1, status, options=0, ru=NULL)
}

waitpid(pid, status, options) {
  sys_wait4(upid, stat_addr, options, ru=NULL)
}

wait4(pid, status, options, rusage) {
  sys_wait4(pid, status, options, rusage)
}

enum pid_type {
  PIDTYPE_PID
  PIDTYPE_TGID
  PIDTYPE_PGID
  PIDTYPE_SID
  PIDTYPE_MAX
}

sys_wait4(upid, stat_addr, options, ru=NULL) {
  kernel_wait4(upid, stat_addr, options, ru) {
    wait_ops {
      .wo_type, .wo_pid = {
        upid == -1: PIDTYPE_MAX
        upid < 0: PIDTYPE_PGID, find_get_pid(-upid)
        upid == 0: PIDTYPE_PGID, get_task_pid(current, PIDTYPE_PGID)
        upid > 0: PIDTYPE_PID, find_get_pid(upid)
      }
      .wo_flags = options | WEXITED
      .wo_info = NULL
      .wo_stat = 0
      .wo_rusage = ru
    }
    do_wait(&wo) {
      switch (wo->wo_type) {
        PIDTYPE_PID:
          retval = do_wait_pid(wo) {
            retval = wait_consider_task(wo, ptrace=false, target=pid_task(wo->wo_pid, PIDTYPE_TGID))
            if not retval
              retval = wait_consider_task(wo, ptrace=true, target=pid_task(wo->wo_pid, PIDTYPE_PID))
          }
        default:
          while_each_thread(current, tsk) {
            retval = do_wait_thread(wo, tsk)
            if not retval
              retval = ptrace_do_wait(wo, tsk)
            if wo->wo_flags & WNOTHREAD
              break
          }
      }
    }
    put_pid(pid)
  }
}
```

### API
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

## Exit codes
[Wikipedia](https://en.wikipedia.org/wiki/Exit_status)

- `0`: Success

- `1`: Failure

- BSD
  - [exitcode: Preferred system exit codes as defined by sysexits.h](https://github.com/benwilber/exitcode)
  - [rust-exit-code: Commonly used exit codes for usage in applications.](https://github.com/Fleshgrinder/rust-exit-code)

- Windows
  - `0xC0000005`: `STATUS_ACCESS_VIOLATION`
  - `0xC000013A`: `STATUS_CONTROL_C_EXIT`
  - `0xC0000409`: `STATUS_STACK_BUFFER_OVERRUN`
  
  [Implement ExitCodeExt for Windows - Issue #48 - rust-lang/libs-team](https://github.com/rust-lang/libs-team/issues/48)

  [c - Is there a Windows equivalent of standard(ish) UN\*X process exit codes? - Stack Overflow](https://stackoverflow.com/questions/31518598/is-there-a-windows-equivalent-of-standardish-unx-process-exit-codes)

- Rust
  - `101`: Panic

  [Exit codes - Command Line Applications in Rust](https://rust-cli.github.io/book/in-depth/exit-code.html)

API:
- [Wait for pid without polling using kevent on MacOS/BSD - Issue #1415 - GuillaumeGomez/sysinfo](https://github.com/GuillaumeGomez/sysinfo/issues/1415)