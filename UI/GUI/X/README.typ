#import "@local/ib:0.1.0": *
#title[#a[X Window System][https://www.x.org/wiki/]]
#a-badge[https://en.wikipedia.org/wiki/X_Window_System]
#a-badge[https://wiki.archlinux.org/title/Xorg]

#q[The X protocol has been at version 11 (hence "X11") since September 1987.]

#a[X Window System protocols and architecture - Wikipedia][https://en.wikipedia.org/wiki/X_Window_System_protocols_and_architecture]

#a[How to manually run/init/start a Xorg server on a different VT/TTY? - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/554592/how-to-manually-run-init-start-a-xorg-server-on-a-different-vt-tty]

= Display
- ```sh $DISPLAY```

  #a[xorg - What is the ```sh $DISPLAY``` environment variable? - Ask Ubuntu][https://askubuntu.com/questions/432255/what-is-the-display-environment-variable]
- ```sh xdpyinfo```

#a[Cannot open display - Issue \#787 - neutrinolabs/xrdp][https://github.com/neutrinolabs/xrdp/issues/787]

#a[ubuntu - Error because ```sh $DISPLAY``` environment variable is not properly set - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/122094/error-because-display-environment-variable-is-not-properly-set]

= Testing
- ```sh xmessage -center hello!```
- ```sh xeyes```
- ```sh xclock```
- ```sh xterm```

#a[server - What is the most simple example to check if X11 forwarding is working? - Ask Ubuntu][https://askubuntu.com/questions/824489/what-is-the-most-simple-example-to-check-if-x11-forwarding-is-working]

= Qt
- ```sh export QT_DEBUG_PLUGINS=1```
- ```sh apt install libxcb-*```

  #a[Linux maintaining compliance - Issue \#3871 - pawelsalawa/sqlitestudio][https://github.com/pawelsalawa/sqlitestudio/issues/3871]

#a[c++ - "qt.qpa.plugin: Could not load the Qt platform plugin "xcb" in "" even though it was found." - Stack Overflow][https://stackoverflow.com/questions/68036484/qt-qpa-plugin-could-not-load-the-qt-platform-plugin-xcb-in-even-though-it]

#a["Failed to load platform plugin "xcb" " while launching qt5 app on linux without qt installed - Stack Overflow][https://stackoverflow.com/questions/17106315/failed-to-load-platform-plugin-xcb-while-launching-qt5-app-on-linux-without]

= Wine
#a[WineHQ Bugzilla -- Bug 49500 -- Wine is not displaying any windows (on a headless system)][https://bugs.winehq.org/show_bug.cgi?id=49500]

#a[nodrv_CreateWindow Application tried to create a window, but no driver could be loaded - WineHQ Forums][https://forum.winehq.org/viewtopic.php?t=36706]

#a[linux - How to start Application in Wine From a terminal window - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/253810/how-to-start-application-in-wine-from-a-terminal-window]

#a[Application tried to create a window, but no driver could be loaded - Issue \#117 - scottyhardy/docker-wine][https://github.com/scottyhardy/docker-wine/issues/117]

#a[Error after installing Wine on Debian 10 - WineHQ Forums][https://forum.winehq.org/viewtopic.php?t=37177]

#a[How do I fix a "cannot open display" error when opening an X program after ssh'ing with X11 forwarding enabled? - Super User][https://superuser.com/questions/310197/how-do-i-fix-a-cannot-open-display-error-when-opening-an-x-program-after-sshi]

#a[centos - Make sure that your X server is running and that ```sh $DISPLAY``` is set correctly - Stack Overflow][https://stackoverflow.com/questions/52553112/make-sure-that-your-x-server-is-running-and-that-display-is-set-correctly]

#a[Wine try to create a window, but no driver could be loaded - Support - Lutris Forums][https://forums.lutris.net/t/wine-try-to-create-a-window-but-no-driver-could-be-loaded/17474]

#a[Wine wont work on X11? : r/archlinux][https://www.reddit.com/r/archlinux/comments/tlzf3b/wine_wont_work_on_x11/]

#a[Wine try to create a window, but no driver could be loaded - Issues & Assistance / Unsupported Software (AUR & Other) - Garuda Linux Forum][https://forum.garudalinux.org/t/wine-try-to-create-a-window-but-no-driver-could-be-loaded/27321]
