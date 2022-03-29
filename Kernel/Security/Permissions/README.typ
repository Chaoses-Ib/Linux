#import "@local/ib:0.1.0": *
#title[File Permissions]
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

= Permissions mask
#a[permissions - What is "umask" and how does it work? - Ask Ubuntu][https://askubuntu.com/questions/44542/what-is-umask-and-how-does-it-work]
