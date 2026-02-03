#import "@local/ib:0.1.0": *
#title[Wayland]
#a-badge[https://en.wikipedia.org/wiki/Wayland_(protocol)]

#a[Can someone please explain the whole X11 vs. Wayland to me like I'm 5 and why it matters? : r/linux4noobs][https://www.reddit.com/r/linux4noobs/comments/1aqg23y/can_someone_please_explain_the_whole_x11_vs/]
- #q[X11 is ancient and wasn't designed to handle many modern use cases, like multiple monitors or hardware acceleration.
  It kinda handles them through clunky hacks.
  But it is very well supported.
  Wayland handles those modern cases better, but not every application supports it yet, so there's an extra layer to handle X11 apps in Wayland.
  
  So while the future is definitely Wayland, whether your present should be Wayland or X11 depends on whether your use case works better through the clunky hacks or through the translation layer.]
