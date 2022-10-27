# Fork
```c
// Returns: 0 to child, PID of child to parent, −1 on error
pid_t fork();
```

## Implementation
```cpp
// v6.1
fork() {
  sys_fork() {
    kernel_clone_args args{ .exit_signal = SIGCHLD }
    kernel_clone(&args) {
      task_struct *p = copy_process(pid=NULL, trace, node=NUMA_NO_NODE, args) {
        task_struct *p = dup_task_struct(current, node)
        init_sigpending(&p->pending)
        sched_fork(clone_flags, p)
        perf_event_init_task(p, clone_flags)
        audit_alloc(p)
        shm_init_task(p)
        security_task_alloc(p, clone_flags)
        copy_semundo(clone_flags, p)
        copy_files(clone_flags, p)
        copy_fs(clone_flags, p)
        copy_sighand(clone_flags, p)
        copy_signal(clone_flags, p)
        copy_mm(clone_flags, p)
        copy_namespaces(clone_flags, p)
        copy_io(clone_flags, p)
        copy_thread(p, args)
        stackleak_task_init(p)
        if (pid != &init_struct_pid)
          pid = alloc_pid(p->nsproxy->pid_ns_for_children, args->set_tid, args->set_tid_size)
        p->pid = pid_nr(pid)
        copy_seccomp(p)
      }
    }
  }
}
```