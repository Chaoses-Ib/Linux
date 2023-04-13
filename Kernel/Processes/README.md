# Processes
## Direct execution
**Direct execution** 指 kernel 直接执行 user program。

**Limited direct execution** 为了限制 user program 的权限，引入了 **kernel mode** 和 **user mode**，user program 需要通过 **system call** 来进行权限敏感操作。

Kernel 可以通过等待 system call 来重新获得控制权，称为 **cooperative**；也可以通过 timer interrupt 来打断 user program 来获得控制权，称为 **non-cooperative**；或者，也可以 reboot the machine。

在重新获得控制权后，kernel 需要通过 **scheduler** 来决定接下来要执行哪个 process，如果要执行的是另外一个 process，就需要进行 **context switch**。