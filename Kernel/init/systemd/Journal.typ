#import "@local/ib:0.1.0": *
#title[systemd Journal]
#a-badge[https://wiki.archlinux.org/title/Systemd/Journal]

= ```sh journalctl```
#a-badge[https://man.archlinux.org/man/journalctl.1.en]

- ```sh systemctl status <unit>```
  - Not followed.
- ```sh journalctl -u <unit> -f [-n <number of lines>]```
  - ```sh journalctl -u <unit> -e``` (i.e. `--pager-end`)

  #a[systemd - How to see the latest x lines from systemctl service log - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/422213/how-to-see-the-latest-x-lines-from-systemctl-service-log]

#a[logs - View stdout/stderr of systemd service - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/20399/view-stdout-stderr-of-systemd-service]
