# Kernel Modules
[Loadable kernel module - Wikipedia](https://en.wikipedia.org/wiki/Loadable_kernel_module)

[Kernel module - ArchWiki](https://wiki.archlinux.org/title/Kernel_module)

`lsmod`

> Linux does not provide a stable API or ABI for kernel modules. This means that there are differences in internal structure and function between different kernel versions, which can cause compatibility problems. In an attempt to combat those problems, symbol versioning data is placed within the `.modinfo` section of loadable ELF modules. This versioning information can be compared with that of the running kernel before loading a module; if the versions are incompatible, the module will not be loaded.
>
> Other operating systems, such as Solaris, FreeBSD, macOS, and Windows keep the kernel API and ABI relatively stable, thus avoiding this problem.

[What does m mean in kernel configuration file? - Stack Overflow](https://stackoverflow.com/questions/5392756/what-does-m-mean-in-kernel-configuration-file)

## Build
[Building External Modules --- The Linux Kernel documentation](https://www.kernel.org/doc/html/latest/kbuild/modules.html)

`make modules_prepare`

[How can I prepare a Linux source tree so an external module can be compiled against it? - Stack Overflow](https://stackoverflow.com/questions/70707519/how-can-i-prepare-a-linux-source-tree-so-an-external-module-can-be-compiled-agai)

### Symbols
[kernel - How to generate Module.symvers? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/24704/how-to-generate-module-symvers)
- `make modules`

> When building an external module, the build system needs access to the symbols from the kernel to check if all external symbols are defined. This is done in the MODPOST step. modpost obtains the symbols by reading `Module.symvers` from the kernel source tree. During the MODPOST step, a new `Module.symvers` file will be written containing all exported symbols from that external module.

`KBUILD_MODPOST_WARN=1`

[Compile Linux kernel module without Module.symvers - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/473749/compile-linux-kernel-module-without-module-symvers)

## Distribution
Modules are stored in `/usr/lib/modules/(uname -r)`.

Even a module is marked as `m` in the kernel configuration, it may not be built or distributed with the distribution, e.g. [WSL2](../../Distributions/WSL2/README.md).

## [Dynamic Kernel Module System (DKMS)](https://github.com/dell/dkms)
[Wikipedia](https://en.wikipedia.org/wiki/Dynamic_Kernel_Module_Support)

[dkms(8): Dynamic Kernel Module Support - Linux man page](https://linux.die.net/man/8/dkms)
- `--kernelsourcedir`: Defaults to `/lib/modules/$(uname -r)/build`
- WSL2: `dkms autoinstall --kernelsourcedir /root/WSL2-Linux-Kernel --config Microsoft/config-wsl`
