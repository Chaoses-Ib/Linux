#import "@local/ib:0.1.0": *
#title[Users]
= Username
#a[user accounts - What characters should I use or not use in usernames on Linux? - Server Fault][https://serverfault.com/questions/73084/what-characters-should-i-use-or-not-use-in-usernames-on-linux]
- ```regex ^[a-z][-a-z0-9]*$```
- ```regex ^[A-Za-z0-9._][A-Za-z0-9._-]*$```

#a[valid user names][https://www.linuxquestions.org/questions/linux-server-73/valid-user-names-573768/]
- 全小写字母，短一点

#a[Linux user administration reference guide - Linux tutorial from PenguinTutor][http://www.penguintutor.com/linux/useradmin-reference]

= Default user
原来默认是直接用 `root` 用户

= CLI
查看：
- ```sh whoami```：获取当前用户用户名
- ```sh id```：获取用户 UID、GID、groups

增删：
- 添加用户：```sh adduser```、```sh useradd```
- 删除用户：```sh deluser```、```sh userdel```

修改：
- 修改密码：```sh passwd```
- 修改 real name：```sh chfn```（change full name）
- 修改 shell：```sh chsh```

= `/etc/passwd`
#image("assets/passwd.png")

Password
- `x`：密码在 `/etc/shadow` 中
- `*`：不允许登录
- blank：无密码

User ID
- `root` 的 UID 和 GID 为 0

最好通过 ```sh vipw```（vi passwd）编辑，会自动备份。
