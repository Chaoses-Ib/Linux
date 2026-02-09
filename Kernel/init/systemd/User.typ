#import "@local/ib:0.1.0": *
#show: ib
#title[systemd User]

- #a([User units], <user>)
- #a([```conf Service.User```], <service.user>)
- sudo
- PolicyKit

#a[linux - What is the difference between systemd's user and system services? - Super User][https://superuser.com/questions/853717/what-is-the-difference-between-systemds-user-and-system-services]

#a[systemd ```conf User=``` vs ```sh --user``` - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/548499/systemd-user-vs-user]

#a[linux - systemd: Grant an unprivileged user permission to alter one specific service - Server Fault][https://serverfault.com/questions/841099/systemd-grant-an-unprivileged-user-permission-to-alter-one-specific-service]

#a[sudo - How could we allow non-root users to control a systemd service? - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/192706/how-could-we-allow-non-root-users-to-control-a-systemd-service]

= User units <user>
#a-badge[https://wiki.archlinux.org/title/Systemd/User]

- ```sh systemctl --user```

- User units are located in the following directories:
  - `~/.config/systemd/user/`
  - `/etc/systemd/user/`
  - `~/.local/share/systemd/user/`
  - `/usr/lib/systemd/user/`

- #q(block: false)[
  To allow the user unit to #a[start at boot][https://unix.stackexchange.com/q/251211/20805],
  `root` must enable linger for the account i.e.
  ```sh
  sudo loginctl enable-linger username
  ```
  The unit must also be ```conf WantedBy=default.target```.]
  - #strike[Better ```conf WantedBy=multi-user.target``` .] \
    But not ```conf WantedBy=multi-user.target``` .
    
    #a[Why do most people use ```conf WantedBy=multi-user.target``` instead of WantedBy=default.target to start services on startup? : r/systemd][https://www.reddit.com/r/systemd/comments/1fuhzcw/why_do_most_people_use_wantedbymultiusertarget/]

    #a[ubuntu - Systemd service does not start (```conf WantedBy=multi-user.target```) - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/666509/systemd-service-does-not-start-wantedby-multi-user-target]

    #a[Remove ```conf multi-user.target``` from all systemd units - Issue \#12438 - containers/podman][https://github.com/containers/podman/issues/12438]

- #q[`Failed to connect to user scope bus via local transport: Operation not permitted (consider using --machine=<user>@.host --user to connect to bus of other user`]

  ```sh
  # unset XDG_RUNTIME_DIR
  # unset DBUS_SESSION_BUS_ADDRESS
  export XDG_RUNTIME_DIR="/run/user/$UID"
  export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$UID/bus"
  ```
  - `root` in unit file:
    ```conf
    [Service]
    User=root
    Environment="XDG_RUNTIME_DIR=/run/user/0"
    Environment="DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/0/bus"
    ```

  #a[`systemctl --user`: Failed to connect to user scope bus via local tra... / System Administration / Arch Linux Forums][https://bbs.archlinux.org/viewtopic.php?id=302556]

  #a[server - Unable to create SystemD user service "Failed to connect to bus: Permission denied" - Ask Ubuntu][https://askubuntu.com/questions/1470010/unable-to-create-systemd-user-service-failed-to-connect-to-bus-permission-deni]

  #a[linux - `systemctl --user` results in "Failed to connect to bus" in google compute instance - Super User][https://superuser.com/questions/1668516/systemctl-user-results-in-failed-to-connect-to-bus-in-google-compute-insta]

  #a[wine: Bug\#1093464: spurious error message if `XDG_RUNTIME_DIR` is not set][https://lists.debian.org/debian-wine/2025/04/msg00026.html]

= ```conf Service.User``` <service.user>
- Other users:
  ```sh
  .service: Failed to connect stdout to the journal socket, ignoring: Operation not permitted
  .service: Changing group credentials failed: Operation not permitted
  .service: Failed at step GROUP spawning wine: Operation not permitted
  ```

- Even ```conf User=$USER``` (themselves) cannot be used with user services.
  ```sh
  : .service: Failed to determine supplementary groups: Operation not permitted
  : .service: Failed at step GROUP spawning wine: Operation not permitted
  ```
  #q[If you specify the user/group in the unit file then you should start the service as a system service.]

  #a[systemd - Failed to determine supplementary groups: Operation not permitted - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/438064/failed-to-determine-supplementary-groups-operation-not-permitted]
