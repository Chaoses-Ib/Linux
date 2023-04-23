# Completely Fair Scheduler
[Wikipedia](https://en.wikipedia.org/wiki/Completely_Fair_Scheduler)

The **Completely Fair Scheduler (CFS)** is a process scheduler that was merged into the 2.6.23 (October 2007) release of the Linux kernel and is the default scheduler of the tasks of the `SCHED_NORMAL` class (i.e., tasks that have no real-time execution constraints). It handles CPU resource allocation for executing processes, and aims to maximize overall CPU utilization while also maximizing interactive performance.[^wiki] Completely Fair Scheduler implements fair-share scheduling in a highly efﬁcient and scalable manner.[^three]

Whereas most schedulers are based around the concept of a ﬁxed time slice, CFS operates a bit differently. Its goal is simple: to fairly divide a CPU evenly among all competing processes. It does so through a simple counting-based technique known as **virtual runtime (vruntime)**.

As each process runs, it accumulates `vruntime`. In the most basic case, each process’s `vruntime` increases at the same rate, in proportion with physical (real) time. When a scheduling decision occurs, CFS will pick the process with the lowest `vruntime` to run next.[^three]

This raises a question: how does the scheduler know when to stop the currently running process, and run the next one? The tension here is clear: if CFS switches too often, fairness is increased, but at the cost of performance (too much context switching); if CFS switches less often, performance is increased, but at the cost of near-term fairness. CFS manages this tension through various control parameters[^three]:
- The ﬁrst is `sched_latency`. CFS uses this value to determine how long one process should run before considering a switch (effectively determining its time slice but in a dynamic fashion). A typical `sched_latency` value is 48 (milliseconds); CFS divides this value by the number ($n$) of processes running on the CPU to determine the time slice for a process, and thus ensures that over this period of time, CFS will be completely fair.
- But what if there are “too many” processes running? Wouldn’t that lead to too small of a time slice, and thus too many context switches? To address this issue, CFS adds another parameter, `min_granularity`, which is usually set to a value like 6 ms. CFS will never set the time slice of a process to less than this value, ensuring that not too much time is spent in scheduling overhead.

CFS keeps running processes in a red-black tree.


[^wiki]: [Completely Fair Scheduler - Wikipedia](https://en.wikipedia.org/wiki/Completely_Fair_Scheduler)
[^three]: Operating Systems: Three Easy Pieces