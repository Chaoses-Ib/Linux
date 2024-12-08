# Windows Subsystem for Linux 2 (WSL2)
[microsoft/WSL2-Linux-Kernel: The source for the Linux kernel used in Windows Subsystem for Linux 2 (WSL2)](https://github.com/microsoft/WSL2-Linux-Kernel)

The only difference between the WSL2 kernel and the mainline kernel is the configuration.
- [WSL2-Linux-Kernel/arch/x86/configs/config-wsl at linux-msft-wsl-6.6.y](https://github.com/microsoft/WSL2-Linux-Kernel/blob/linux-msft-wsl-6.6.y/arch/x86/configs/config-wsl)
- [configs: add new config bases for 6.6](https://github.com/microsoft/WSL2-Linux-Kernel/commit/4d72cb5bb5d14e520500e84316a5b7e0f9e572cf)

  > New config bases added to x86 and ARM64 that match Azure Linux 6.6 configs.
- [configs: general config optimizations](https://github.com/microsoft/WSL2-Linux-Kernel/commit/9e53d0dc6613381d43814771dacefbdfcd210ace)

  > To keep WSL2 kernel close to the Azure Linux kernel for maintenance ease, port over recent config optimizations and changes made to Azure Linux.

- TCP BBR is `m`, effectively disabled.

[Can a normal Linux kernel be replaced by the WSL2 kernel? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/605200/can-a-normal-linux-kernel-be-replaced-by-the-wsl2-kernel)
> The WSL kernel is designed to meet the special needs of WSL. As a consequence, it's designed to run only on Hyper-V and won't contain drivers that are needed to boot on physical hardware. You might be able to get it to boot in a Hyper-V virtual machine, but that's about it.

[How does wsl2 install its own kernel into a distribution. : r/bashonubuntuonwindows](https://www.reddit.com/r/bashonubuntuonwindows/comments/15y99q6/how_does_wsl2_install_its_own_kernel_into_a/)

Build:
- [在WSL2中啟用BBR. 名詞解釋 | by Roger | Medium](https://ch010060.medium.com/%E5%9C%A8wsl2%E4%B8%AD%E5%95%9F%E7%94%A8bbr-51516f906c72)
- [为你的WSL2编译属于自己的6.x内核并且开启BBR加速 -- 墨羽无痕的博客](https://blog.wilxx.com/archives/132)

[Microsoft's WSL2 Transitions To Linux 6.6 LTS Kernel - Phoronix](https://www.phoronix.com/news/Microsoft-WSL2-Linux-6.6-Kernel)
