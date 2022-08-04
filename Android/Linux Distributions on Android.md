# Linux Distributions on Android
## chroot
A chroot on Unix-like operating systems is an operation that changes the apparent root directory for the current running process and its children.[^chroot-wiki]

- [Linux Deploy](https://github.com/meefik/linuxdeploy)

[^chroot-wiki]: [chroot - Wikipedia](https://en.wikipedia.org/wiki/Chroot)

## PRoot
PRoot is a user-space implementation of chroot, mount --bind, and binfmt_misc. It uses `ptrace()` for hijacking system call arguments and return values to fake the visible file system layout or user/group IDs.[^proot-wiki]

- [Termux](https://wiki.termux.com/wiki/PRoot)
  - RPM-based
    - Fedora
    - openSUSE
  - Debian
    - Ubuntu
    - Kali NetHunter
  - Arch Linux
  - Alpine Linux

[^proot-wiki]: [PRoot - Termux Wiki](https://wiki.termux.com/wiki/PRoot)

## Android-compatible distributions
### [Termux](https://termux.dev)
> The terminal emulator is basically an application that launches the command line program by using system call [execve(2)](https://www.man7.org/linux/man-pages/man2/execve.2.html) and redirecting standard input, output and error streams onto the display.
> 
> Most terminal applications available on Android OS work with a very limited set of utilities which are usually provided either by the operating system or other rooting tools such as Magisk. We have decided to go further and port common software usually available on GNU/Linux systems to Android OS.
> 
> Termux is neither a virtual machine nor any other kind of emulated or simulated environment. All provided packages are cross-compiled with Android NDK and only have compatibility patches to get them working on Android. The operating system does not provide full access to its file systems, so Termux cannot install package files into standard directories such as /bin, /etc, /usr or /var. Instead, all files are installed into the private application directory located at `/data/data/com.termux/files/usr`.
> 
> However, the file system is not the only difference from the traditional Linux distributions. For more information, read [Differences from Linux](https://wiki.termux.com/wiki/Differences_from_Linux).

[Termux Wiki](https://wiki.termux.com/wiki/Main_Page)  
[Repository](https://github.com/termux/termux-app)

Addons:
- [Termux:API](https://wiki.termux.com/wiki/Termux:API)  
  Access Android and Chrome hardware features.
- [Termux:Boot](https://wiki.termux.com/wiki/Termux:Boot)  
  Run scripts when your device boots.
- [Termux:Float](https://wiki.termux.com/wiki/Termux:Float)  
  Run Termux in a floating window.
- [Termux:Styling](https://wiki.termux.com/wiki/Termux:Styling)  
  Have color schemes and powerline-ready fonts customize the appearance of the Termux terminal.
- [Termux:Tasker](https://wiki.termux.com/wiki/Termux:Tasker)  
  An easy way to call Termux executables from Tasker and compatible apps.
- [Termux:Widget](https://wiki.termux.com/wiki/Termux:Widget)  
  Start small scriptlets from the home screen.