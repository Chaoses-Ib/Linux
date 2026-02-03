#import "@local/ib:0.1.0": *
#title[Remote Desktops]
#a-badge(body: [$arrow$Windows])[https://github.com/Chaoses-Ib/Windows/blob/main/UI/GUI/Desktops/Remote.md]
#a-badge[https://wiki.archlinux.org/title/Category:Remote_desktop]

#a[Headless - ArchWiki][https://wiki.archlinux.org/title/Headless]

#a[RDP into Headless Ubuntu 22.04 : r/HomeServer][https://www.reddit.com/r/HomeServer/comments/xbl0pc/rdp_into_headless_ubuntu_2204/]

#a[Remote desktop environment for a Debian headless server on a lan connection? : r/linuxquestions][https://www.reddit.com/r/linuxquestions/comments/q8u0rl/remote_desktop_environment_for_a_debian_headless/]

= Protocols
#a[networking - What's the difference between RDP vs VNC? - Super User][https://superuser.com/questions/32495/whats-the-difference-between-rdp-vs-vnc]
- #q[RDP is semantic. The RDP is aware of controls, fonts, and other similar graphical primitives.
  This means that when rendering a screen across a network, this information is used to compress the data stream significantly.
  For instance, if you know that this region of the screen if occupied by a button, with the color grey, then you don't need to send an image of the button across the network, but merely information such as location of this button, size and color.

  VNC is "dumb" in this respect, and largely functions by sending the actual images across the network.

  RDP is tightly coupled to the Windows platform whereas VNC is available for most platforms. RDP is also seen as far more performant than VNC, due to the semantic advantage.]

  #q[XRDP is still aware and is doing quite a bit of work including identifying common things like fonts or simply blocks of the screen that are a single or unchanging color to eliminate sending straight images over the network.]
- #q[One more thing: VNC allows you to share a session on the target machine (good for tech support and demos) where RDP does not.]

#a[TLDR: VNC on Linux Sucks...use xrdp - Mike Bosland][https://mikebosland.com/tldr-vnc-on-linux-sucks-use-xrdp/]

#a[Why use VNC and not XRDP? - Raspberry Pi Forums][https://forums.raspberrypi.com/viewtopic.php?t=74998]
- #q[One reason is that XRDP will always open a new and independent session(s). The local session is not aware of the remote connection(s).]

#a[What's the difference between VNC (TigerVNC), NX (X2go), RDP (xrdp), and Xpra? : r/linuxquestions][https://www.reddit.com/r/linuxquestions/comments/g7frrb/whats_the_difference_between_vnc_tigervnc_nx_x2go/]

= Servers
- #a[$arrow$RustDesk][https://github.com/Chaoses-Ib/Windows/blob/main/UI/GUI/Desktops/RustDesk.md]

  #a[Headless Linux Support - rustdesk/rustdesk Wiki][https://github.com/rustdesk/rustdesk/wiki/Headless-Linux-Support]
- AnyDesk

#a[xorg - Run wine totally headless - Super User][https://superuser.com/questions/902175/run-wine-totally-headless/948200#948200]

#a[What's a good RDP Server on Linux? | Hacker News][https://news.ycombinator.com/item?id=30694601]

#a[What is Microsoft RDP server alternative on linux? : r/linuxquestions][https://www.reddit.com/r/linuxquestions/comments/xqhnsz/what_is_microsoft_rdp_server_alternative_on_linux/]
- #q[NoMachine. It's 99% as good as RDP IMO.
  I actually use NoMachine to remote into my Wnidows Home boxes. NoMachine is the only time I've it happen like with RDP where I forgot I was on a remote box and started playing a video on the remote, and even then almost didn't notice I was streaming a video.]

#a[How to properly approach remote desktop with Linux? : r/linux4noobs][https://www.reddit.com/r/linux4noobs/comments/1fbgzqr/how_to_properly_approach_remote_desktop_with_linux/]

#a[Best performing remote desktop server for linux : r/linuxmasterrace][https://www.reddit.com/r/linuxmasterrace/comments/yapdaw/best_performing_remote_desktop_server_for_linux/]

#a[Looking for the Best Remote Desktop Solution for Linux: Any Recommendations? : r/Ubuntu][https://www.reddit.com/r/Ubuntu/comments/1f6ewa0/looking_for_the_best_remote_desktop_solution_for/]
- #q[As for VNC ... after having experienced the performance of things like X2go, Thinlinc and Nomachine I'd never again consider VNC for anything.
  It can't do sound-forwarding, it can't do folder-forwarding, it can't do printer-forwarding, and it is usually super laggy and might require a lot of tuning and fiddling with e.g. SSH connection parameters to squeeze out some performance. Meh. There are better and more modern solutions these days.]

== VNC
#a-badge[https://en.wikipedia.org/wiki/VNC]

- TigerVNC
  #a-badge[https://wiki.archlinux.org/title/TigerVNC]

== #a[RDP][https://github.com/Chaoses-Ib/Windows/blob/main/UI/GUI/Desktops/Remote.md#remote-desktop-protocol-rdp]
=== #a[xrdp: an open source RDP server][https://github.com/neutrinolabs/xrdp]
  #a-badge[https://wiki.archlinux.org/title/Xrdp]
  - #a[xorgxrdp: Xorg drivers for xrdp][https://github.com/neutrinolabs/xorgxrdp]
  - Xvnc
  - Debian
    ```sh
    apt install xrdp
    # systemctl enable xrdp
    # systemctl start xdrp
    # ufw allow 3389/tcp
    ```
    0.38 GB.
  - Session shadowing

    #a[remote desktop - How do I set up xrdp session that reuses an existing session? - Ask Ubuntu][https://askubuntu.com/questions/133343/how-do-i-set-up-xrdp-session-that-reuses-an-existing-session]
  - Check "Always ask for credentials" to avoid login in the remote session, which doesn't support clipboard.

  #a[Xvnc vs Xorg - neutrinolabs/xrdp - Discussion \#2619][https://github.com/neutrinolabs/xrdp/discussions/2619]

#a[Cannot open display - Issue \#787][https://github.com/neutrinolabs/xrdp/issues/787]

#a[connect to rdp but black screen - Issue \#2379][https://github.com/neutrinolabs/xrdp/issues/2379]

#a[XRDP -- Griffon's IT Library][https://c-nergy.be/blog/?cat=79]

#a[Wine via xrdp session - WineHQ Forums][https://forum.winehq.org/viewtopic.php?t=18185]

== NX technology
#a-badge[https://en.wikipedia.org/wiki/NX_technology]

- #a[NoMachine: Free Remote Desktop for Everybody][https://www.nomachine.com/]
- X2Go
  #a-badge[https://en.wikipedia.org/wiki/X2Go]

== Web
- #a[Apache Guacamole][https://guacamole.apache.org/]
  #a-badge[https://en.wikipedia.org/wiki/Apache_Guacamole]
  - RDP, VNC, SSH

  #a[Accessing a Legacy Windows Application Running Under Wine On A Containerised, RDP Enabled Desktop In a Browser Via A Guacamole Server Running in a Docker Container -- ouseful.info, the blog...][https://blog.ouseful.info/2019/05/07/accessing-a-containerised-rdp-enabled-desktop-via-guacamole/]
