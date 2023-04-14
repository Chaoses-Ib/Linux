# Process Scheduling
[Wikipedia](https://en.wikipedia.org/wiki/Scheduling_(computing))

## Scheduling metrics
Performance metrics:
- Turnaround time

  The turnaround time of a job is defined as the time at which the job completes minus the time at which the job arrived in the system:

  $$T_{turnaround}=T_{completion}-T_{arrival}$$

- Response time

  The response time of a job is defined as the time from when the job arrives in a system to the first time it is scheduled:

  $$T_{response}=T_{firstrun}-T_{arrival}$$

Fairness metrics:
- Jain’s Fairness Index

## Policies
### The runtime of each job is known
- First in, first out (first come, first served)

  Convoy effect：在先被加入的 workload 需要很长时间时平均 turnaround time 会很大。

- Shorted job first

  在所有 workload 同时到达的情况下，SJF 对于平均 turnaround time 是最优的。

- Shortest time-to-completion first (STCF, preemptive SJF)

  在 workload 到达时 preempt 当前 workload，执行剩余时间最短的 workload。

  STCF 对于平均 turnaround time 是最优的。但当 short job 不断被加入时，long job 会得不到执行。
  
  几乎所有的现代 scheduler 都是 preemptive 的，即可以打断当前 workload 的执行。

- [Highest response ratio next](https://en.wikipedia.org/wiki/Highest_response_ratio_next) (highest penalty ratio next)
  
  In HRRN, the next job is the job with the highest response ratio:

  $$\text{response ratio}
  ={\text{wating time of a process so far + estimated run time} \over \text{estimated run time}}
  =1 + {\text{wating time of a process so far} \over \text{estimated run time}}$$

  In practice, HRRN may incur too many context switches.

- Round-Robin (time-slicing)

  Instead of running jobs to completion, RR runs a job for a **time slice (scheduling quantum)** and then switches to the next job in the run queue.

  理论上来说，time slice 越小越好，但过多的 context switches 会降低资源利用率。

  RR 对于 response time 表现较好，对于 turnaround time 表现较差。
  
  实际上，越 fair 的 scheduler，对于 turnaround time 的表现就会越差。

I/O:
- STCF with I/O

  以 I/O 操作为界限，将 job 分割为多个 sub-job 进行调度，从而实现允许 overlap。

### The runtime of each job is unknown
- Exponentially weighted moving average (EMA)

- Multi-level Feedback Queue (MLFQ)

  The MLFQ has a number of distinct **queues**, each assigned a different **priority level**. At any given time, a job that is ready to run is on a single queue. MLFQ uses priorities to decide which job should run at a given time. If more than one job is in a given queue, MLFQ will just use round-robin scheduling. MLFQ 通过 queues 实现了 SJF 和 round-robin 的折中。

  Rather than giving a fixed priority to each job, MLFQ varies the priority of a job based on its observed behavior:
  - When a job enters the system, it is placed at the highest priority (the topmost queue).
  - Once a job uses up its time allotment at a given level (regardless of how many times it has given up the CPU), its priority is reduced (i.e., it moves down one queue).
  
    Or insecurely:
    - If a job uses up an entire time slice while running, its priority is reduced (i.e., it moves down one queue).
    - If a job gives up the CPU before the time slice is up, it stays at the same priority level.
  - After some time period $S$, move all the jobs in the system to the topmost queue.

  MLFQ optimizes turnaround time and response time.

  Many systems, including BSD UNIX derivatives, Solaris, and Windows NT and subsequent Windows operating systems use a form of MLFQ as their base scheduler.