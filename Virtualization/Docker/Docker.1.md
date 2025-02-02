# Docker
%%t220407~08%%
[Docker](https://www.docker.com/) is a set of platform as a service products that use OS-level virtualization to deliver software in packages called *containers*. [^wiki]

网站做得很奇怪，界面并不差，新手引导却很糟，不启动 Docker Desktop 我都不知道 Getting Started Tutorial 的存在。默认打开的是 Docker Hub 的登录页面，登录不存在的账号却会要求输入密码而不是提示不存在，允许为不存在的账号重置密码却连封说明邮件都不会发送。


## Docker Getting Started Tutorial
[docker/getting-started](https://github.com/docker/getting-started)
1. Clone the repository
	```
	docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
	docker cp repo:/git/getting-started/ .
	```
2. Build the image
	```
	cd getting-started
	docker build -t docker101tutorial .
	```
	[Jinja/mkdocs issue breaks docker101tutorial - Docker Hub - Docker Community Forums](https://forums.docker.com/t/jinja-mkdocs-issue-breaks-docker101tutorial/122671)
	为了提升可复现性而使用镜像，却又因为不固定依赖版本而无法构建，而这还是官方的新手教程，可笑。
3. Run the container
	```
	docker run -d -p 80:80 --name docker-tutorial docker101tutorial
	```
4. Save and share your image
	```
	docker tag docket101tutorial chaoses/docker101tutorial
	docker push chaoses/docker101tutorial
	```

名称混用而不是用“my-container”这样的自述性名称，体验不太好。

能做成在线网页的教程却非要本地构建，很让初学者迷惑。

代码块错位：
- [Fix code block mis-formatting by amci1203 · Pull Request #261 · docker/getting-started](https://github.com/docker/getting-started/pull/261)
- [Update index.md by pushparajbhatta · Pull Request #252 · docker/getting-started](https://github.com/docker/getting-started/pull/252)
- [Typo in Markdown · Issue #245 · docker/getting-started](https://github.com/docker/getting-started/issues/245)


## Container image
Dockerfile:
```dockerfile
FROM node:12-alpine
# Adding build tools to make yarn install work on Apple silicon / arm64 machines
RUN apk add --no-cache python2 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
```
Alpine Linux is a security-oriented, lightweight Linux distribution based on musl libc and busybox.

Build:
```cmd
docker build -t getting-started .
REM --tag name:tag PATH
```

History:
```cmd
> docker image history getting-started
IMAGE          CREATED             CREATED BY                                      SIZE      COMMENT
17505d05a924   57 minutes ago      CMD ["node" "src/index.js"]                     0B        buildkit.dockerfile.v0
<missing>      57 minutes ago      RUN /bin/sh -c yarn install --production # b…   86.3MB    buildkit.dockerfile.v0
<missing>      About an hour ago   COPY . . # buildkit                             4.6MB     buildkit.dockerfile.v0
<missing>      11 hours ago        WORKDIR /app                                    0B        buildkit.dockerfile.v0
<missing>      11 hours ago        RUN /bin/sh -c apk add --no-cache python2 g+…   223MB     buildkit.dockerfile.v0
<missing>      3 days ago          /bin/sh -c #(nop)  CMD ["node"]                 0B
<missing>      3 days ago          /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B
<missing>      3 days ago          /bin/sh -c #(nop) COPY file:4d192565a7220e13…   388B
<missing>      3 days ago          /bin/sh -c apk add --no-cache --virtual .bui…   7.84MB
<missing>      3 days ago          /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.17     0B
<missing>      3 days ago          /bin/sh -c addgroup -g 1000 node     && addu…   77.6MB
<missing>      3 days ago          /bin/sh -c #(nop)  ENV NODE_VERSION=12.22.11    0B
<missing>      3 days ago          /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B
<missing>      3 days ago          /bin/sh -c #(nop) ADD file:5d673d25da3a14ce1…   5.57MB
```


## Container
List containers:
```cmd
> docker ps  
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES  
b73d95bbc3e9 getting-started "docker-entrypoint.s…" 10 hours ago Up 10 hours 0.0.0.0:3000->3000/tcp amazing_haibt  
4e795e88cabc docker101tutorial "/docker-entrypoint.…" 22 hours ago Up 22 hours 0.0.0.0:80->80/tcp docker-tutorial
```

Run a container:
```cmd
docker run -dp 3000:3000 getting-started
REM --detach --publish
```

### Networking
Containers run in isolation by default. If two containers are on the same network, they can talk to each other.
```cmd
docker network create todo-app
docker run -d \
    --network todo-app --network-alias mysql \
    -v todo-mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=todos \
    mysql:5.7
```
```
docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"
```


%%
## Container volumes
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

%%

## Backend
### Windows
- [WSL 2](https://docs.docker.com/desktop/windows/wsl/)
	```
	> wsl --list --verbose
	  NAME                   STATE           VERSION
	* Ubuntu                 Running         2
	  docker-desktop         Running         2
	  docker-desktop-data    Running         2
	```


%%
## Proxy
### Building the image
```cmd
docker build --build-arg "http_proxy=http://10.0.0.1:1080" --build-arg "https_proxy=http://10.0.0.1:1080"  -t docker101tutorial .
```

### Container
In Docker 17.07 and higher, you can [configure the Docker client](https://docs.docker.com/network/proxy/#configure-the-docker-client) to pass proxy information to containers automatically. [^proxy]

In Docker 17.06 and earlier versions, you must set the appropriate environment variables within the container. You can do this when you build the image (which makes the image less portable) or when you create or run the container. [^proxy]
- Running the container
	```cmd
	docker run --name repo -e http_proxy=http://10.0.0.1:1080 -e https_proxy=http://10.0.0.1:1080 alpine/git clone https://github.com/docker/getting-started.git
	```

[^proxy]: [Configure Docker to use a proxy server | Docker Documentation](https://docs.docker.com/network/proxy/)
%%

[^wiki]: [Docker - Wikipedia](https://en.wikipedia.org/wiki/Docker_(software))