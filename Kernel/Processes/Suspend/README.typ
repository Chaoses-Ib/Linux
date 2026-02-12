#import "@local/ib:0.1.0": *
#show: ib
#title[Process Suspending]
- #a([Signals], <signals>)
  - `SIGTSTP`
  - `SIGSTOP`
  - `SIGCONT`

- #a([cgroup freezer], <freezer>)
  - Used by:
    - Podman: ```sh podman pause```

- Checkpoint/Restore In Userspace (CRIU)
  - Used by:
    - OpenVZ
    - LXC/LXD/Incus
    - Docker
    - Podman: ```sh podman checkpoint```
    - Kubernetes

- System suspending (hibernation) + VM

#q[Sequences of `SIGSTOP` and `SIGCONT` are not always sufficient for stopping
and resuming tasks in userspace. Both of these signals are observable
from within the tasks we wish to freeze. While `SIGSTOP` cannot be caught,
blocked, or ignored it can be seen by waiting or ptracing parent tasks.
`SIGCONT` is especially unsuitable since it can be caught by the task. Any
programs designed to watch for `SIGSTOP` and `SIGCONT` could be broken by
attempting to use `SIGSTOP` and `SIGCONT` to stop and resume tasks.

In contrast, the cgroup freezer uses the kernel freezer code to
prevent the freeze/unfreeze cycle from becoming visible to the tasks
being frozen. This allows the bash example above and gdb to run as
expected.]

#a[Process management (computing) - Wikipedia][https://en.wikipedia.org/wiki/Process_management_(computing)]

#a[Job control (Unix) - Wikipedia][https://en.wikipedia.org/wiki/Job_control_(Unix)]

#a[Application checkpointing - Wikipedia][https://en.wikipedia.org/wiki/Application_checkpointing]

= Signals <signals>
- `SIGTSTP`
- `SIGSTOP`
- `SIGCONT`

CLI:
#footnote[
#a[bash - How to suspend and resume processes - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/2107/how-to-suspend-and-resume-processes]
]
- ```sh kill -TSTP [pid]```

= cgroup freezer <freezer>
#a[kernel.org/doc/Documentation/cgroup-v1/freezer-subsystem.txt][https://www.kernel.org/doc/Documentation/cgroup-v1/freezer-subsystem.txt]

- Used by:
  - Podman: ```sh podman pause```

#a[3.6. freezer | Resource Management Guide | Red Hat Enterprise Linux | 6 | Red Hat Documentation][https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/resource_management_guide/sec-freezer]
