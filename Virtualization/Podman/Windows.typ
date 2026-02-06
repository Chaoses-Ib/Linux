#import "@local/ib:0.1.0": *
#title[Podman for Windows]
#a[Podman for Windows][https://github.com/containers/podman/blob/main/docs/tutorials/podman-for-windows.md]

#a[Podman Installation | Podman][https://podman.io/docs/installation#installing-on-mac--windows]

- ```pwsh scoop install main/podman```

= Machines
- ```sh podman machine init```
  - `quay.io/podman/machine-os` (Fedora): 0.24G.
- ```sh wsl -d podman-machine-default```
- ```sh podman machine start```
- ```sh podman machine stop```

Doesn't work as robust as Docker Desktop.

Issues:
- v5.7.1: #a[Podman machine can't find win-sshproxy - Issue \#27763][https://github.com/containers/podman/issues/27763]
  ```log
  level=warning msg="Failed to find $BINDIR: The system cannot find the path specified."
  API forwarding for Docker API clients is not available due to the following startup failures.
          could not find "win-sshproxy.exe" in one of [$BINDIR].  To resolve this error, set the helper_binaries_dir key in the `[engine]` section of containers.conf to the directory containing your helper binaries.

  Podman clients are still able to connect.
  Error: machine did not transition into running state: ssh error: machine not in running state
  ```
- #a[Podman Failing to start on Windows 11 - Issue \#26703][https://github.com/containers/podman/issues/26703]
- #a[podman machine start command hangs (WSL2) - Issue \#26927][https://github.com/containers/podman/issues/26927]
