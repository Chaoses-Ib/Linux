# Execution
> execve() does not return on success, and the text, data, bss, and stack of the calling process are overwritten by that of the program loaded. The program invoked inherits the calling process's PID, and any open file descriptors that are not set to close on exec. Signals pending on the calling process are cleared. Any signals set to be caught by the calling process are reset to their default behaviour. The `SIGCHLD` signal (when set to `SIG_IGN`) may or may not be reset to `SIG_DFL`.

## Implementation
```cpp
// v6.1
execve(filename, argv, envp) {
  sys_execve(filename, argv, envp) {
    do_execve(filename, argv, envp) {
      do_execveat_common(fd=AT_FDCWD, filename, argv, envp, flags=0) {
        linux_binprm *bprm{ fd, filename, argv, envp }
        bprm_execve(bprm, fd, filename, flags) {
          current->in_execve = 1
          sched_exec()
          bprm->file = do_open_execat(fd, filename, flags)
          exec_binprm(bprm) {
            search_binary_handler(bprm) {
              for (linux_binfmt *fmt : &formats) {
                fmt->load_binary(bprm) {
                  switch (bprm) {
                  case elf_format:
                    load_elf_binary(bprm) {
                      begin_new_exec(bprm) {
                        task_struct *me = current
                        de_thread(tsk=me) {
                          signal_struct *sig = tsk->signal
                          sig->group_exec_task = tsk
                          sig->notify_count = zap_other_threads(tsk)
                          if (!thread_group_leader(tsk))
                            sig->notify_count--
                          while (sig->notify_count) {
                            schedule()
                          }
                        }
                        io_uring_task_cancel()
                        unshare_files()
                        set_mm_exe_file(bprm->mm, bprm->file)
                        exec_mmap(bprm->mm) {
                          task_struct *tsk = current
                          mm_struct *old_mm = current->mm
                          exec_mm_release(tsk, old_mm)
                        }
                        unshare_sighand(me)
                        flush_thread()
                        flush_signal_handlers(t=me, force_default=0) {
                          for (k_sigaction *ka : t->sighand->action) {
                            if (force_default || ka->sa.sa_handler != SIG_IGN)
                              ka->sa.sa_handler = SIG_DFL
                            sigemptyset(&ka->sa.sa_mask)
                          }
                        }
                      }
                      setup_new_exec(bprm) {
                        switch (arch) {
                        case x86:
                          arch_setup_new_exec()
                        }
                      }
                      setup_arg_pages(bprm, randomize_stack_top(STACK_TOP), executable_stack)
                      START_THREAD(elf_ex, regs, elf_entry, bprm->p)
                    }
                  }
                }
              }
            }
          }
          current->in_execve = 0
        }
      }
    }
  }
}
```

[Understanding Linux Execve System Call | Wenbo Shen 申文博](https://wenboshen.org/posts/2016-09-15-kernel-execve.html)

## [API](https://pubs.opengroup.org/onlinepubs/007908799/xsh/execl.html)
```cpp
#include <unistd.h>

extern char **environ;

int execl(const char *path, const char *arg0, ... /*, (char *)0 */);
int execv(const char *path, char *const argv[]);
int execle(const char *path,
    const char *arg0, ... /*, (char *)0, char *const envp[]*/);
int execve(const char *path, char *const argv[], char *const envp[]);

// If the process image file is not a valid executable object, execlp() and execvp() use the contents of that file as standard input to a command interpreter conforming to system().
int execlp(const char *file, const char *arg0, ... /*, (char *)0 */);
int execvp(const char *file, char *const argv[]);
```