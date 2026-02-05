#import "@local/ib:0.1.0": *
#title[#a[Podman][https://podman.io/]]
#a-badge[https://github.com/containers/podman]

- Quadlet and systemd integration
- Daemonless
- rootless configuration
- #a[netavark: Container network stack][https://github.com/containers/netavark]
  - Firewall integration
- Cockpit integration
- Kubernetes manifests
- FOSS

  #q[No additional fees for customers running it in business instances with > 250 employees]

#a[Get Started][https://podman.io/get-started]

#a[Tutorials --- Podman documentation][https://docs.podman.io/en/latest/Tutorials.html]
- #a[Basic Setup and Use of Podman][https://github.com/containers/podman/blob/main/docs/tutorials/podman_tutorial.md]

#t[2202]
#a[Podman 4.0 | Hacker News][https://news.ycombinator.com/item?id=30433518]
- #q[Podman is for running containers on a single host. It's exactly like docker with a few additional features (like the ability to run rootless containers and run containers in something like a Kubernetes pod). Podman was developed by Red Hat to replace docker, the cli, because Docker, the company, didn't play very nice with the open source community.]

#t[2408]
#a[Why are you using podman instead of docker? : r/podman][https://www.reddit.com/r/podman/comments/1eu5d2k/why_are_you_using_podman_instead_of_docker/]

#t[2502]
#a[How many of you use podman instead of docker? : r/selfhosted][https://www.reddit.com/r/selfhosted/comments/1itxtp5/how_many_of_you_use_podman_instead_of_docker/]
- #q[I think, podman is far superior when it comes to containerized applications. The rootless implementation is much better, and it integrates better into the existing system/infrastructure. docker behaves more like a hypervisor that you to tell what to do. podman is running pretty much transparently and you wouldn't really know if it's running in a container or not. Understanding podman also gives you a better understanding what containers are and how they work from my experience.]

#t[2508]
#a[2025 年了，感觉 podman 已经比 docker 好用太多了，就差一个杀手级的 GUI 配置了 - V2EX][https://www.v2ex.com/t/1155756]

= Installation
#a[Podman Installation | Podman][https://podman.io/docs/installation]
- Debian: ```sh sudo apt-get -y install podman```
  - 0.32 GB

= UI
- #a[```sh podman```][https://docs.podman.io/en/stable/Commands.html]
  #a-badge[https://man.archlinux.org/man/podman.1.en]
- #a[containers/podman-tui: Podman Terminal UI][https://github.com/containers/podman-tui]
- Cockpit: #a[cockpit-project/cockpit-podman: Cockpit UI for podman containers][https://github.com/cockpit-project/cockpit-podman]

  #a[Podman - Web UI (via Cockpit)][https://blog.while-true-do.io/podman-web-ui-via-cockpit/]

= Images
- ```sh podman image prune -a``` to prune unused images, the same as Docker.

  #a[why does docker prune not remove my dangling images? - Stack Overflow][https://stackoverflow.com/questions/47620016/why-does-docker-prune-not-remove-my-dangling-images]

= Quadlet and systemd integration
#strike[#a-badge[https://github.com/containers/quadlet]]

#a[podman-systemd.unit --- Podman documentation][https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html]

#a[Make systemd better for Podman with Quadlet][https://www.redhat.com/en/blog/quadlet-podman]

#q[podman quadlet 用的是跟普通 systemd unit 一样的语法（类 INI），把 docker compose YAML 里的一些层级拆成了单独的文件]

Tools:
- #a[containers/podlet: Generate Podman Quadlet files from a Podman command, compose file, or existing object][https://github.com/containers/podlet]
- #a[containers/podman-compose: a script to run docker-compose.yml using podman][https://github.com/containers/podman-compose]

#a[How to install multi-container applications with Podman quadlets | Giacomo Coletto][https://giacomo.coletto.io/blog/podman-quadlets/]
- #a[A simple guide on why and how to use Podman Quadlets, even for apps that need more than one container : r/selfhosted][https://www.reddit.com/r/selfhosted/comments/1dodflf/a_simple_guide_on_why_and_how_to_use_podman/]

#a[Quadlet: Running Podman containers under systemd | Hacker News][https://news.ycombinator.com/item?id=43456934]
- #q[I've been using this method on a few servers where I don't want to run Kubernetes and I really like it. It feels like native support for docker-like containers in Linux, instead of a foreign concept that needs it's own management/logging. This is the killer feature of Podman, it doesn't make sense for me to use Docker in prod.]

#q-at[#a[咸咸湿湿][https://t.me/ClickMeToBecomeSaltedFish/5120]][
对于正经用途来说，我依旧觉得小公司和个人没必要使用 k8s。我跑 k8s 单纯是为了玩，我也不是什么专业运维。

前段时间折腾了一下 Podman Quadlet，这个东西我觉得差不多是 docker-compose 的终极形态了，对于小规模部署来说非常好用。它走的是跟 Talos OS 完全相反的路子，选择去更深的集成到现成的基础设施。就是 UI/UX 还有不少提升空间。最主要是还不用写一大坨 YAML。]
