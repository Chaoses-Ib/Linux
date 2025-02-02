# Docker Compose
%%t220408%%
[Docker Compose](https://docs.docker.com/compose/) is a tool that was developed to help define and share multi-container applications.

## Sclaing
%%t0615%%
```cmd
docker-hadoop> docker-compose up --scale datanode=2  

WARNING: The "datanode" service is using the custom container name "datanode". Docker requires each container to have a unique name. Remove the custom name to scale the service.   

Creating datanode ... error  
  
ERROR: for datanode Cannot create container for service datanode: Conflict. The container name "/datanode" is already in use by container "83a337d9e9fab55470300a7e14add19d0950b620dc3292b08896b6e6f80bac95". You have to remove (or rename) that container to be able to reuse that name.  

ERROR: Encountered errors while bringing up the project.
```
要 scale 的 service 不能定义 container_name。

`docker-compose scale` is deprecated.

## Error while fetching server API version
%%t0620%%
```cmd
> docker-compose up -d
Traceback (most recent call last):
  File "docker\api\client.py", line 214, in _retrieve_server_version
  File "docker\api\daemon.py", line 181, in version
  File "docker\utils\decorators.py", line 46, in inner
  File "docker\api\client.py", line 237, in _get
  File "requests\sessions.py", line 543, in get
  File "requests\sessions.py", line 530, in request
  File "requests\sessions.py", line 643, in send
  File "requests\adapters.py", line 439, in send
  File "urllib3\connectionpool.py", line 670, in urlopen
  File "urllib3\connectionpool.py", line 392, in _make_request
  File "http\client.py", line 1255, in request
  File "http\client.py", line 1301, in _send_request
  File "http\client.py", line 1250, in endheaders
  File "http\client.py", line 1010, in _send_output
  File "http\client.py", line 950, in send
  File "docker\transport\npipeconn.py", line 32, in connect
  File "docker\transport\npipesocket.py", line 23, in wrapped
  File "docker\transport\npipesocket.py", line 72, in connect
  File "docker\transport\npipesocket.py", line 52, in connect
pywintypes.error: (2, 'CreateFile', '系统找不到指定的文件。')

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "docker-compose", line 3, in <module>
  File "compose\cli\main.py", line 81, in main
  File "compose\cli\main.py", line 200, in perform_command
  File "compose\cli\command.py", line 60, in project_from_options
  File "compose\cli\command.py", line 152, in get_project
  File "compose\cli\docker_client.py", line 41, in get_client
  File "compose\cli\docker_client.py", line 170, in docker_client
  File "docker\api\client.py", line 197, in __init__
  File "docker\api\client.py", line 221, in _retrieve_server_version
docker.errors.DockerException: Error while fetching server API version: (2, 'CreateFile', '系统找不到指定的文件。')
[24680] Failed to execute script docker-compose
```
没开 Docker Desktop。

## Disable a service
%%t0624%%
```yaml
version: "3"
services:
  foo:
    profiles:
      - donotstart
```