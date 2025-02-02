# WSL 2 Backend
%%t220407~08%%
[WSL 2](https://docs.docker.com/desktop/windows/wsl/)
```
> wsl --list --verbose
  NAME                   STATE           VERSION
* Ubuntu                 Running         2
  docker-desktop         Running         2
  docker-desktop-data    Running         2
```

%%t0614%%
`docker-desktop` is used to run the Docker engine (`dockerd`) while `docker-desktop-data` stores containers and images.

## Virtual Hard Disks
`%LOCALAPPDATA%/Docker/wsl`
- `/distro`: docker-desktop
- `/data`: docker-desktop-data

%%t0712%%
```cmd
cd C:\Users\Chaoses\AppData\Local\Docker\wsl\data>
wsl --shutdown
Optimize-VHD -Path ext4.vhdx -Mode Full
```
