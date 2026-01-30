#import "@local/ib:0.1.0": *
#title[systemd]
#a-badge[https://en.wikipedia.org/wiki/Systemd]
#a-badge[https://github.com/systemd/systemd]
#a-badge[https://wiki.debian.org/systemd]
#a-badge[https://wiki.archlinux.org/title/Systemd]

#q[
Since 2015, nearly all Linux distributions have adopted systemd.
It has been praised by developers and users of distributions that adopted it
for providing a stable, fast out-of-the-box solution for issues that had existed in the Linux space for years.
At the time of its adoption, it was the only parallel boot and init system offering centralized management of
processes, daemons, services, and mount points.

Critics of systemd contend it suffers from feature creep and has damaged interoperability across Unix-like operating systems (as it does not run on non-Linux Unix derivatives like BSD or Solaris).
In addition, they contend systemd's large feature set creates a larger attack surface.
This has led to the development of several minor Linux distributions replacing systemd with other init systems like SysVinit or OpenRC.
]

- `/etc/systemd/system`, `/lib/systemd/system`
