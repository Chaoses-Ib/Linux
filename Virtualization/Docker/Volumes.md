# Volumes
%%t220407~08%%
[Volumes](https://docs.docker.com/storage/volumes/) provide the ability to connect specific filesystem paths of the container back to the host machine.

### Named volumes
```cmd
REM docker volume create todo-db
docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started
```

### Bind mounts
With bind mounts, we control the exact mountpoint on the host.
```cmd
docker run -dp 3000:3000 \
	-w /app -v "$(pwd):/app" \
	node:12-alpine \
	sh -c "yarn install && yarn run dev"
REM -w /app  sets the container's present working directory where the command will run from
REM -v "$(pwd):/app"  bind mount the host's present working directory to the container's `/app` directory
```
> Using bind mounts is _very_ common for local development setups. The advantage is that the dev machine doesn't need to have all of the build tools and environments installed. With a single `docker run` command, the dev environment is pulled and ready to go. 

%%t0621%%
为什么 ls 为空，但可以正常读写？

%%t24%%
注意，volume 的定义语法为 `host:container`，在输入 Windows 盘符时会出现歧义，需要改写成 `//c/path/to/app:/app`。

%%t28%%
那 `"$(pwd):container"` 为什么没问题呢？