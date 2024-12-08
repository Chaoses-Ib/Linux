# Kernel Modules
[Loadable kernel module - Wikipedia](https://en.wikipedia.org/wiki/Loadable_kernel_module)

[Kernel module - ArchWiki](https://wiki.archlinux.org/title/Kernel_module)

> Linux does not provide a stable API or ABI for kernel modules. This means that there are differences in internal structure and function between different kernel versions, which can cause compatibility problems. In an attempt to combat those problems, symbol versioning data is placed within the `.modinfo` section of loadable ELF modules. This versioning information can be compared with that of the running kernel before loading a module; if the versions are incompatible, the module will not be loaded.
>
> Other operating systems, such as Solaris, FreeBSD, macOS, and Windows keep the kernel API and ABI relatively stable, thus avoiding this problem.

[What does m mean in kernel configuration file? - Stack Overflow](https://stackoverflow.com/questions/5392756/what-does-m-mean-in-kernel-configuration-file)

## Distribution
Modules are stored in `/usr/lib/modules/(uname -r)`.

Even a module is marked as `m` in the kernel configuration, it may not be built or distributed with the distribution, e.g. [WSL2](../../Distributions/WSL2/README.md).