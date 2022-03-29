#import "@local/ib:0.1.0": *
#title[Groups]
增删：
- 添加 group：```sh addgroup```、```sh groupadd```
- 删除 group：```sh delgroup```、```sh groupdel```

修改：
- 密码：```sh gpasswd```
- 添加成员：```sh gpasswd -a```
- 删除成员：```sh gpasswd -d```

= `/etc/group`
#image("assets/group.png")

Password
- `x`: 密码在 `/etc/gshadow` 中

基本都不允许登录
