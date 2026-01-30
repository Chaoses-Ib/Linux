#import "@local/ib:0.1.0": *
#title[sysctl]
#a-badge[https://wiki.archlinux.org/title/Sysctl]

- `/etc/sysctl.d/99-sysctl.conf`
- `sysctl --system`
- Default values

  ```sh sysctl -a > sysctl-default.conf``` at boot.

  #a[debian - How to reset sysctl to its OS defaults? - Server Fault][https://serverfault.com/questions/417944/how-to-reset-sysctl-to-its-os-defaults]
- `sysctl -p a.conf`
