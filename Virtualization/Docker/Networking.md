# Networking
%%t220407~08%%
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

%%t0624%%
[为 docker build 时设置一个代理 - 大家的板块 / Docker - 小众软件官方论坛](https://meta.appinn.net/t/topic/33811/2)


%%t0614%%
## iptables
[Docker and iptables](https://docs.docker.com/network/iptables/)

## 如何从主机访问容器未被映射的端口？
端口映射只能在 run 时添加，不能在容器运行中添加。

另一种方案是访问容器 IP，然而在 Windows 主机上默认是无法访问 Linux 容器的 [^networking-windows]，即使在 `wsl -d docker-desktop` 中也不行。

[^so] 提到需要添加路由表和 iptables 规则，但一方面添加路由表后仍无法访问，另一方面 docker-desktop 的 iptables 中也根本没有 DOCKER chain [^iptables-wsl]。Hyper-V 后端似乎只要添加路由表就可以访问 [^route-issue]，那么问题就出在 WSL 2 后端身上了。

另一种 workaround 是直接在 WSL 2 中安装 Docker [^workaround]。

[^networking-windows]: [Networking features in Docker Desktop for Windows | Docker Documentation](https://docs.docker.com/desktop/windows/networking/)
[^so]: [Accessing Docker Container IP when using WSL + Ubuntu 20.04 LTS - Stack Overflow](https://stackoverflow.com/questions/63740000/accessing-docker-container-ip-when-using-wsl-ubuntu-20-04-lts)
[^iptables-wsl]: [DOCKER-USER and DOCKER iptables chains not installed for WSL2 · Issue #10355 · docker/for-win](https://github.com/docker/for-win/issues/10355)
[^route-issue]: [How to access containers by internal IPs 172.x.x.x · Issue #221 · docker/for-win](https://github.com/docker/for-win/issues/221)
[^workaround]: [Access containers by IP in WSL2 Ubuntu 20.04 with Docker Desktop Edge with WSL2 backend · Issue #6610 · docker/for-win](https://github.com/docker/for-win/issues/6610)

## Hostname
%%t20%%
hostname 默认为容器 ID（而不是容器名称），可通过 `--hostname` 指定。

## Port
%%t23%%
```
docker: Error response from daemon: Ports are not available: exposing port TCP 0.0.0.0:8888 -> 0.0.0.0:0: listen tcp 0.0  
.0.0:8888: bind: An attempt was made to access a socket in a way forbidden by its access permissions.
```
但用 netstat 查看时端口并未被占用。

```cmd
net stop hns && net start hns
```
虽然不知道为什么，但问题解决了。