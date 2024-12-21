# Processes
## Direct execution
**Direct execution** 指 kernel 直接执行 user program。

**Limited direct execution** 为了限制 user program 的权限，引入了 **kernel mode** 和 **user mode**，user program 需要通过 **system call** 来进行权限敏感操作。

Kernel 可以通过等待 system call 来重新获得控制权，称为 **cooperative**；也可以通过 timer interrupt 来打断 user program 来获得控制权，称为 **non-cooperative**；或者，也可以 reboot the machine。

在重新获得控制权后，kernel 需要通过 **scheduler** 来决定接下来要执行哪个 process，如果要执行的是另外一个 process，就需要进行 **context switch**。

## API
Rust:
- Child
  - [rust-subprocess: Execution of and interaction with external processes and pipelines](https://github.com/hniksic/rust-subprocess)
  - [bossy: Opinionated convenience wrappers for `std::process::Command` and friends.](https://github.com/BrainiumLLC/bossy)
  - [3228-process-process\_group - The Rust RFC Book](https://rust-lang.github.io/rfcs/3228-process-process_group.html)
  - [wait-timeout: Waiting on a child process with a timeout in Rust](https://github.com/alexcrichton/wait-timeout)
  - [child\_wait\_timeout: The Child Wait Timeout crate provides a simple and efficient way to wait for a child process to exit with a timeout. It supports different implementations depending on the platform and available features, ensuring performance, scalability and reliability.](https://github.com/fplu/child_wait_timeout)
  - [proc\_guard: A process guard in Rust ensures the proper destruction of a child process by implementing the Drop trait to automatically terminate the child process when the guard goes out of scope.](https://github.com/fplu/proc_guard)
  - [process\_guard-rs: Guard a process by terminating it on drop](https://github.com/49nord/process_guard-rs)
    - Linux only
  - [async-shell](https://github.com/bk-rs/async-shell)
- [sysinfo: Cross-platform library to fetch system information](https://github.com/GuillaumeGomez/sysinfo)
  - [Wait for pid without polling using kevent on MacOS/BSD - Issue #1415](https://github.com/GuillaumeGomez/sysinfo/issues/1415)
  - [IbProcessGuard/wait-parent](https://github.com/Chaoses-Ib/IbProcessGuard)
- [procinfo-rs: A Rust library for accessing Linux process and system information](https://github.com/danburkert/procinfo-rs)
- [waitpid-any: waitpid(2) but for arbitrary non-child processes](https://github.com/oxalica/waitpid-any)
- Windows: [OpenByteDev/processes: A utility library for accessing processes and modules on windows.](https://github.com/OpenByteDev/processes)

[process - Why can the waitpid system call only be used with child processes? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/214908/why-can-the-waitpid-system-call-only-be-used-with-child-processes)

[c - Make child process wait for parent - Stack Overflow](https://stackoverflow.com/questions/16269975/make-child-process-wait-for-parent)

## Process guardians
- Start guardian, spawn and watch child process
  - Slower start
  - Dual usable entries
    - Single executable + CLI argument multiplexing

  Tools:
  - [diffstorm/processWatchdog: The Process Watchdog is a Linux-based utility designed to start, monitor and manage processes specified in a configuration file. It ensures the continuous operation of these processes by periodically checking their status and restarting them if necessary.](https://github.com/diffstorm/processWatchdog/)
    - Heartbeat
  - [sivann/restarter](https://bitbucket.org/sivann/restarter)
    - Timeout
    - PID file
  - .NET
    - [chebum/Supervisor: Simple process supervisor for Windows](https://github.com/chebum/Supervisor)
    - [MistressPlague/AutoRestartProcess: A Pretty Simple Yet Comprehensive Tool For Restarting Processes If They Die - Useful For Servers](https://github.com/MistressPlague/AutoRestartProcess)
  - Pascal: [claytonaalves/process-guardian: Launch and watch another process, restarting it if it crashes](https://github.com/claytonaalves/process-guardian)

- Start process, spawn guardian to watch parent process, then spawn and watch child process
  - Inheritance problem
  - Possibly miss
  - Dual logic: watch parent and child

- Start process, spawn guardian to watch parent process, then spawn child process and kill old guardian
  - Can fast recover if using single executable
  - Get exit code of parent process is not widely supported
    - Kill child on normal exit
  - Inheritance problem
  - Possibly miss
  - Limited rate limit
    - Spawn new guardian after a certain time
      - Cannot log all exit codes
    - Spawn new guardian and wait a certain time before respawn
  - For single executable, the child process will have the `--wait-parent` argument even after the parent is aborted
    - Multiplexing by parent process, instead of CLI argument?

  Tools:
  - Windows: [IbProcessGuard](https://github.com/Chaoses-Ib/IbProcessGuard)

[How to restart program automatically if it crashes in Windows? - Stack Overflow](https://stackoverflow.com/questions/9344235/how-to-restart-program-automatically-if-it-crashes-in-windows)

[debian - Best way to auto-restart mono process after crash - Super User](https://superuser.com/questions/1218575/best-way-to-auto-restart-mono-process-after-crash)

[bash - How to automatically restart a linux background process if it fails? - Super User](https://superuser.com/questions/507576/how-to-automatically-restart-a-linux-background-process-if-it-fails)

[Is possible to re-run current process (windows, linux, osx) as if the user close it then start again? : r/rust](https://www.reddit.com/r/rust/comments/et01h2/is_possible_to_rerun_current_process_windows/)