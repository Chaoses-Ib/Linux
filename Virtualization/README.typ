#import "@local/ib:0.1.0": *
#title[Linux Virtualization]
#a-badge[https://en.wikipedia.org/wiki/Virtualization]

- Virtualization has a more or less performance cost.
- The more complex the subsystem is, the larger the benefit of virtualization is.

= Implementations
- #a[→Hardware Virtualization][https://github.com/Chaoses-Ib/ComputerHardware/#virtualization]
- systemd
  - systemd-nspawn
  
    #q[忽然感觉 Nix + systemd-nspawn 替代 Docker 简直太合理了 \
    但是看上去 Build 比较麻烦]
- $arrow$Docker
- $arrow$Podman
- #a[containerd/nerdctl: contaiNERD CTL - Docker-compatible CLI for containerd, with support for Compose, Rootless, eStargz, OCIcrypt, IPFS, ...][https://github.com/containerd/nerdctl]
- #a[containers/Bubblewrap: Low-level unprivileged sandboxing tool used by Flatpak and similar projects][https://github.com/containers/bubblewrap]

= Comparison
#a[Exactly. Docker files are worse than war files in pretty much every way. The eco... | Hacker News][https://news.ycombinator.com/item?id=17517351]

== Docker vs. systemd
#a[Docker Compose and Systemd - Igor Bubelov][https://bubelov.com/blog/2021/08/docker-compose-systemd/]
#q[
The thing is: if you have a Linux server, it's probably based on Systemd, and there might be no good reasons to install any additional dependencies. Avoiding extra dependencies isn't the only reason to stick with Systemd, though. Generally, installing two invasive systems competing to do the same thing is a recipe for a disaster. Many Docker Compose users are unaware about the fact that it messes with their firewalls, and many learned about it the hard way. Up until recently, even installing Docker Compose on something not too mainstream, like Raspberry Pi, was so nuanced and confusing that it deserved a special post in this blog. Finally, it's impossible to avoid Systemd nowadays, but it's pretty easy to avoid Docker Compose, so why clutter your mind with two things when you can get away with just one?

Docker itself (without Compose) is very handy when you need to deploy something extremely complicated (often, for no good reason). For instance, Nextcloud is essentially a bunch of PHP scripts which require a lot of dependencies and some painful manual setup. It could have been a simple executable, but it’s not. That’s where Docker shines: it allows us to hide messy to deploy software behind a simple CLI. Setting things up is a hard job which might need deep expertise. Docker can abstract that away, just give it a port to bind to, and it’ll take care of the rest. Go and Rust have set a good trend of packing everything into a single binary, which obsoletes many of the Docker use cases, especially for the typical single-node self-hosted deployments. I hope more software will be distributed like this in the future, but for now, it’s pretty much impossible to avoid Docker.
]

#a[Docker vs systemd : r/docker][https://www.reddit.com/r/homelab/comments/1l7ov96/docker_vs_systemd/]
#a-badge[https://www.reddit.com/r/docker/comments/1l7ow18/docker_vs_systemd/]
#q[
After spending several months (almost a year) trying to set up a full stack (mostly media management) using Docker, I finally gave up and went back to the more traditional route: installing each application directly and managing them with systemd. To my surprise, everything worked within a single day. Not kidding

During those Docker months: I tried multiple docker-compose files, forked stacks, and scripts. Asked AI for help, read official docs, forums, tutorials, even analyzed complex YAMLs line by line. Faced issues with networking, volumes, port collisions, services not starting, and cryptic errors that made no sense.

Then I tried systemd: Installed each application manually, exactly where and how I wanted it. Created systemd service files, controlled startup order, logged everything directly. No internal network mysteries, no weird reverse proxy behaviors, no containers silently failing. A better NFS sharing

I’m not saying Docker is bad — it’s great for isolation and deployments. But for a home lab environment where I want full control, readable logs, and minimal abstraction, systemd and direct installs clearly won in my case. Maybe the layers from docker is something to consider.
]

#q[
When it comes to a bunch of services that need to interact on various levels (volumes, networking, etc), it requires much more config in the files to support it. More than what it is worth in a homelab.

Docker is designed to fix problems mostly found in enterprise i.e., standard behaviour between machines, readable behaviour for new people on the project, git history for server config (the biggest advantage imo)

For homelab to small/medium size projects, getting the thing to run on the system combined with decent image backups will sort out 99% of the problems.]

#q[
I know systemd (and Debian systems) well and find _very_ few uses for Docker.
  
I find Docker useful for experimentation (testing a distro, a libc version, a toolchain) or the rare bleeding-edge applications that _only_ do docker installs (lookin at _you_ frigate).

But in my experience the vast majority of things people use docker and docker-compose for _should_ be accomplished by native package managers and `systemd` instead.

While I can see an argument for Docker when as a dev lacking time and collaborators you want to avoid writing distro-specific install scripts I think in the long run this is evidently worse than having native packages.
]

#a[Using systemd as Docker replacement - Mitch's Blog][https://www.dermitch.de/post/using-systemd-as-docker-replacement/]

#a[Systemd Units vs Docker Containers - Why I Choose the Former for Running Services | John's Blog][https://blog.jlcarveth.dev/post/docker_vs_systemd.md]

#a[Is there any reason not to use Docker instead of systemd? I like managing servic... | Hacker News][https://news.ycombinator.com/item?id=36747851]

#a[The key difference is that systemd is system-wide orchestration, and docker-comp... | Hacker News][https://news.ycombinator.com/item?id=34692095]
#q[
I think that existing tooling on nix environments can work _much_ better than docker compose to aggregate a set of containers and resources.

Setting resource limits using cgroups, isolating users/paths/networks using the capabilities of systemd and all together used from a common shell script seems more expressive and more versatile than using docker/docker compose and requiring an extra daemon to deal with everything.]

#q[More expressive? I think so too. Less convenient? I think so. Sadly history shows that convenience wins.]
