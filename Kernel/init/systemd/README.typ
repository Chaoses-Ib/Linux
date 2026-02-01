#import "@local/ib:0.1.0": *
#title[#a[systemd][https://systemd.io/]]
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

= Unit files
#a-badge[https://man.archlinux.org/man/systemd.unit.5]

- `/etc/systemd/system`, `/lib/systemd/system`
  - ```sh systemctl enable /example.service``` will create symlink in `/etc/systemd/system`.

  #a[configuration - Systemd service files in non-default directory - Ask Ubuntu][https://askubuntu.com/questions/897312/systemd-service-files-in-non-default-directory]

  #a[linux - Can I group a set of related systemd service files into a common directory under `/etc/systemd/system`? - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/773523/can-i-group-a-set-of-related-systemd-service-files-into-a-common-directory-under]

- ```sh systemctl daemon-reload```
  - ```sh systemctl edit --full```

  #a[Automatic daemon-reload - Issue \#14757 - systemd/systemd][https://github.com/systemd/systemd/issues/14757]

  #a[Can anyone explain why daemon-reload isn't automatically called when needed? : r/systemd][https://www.reddit.com/r/systemd/comments/1l3k30b/can_anyone_explain_why_daemonreload_isnt/]

#a[Using systemd unit files to customize and optimize your system | Red Hat Enterprise Linux | 9 | Red Hat Documentation][https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/using_systemd_unit_files_to_customize_and_optimize_your_system/index]
- #a[Chapter 1. Working with systemd unit files | Using systemd unit files to customize and optimize your system | Red Hat Enterprise Linux | 9 | Red Hat Documentation][https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/using_systemd_unit_files_to_customize_and_optimize_your_system/assembly_working-with-systemd-unit-files_working-with-systemd]

== Service
#a-badge[https://man.archlinux.org/man/systemd.service.5.en]

- If you do not specify the suffix, systemctl will assume `.service`.

- `ExecStart`
  - `ExecStartPre`
  - `ExecStartPost`
  - Not relative to `WorkingDirectory`.
    #footnote[#a[18.04 - Systemd service, Working Directory not change the directory - Ask Ubuntu][https://askubuntu.com/questions/1063153/systemd-service-working-directory-not-change-the-directory]]

  #a[linux - Systemd with multiple execStart - Stack Overflow][https://stackoverflow.com/questions/48195340/systemd-with-multiple-execstart]

- ```conf Environment="K=V"```

  #a[How to set environment variable in systemd service? - Server Fault][https://serverfault.com/questions/413397/how-to-set-environment-variable-in-systemd-service]

= cgroups
- #q[By default, systemd creates a new cgroup under the `system.slice` for each service it monitors.]
- ```conf Slice=child-parent-ancestor.slice```

#a[Managing cgroups with systemd][https://www.redhat.com/en/blog/cgroups-part-four]

#a[New Control Group Interfaces][https://systemd.io/CONTROL_GROUP_INTERFACE/]
