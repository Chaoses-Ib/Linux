#import "@local/ib:0.1.0": *
#title[File Permissions]
#a-badge[https://en.wikipedia.org/wiki/File-system_permissions#Traditional_POSIX_permissions]
#a-badge[https://wiki.archlinux.org/title/File_permissions_and_attributes]

#a[FilePermissions - Community Help Wiki][https://help.ubuntu.com/community/FilePermissions]

#table(
  columns: 3,
  [1], [`x`], [execute],
  [2], [`w`], [write],
  [4], [`r`], [read],
)
- ```sh ls -l```
- ```sh chmod u+x file1```

#table(
  columns: 2,
  [owner], [`-rwx------`],
  [group], [`----rwx---`],
  [other], [`-------rwx`],
)
- 修改 owner：```sh chown```
- 修改 group：```sh chgrp```、```sh chown :group```

#a[Setting permissions for specific user and groups in Linux - Super User][https://superuser.com/questions/144984/setting-permissions-for-specific-user-and-groups-in-linux]

= Permission inheritance
#q[The way permissions affect paths is explained in the #a[`path_resolution` man page][http://linux.die.net/man/2/path_resolution]

The only permission on folder A that matters is the search (execute) permission: if you don't have it you can't descend to folder B. Other than that there is no relation between permissions of A and B, for example if A is read-only and B is not, or even if you don't even have read permission to A, you still can create and delete files in B.]
#footnote[
#a[ubuntu - Linux directory permission inheritance - Stack Overflow][https://stackoverflow.com/questions/17746361/linux-directory-permission-inheritance]
]

You can view permissions along a path with ```sh namei -l path```.

= Permissions mask
#a[permissions - What is "umask" and how does it work? - Ask Ubuntu][https://askubuntu.com/questions/44542/what-is-umask-and-how-does-it-work]

= Declarative permissions
- systemd-tmpfiles
  #a-badge[https://man.archlinux.org/man/systemd-tmpfiles.8.en]

  ```conf
  systemd.tmpfiles.rules = [
    "d /tmp 1777 root root 10d"
  ]
  ```
  #a[Maintaining file permissions - Help - NixOS Discourse][https://discourse.nixos.org/t/maintaining-file-permissions/48227]

#a[Declarative directory permissions : r/NixOS][https://www.reddit.com/r/NixOS/comments/1arn20u/declarative_directory_permissions/]
