#import "@local/ib:0.1.0": *
#title[Groups]
#a-badge[https://wiki.archlinux.org/title/Users_and_groups#Group_management]

= CLI
- Printing: ```sh groups```, ```sh id```

增删：
- 添加 group：```sh addgroup```、```sh groupadd```
- 删除 group：```sh delgroup```、```sh groupdel```

修改：
- 密码：```sh gpasswd```
- 添加成员：```sh gpasswd -a```
- 删除成员：```sh gpasswd -d```

#a[12.04 - Group permissions allow, but still get permission denied - Ask Ubuntu][https://askubuntu.com/questions/455000/group-permissions-allow-but-still-get-permission-denied]

= `/etc/group`
#image("assets/group.png")

Password
- `x`: 密码在 `/etc/gshadow` 中

基本都不允许登录
