# Build
[How To Build Linux Kernel {Step-By-Step} | phoenixNAP KB](https://phoenixnap.com/kb/build-linux-kernel)

[Welcome to Linux From Scratch!](https://www.linuxfromscratch.org/index.html)
- [Linux From Scratch](https://www.linuxfromscratch.org/lfs/view/development/)

## Configuration
[Kernel/Configuration - Gentoo Wiki](https://wiki.gentoo.org/wiki/Kernel/Configuration)

[Kernel Configuration](https://tldp.org/HOWTO/SCSI-2.4-HOWTO/kconfig.html)

## Headers
[Exporting kernel headers for use by userspace --- The Linux Kernel documentation](https://www.kernel.org/doc/html/latest/kbuild/headers_install.html)
- `make headers_install`
  - `/usr/include/asm` is missing?
- `make headers_install INSTALL_HDR_PATH=/usr/src/linux-headers-$(uname -r)`

[asm vs asm-generic in linux headers -- are they same - Stack Overflow](https://stackoverflow.com/questions/65591871/asm-vs-asm-generic-in-linux-headers-are-they-same)

[kernel - Missing asm/types.h file - Ask Ubuntu](https://askubuntu.com/questions/390253/missing-asm-types-h-file/1495186)

[linux module compilng missed folder asm - Stack Overflow](https://stackoverflow.com/questions/11730181/linux-module-compilng-missed-folder-asm)

## Troubleshooting
- Source code corruption
  
  ```sh
  # make
    CALL    scripts/checksyscalls.sh
    DESCEND objtool
    INSTALL libsubcmd_headers
    DESCEND bpf/resolve_btfids
    INSTALL libsubcmd_headers
    CC      security/apparmor/net.o
  security/apparmor/net.c:22:1: error: expected expression before ‘struct’
    22 | struct aa_sfs_entry aa_sfs_entry_network[] = {
        | ^~~~~~
  In file included from security/apparmor/net.c:19:
  security/apparmor/net_names.h:1:20: warning: ‘address_family_names’ defined but not used [-Wunused-variable]
      1 | static const char *address_family_names[] = {
        |                    ^~~~~~~~~~~~~~~~~~~~
  make[4]: *** [scripts/Makefile.build:243: security/apparmor/net.o] Error 1
  make[3]: *** [scripts/Makefile.build:480: security/apparmor] Error 2
  make[2]: *** [scripts/Makefile.build:480: security] Error 2
  make[1]: *** [/root/WSL2-Linux-Kernel/Makefile:1921: .] Error 2
  make: *** [Makefile:234: __sub-make] Error 2
  ```

- OOM

  ```sh
    CALL    scripts/checksyscalls.sh
    DESCEND objtool
    INSTALL libsubcmd_headers
    DESCEND bpf/resolve_btfids
    INSTALL libsubcmd_headers
    CHK     kernel/kheaders_data.tar.xz
    UPD     include/generated/utsversion.h
    CC      init/version-timestamp.o
    LD      .tmp_vmlinux.btf
    BTF     .btf.vmlinux.bin.o
  Killed
    LD      .tmp_vmlinux.kallsyms1
    NM      .tmp_vmlinux.kallsyms1.syms
    KSYMS   .tmp_vmlinux.kallsyms1.S
    AS      .tmp_vmlinux.kallsyms1.S
    LD      .tmp_vmlinux.kallsyms2
    NM      .tmp_vmlinux.kallsyms2.syms
    KSYMS   .tmp_vmlinux.kallsyms2.S
    AS      .tmp_vmlinux.kallsyms2.S
    LD      vmlinux
    BTFIDS  vmlinux
  libbpf: failed to find '.BTF' ELF section in vmlinux
  FAILED: load BTF from vmlinux: No data available
  make[2]: *** [scripts/Makefile.vmlinux:37: vmlinux] Error 255
  make[2]: *** Deleting file 'vmlinux'
  make[1]: *** [/root/WSL2-Linux-Kernel/Makefile:1164: vmlinux] Error 2
  make: *** [Makefile:234: __sub-make] Error 2
  ```
  [ubuntu - "FAILED: load BTF from vmlinux: Unknown error -2make: \*\*\* \[Makefile:1162: vmlinux\] Error 255", while compiling kernel-5.9.1 - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/616392/failed-load-btf-from-vmlinux-unknown-error-2make-makefile1162-vmlinu/616479#616479)
  > The issue was that pahole ran out of memory (peak memory usage of pahole was around 2.5GB).
  
  [Trying to compile a kernel results in "FAILED: load BTF from vmlinux: No such file or directory" - Issue #10299 - microsoft/WSL](https://github.com/microsoft/WSL/issues/10299)
  - 9G is enough for building WSL2.

- `__NR_syscalls` undeclared: Source code corruption / `include/asm`?

  ```sh
  In file included from ./include/linux/export.h:5,
                  from ./include/linux/linkage.h:7,
                  from ./include/linux/kernel.h:17,
                  from arch/x86/entry/common.c:10:
  arch/x86/entry/common.c: In function ‘do_syscall_x64’:
  ./arch/x86/include/asm/unistd.h:35:23: error: ‘__NR_syscalls’ undeclared (first use in this function); did you mean ‘NR_syscalls’?
    35 | # define NR_syscalls (__NR_syscalls)
        |                       ^~~~~~~~~~~~~
  ./include/linux/compiler.h:76:45: note: in definition of macro ‘likely’
    76 | # define likely(x)      __builtin_expect(!!(x), 1)
        |                                             ^
  arch/x86/entry/common.c:49:26: note: in expansion of macro ‘NR_syscalls’
    49 |         if (likely(unr < NR_syscalls)) {
        |                          ^~~~~~~~~~~
  ./arch/x86/include/asm/unistd.h:35:23: note: each undeclared identifier is reported only once for each function it appears in
    35 | # define NR_syscalls (__NR_syscalls)
        |                       ^~~~~~~~~~~~~
  ./include/linux/compiler.h:76:45: note: in definition of macro ‘likely’
    76 | # define likely(x)      __builtin_expect(!!(x), 1)
        |                                             ^
  arch/x86/entry/common.c:49:26: note: in expansion of macro ‘NR_syscalls’
    49 |         if (likely(unr < NR_syscalls)) {
        |                          ^~~~~~~~~~~
  make[4]: *** [scripts/Makefile.build:243: arch/x86/entry/common.o] Error 1
  make[3]: *** [scripts/Makefile.build:480: arch/x86/entry] Error 2
  make[2]: *** [scripts/Makefile.build:480: arch/x86] Error 2
  make[1]: *** [/root/WSL2-Linux-Kernel/Makefile:1921: .] Error 2
  make: *** [Makefile:234: __sub-make] Error 2
  ```