#import "@local/ib:0.1.0": *
#title[Docker Performance]
#a[What is the runtime performance cost of a Docker container? - Stack Overflow][https://stackoverflow.com/questions/21889053/what-is-the-runtime-performance-cost-of-a-docker-container]
#q[
Docker isn't virtualization, as such -- instead, it's an abstraction on top of the kernel's support for different process namespaces, device namespaces, etc.; one namespace isn't inherently more expensive or inefficient than another, so what actually makes Docker have a performance impact is a matter of what's actually _in_ those namespaces.

Docker's choices in terms of how it configures namespaces for its containers have costs, but those costs are all directly associated with benefits -- you can give them up, but in doing so you also give up the associated benefit:

- Layered filesystems are expensive -- exactly what the costs are vary with each one (and Docker supports multiple backends), and with your usage patterns (merging multiple large directories, or merging a very deep set of filesystems will be particularly expensive), but they're not free. On the other hand, a great deal of Docker's functionality -- being able to build guests off other guests in a copy-on-write manner, and getting the storage advantages implicit in same -- ride on paying this cost.
- DNAT gets expensive at scale -- but gives you the benefit of being able to configure your guest's networking independently of your host's and have a convenient interface for forwarding only the ports you want between them. You can replace this with a bridge to a physical interface, but again, lose the benefit.
- Being able to run each software stack with its dependencies installed in the most convenient manner -- independent of the host's distro, libc, and other library versions -- is a great benefit, but needing to load shared libraries more than once (when their versions differ) has the cost you'd expect.

And so forth. How much these costs actually impact you in your environment -- with your network access patterns, your memory constraints, etc -- is an item for which it's difficult to provide a generic answer.
]

= Memory
#a[docker - Shared library in containers - Stack Overflow][https://stackoverflow.com/questions/35863608/shared-library-in-containers]

- #q[Actually, processes A & B that use a shared library `libc.so` _can_ share the same memory. Somewhat un-intuitively it depends on which docker storage driver you're using. If you use a storage driver that can expose the shared library files as originating from the same device/inode when they reside in the same docker layer then they will share the same virtual memory cache pages. When using the aufs, overlay or overlay2 storage drivers then your shared libraries will share memory but when using any of the other storage drivers they will not.]

- #q[This means that - containers using the same image or base image (assuming no intermediate image has modified the image) will share memory - containers using the same libraries path but different images won't share memory (because images aka layers are different files on disk)]

#a[kernel - Do executables in different containers share shared objects that are define in the same common image layer? - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/780505/do-executables-in-different-containers-share-shared-objects-that-are-define-in-t]

#a[mmap - Do docker containers share RAM for files memory mapped from the same layer but a different image? - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/671259/do-docker-containers-share-ram-for-files-memory-mapped-from-the-same-layer-but-a]

#a[performance - Does Docker give RAM extra mileage? - Stack Overflow][https://stackoverflow.com/questions/32378734/does-docker-give-ram-extra-mileage]
