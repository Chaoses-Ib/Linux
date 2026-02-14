#import "@local/ib:0.1.0": *
#title[Environment Variables]
#a-badge[https://en.wikipedia.org/wiki/Environment_variable]
#a-badge(body: [$arrow$Windows])[https://github.com/Chaoses-Ib/Windows/blob/e85ff98f5e12f7093a1e1f031c65de24b15a2cfb/Kernel/Processes/Environment%20Variables.md]

#a[bash - How do I add environment variables? - Ask Ubuntu][https://askubuntu.com/questions/58814/how-do-i-add-environment-variables]

= Maximum length
- Per variable (```c MAX_ARG_STRLEN```): 128 KiB.

  #q[
  ```c MAX_ARG_STRLEN``` is essentially random but serves to
  prevent the kernel from being unduly impacted by misaddressed pointers.
  ]

  #a[shell - How to get around the Linux "Too Many Arguments" limit - Stack Overflow][https://stackoverflow.com/questions/33051108/how-to-get-around-the-linux-too-many-arguments-limit]

  #a[Raise 128KiB limit on environment variables in Linux - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/336934/raise-128kib-limit-on-environment-variables-in-linux]

- Total (```c ARG_MAX```): $>$4 KiB.
  - Debian 13: 2 MiB
  - ```sh getconf -a | grep ARG_MAX```
  - ```sh true | xargs --show-limits```

- Much smaller than Windows 10+.
  #footnote[#a[Windows/Kernel/Processes/Environment Variables.md - Chaoses-Ib/Windows][https://github.com/Chaoses-Ib/Windows/blob/e85ff98f5e12f7093a1e1f031c65de24b15a2cfb/Kernel/Processes/Environment%20Variables.md#maximum-length]]

- If too long: `Argument list too long (os error 7)`.

#a[The maximum length of arguments for a new process][https://www.in-ulm.de/~mascheck/various/argmax/]

#a[shell - What is the maximum size of a Linux environment variable value? - Stack Overflow][https://stackoverflow.com/questions/1078031/what-is-the-maximum-size-of-a-linux-environment-variable-value]

== Wine
#a[\[PATCH 2/4\] kernel32: Allow initial environment variables to be over 1024 characters long][https://www.winehq.org/pipermail/wine-devel/2018-September/132655.html]

#a[WineHQ Bugzilla -- Bug 56941 -- EA app fails to launch game if total size of environment variables exceeds \~32000 characters][https://bugs.winehq.org/show_bug.cgi?id=56941]
- #a[ntdll: Exclude biggest envars to fit 32767 chars limit in `get_initial_environment`. (!6140) - Merge requests - wine / wine - GitLab][https://gitlab.winehq.org/wine/wine/-/merge_requests/6140]

= #a[GNU GRUB environment block][https://www.gnu.org/software/grub/manual/grub/html_node/Environment-block.html]
