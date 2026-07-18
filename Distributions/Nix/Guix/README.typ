#import "@local/ib:0.1.0": *
#title[#a[GNU Guix][https://guix.gnu.org]]
#a-badge[https://en.wikipedia.org/wiki/GNU_Guix]

- Guile Scheme

#a[A look at Nix and Guix [LWN.net]][https://lwn.net/Articles/962788/]

#q[
Guix is much younger project and it was originally based on Nix.
Afaik there is no unfree software on Guix, they use some obscure Shepard init system, libre kernel and are trying to push Hurd.
These decisions may cause major compatibility issues for many people.]
#q[I've used Guix and Nix as package managers and I prefer Guix.
Nix created a language, which is a huge sin in my view.
Maybe they should have used Haskell, since their community is so fond of it.
Also I've always felt that the documentation is subpar, despite the fact that Nix is a much bigger project (more contributors).
There is information everywhere (wiki, forums etc) but I also feel it's a disorganized dump.
Compare the git history of Nix and Guix repositories and make conclusions yourself.

Guix is a project mostly used in research institutes on the EU, from my observations.]
#footnote[#a[Why NixOS won over Guix ? : r/NixOS][https://www.reddit.com/r/NixOS/comments/1d2s6r1/why_nixos_won_over_guix/]]

#q[
Since Guix is a GNU project, it doesn't support proprietary software (Steam, Discord, Zoom...).
#a[Third-party repos][https://gitlab.com/nonguix/nonguix] are available for it.
Free version of Linux without binary blobs (Linux-libre) is used in the official repo,
so you may have trouble running it on modern hardware without third-party repos.

NixOS doesn't allow installing proprietary packages by default as well, but you can set a config option to allow it, and proprietary packages are included in the official repo.
Mainline Linux with binary blobs is used by default, although you can still opt for Linux-libre

NixOS has a much higher developer/maintainer base, so you will have an easier time configuring certain features and access to a larger package repository.
Last time I tried Guix (around a year ago), you couldn't inject secrets into initrd so you don't have to decrypt the root partition after decrypting the boot partition.
I tried to send a patch, but (for valid reasons) it got rejected, and nobody was interested in figuring out a better way to do it (including me, since I decided to go with Nix at that point lol).

Overall, Guile is probably the better language out of the two, and if you want to support what GNU are doing (and especially if you like LISP/Scheme) I'd encourage you to try Guix out.
Otherwise, NixOS is probably better for you due to a larger community and hence easier troubleshooting.
]
#footnote[#a[Differences between nixos and guix? : r/NixOS][https://www.reddit.com/r/NixOS/comments/12dv2hp/differences_between_nixos_and_guix/]]

#a[tazjin's blog: Trying Guix: A Nixer's Impressions][https://tazj.in/blog/trying-guix]

#a[NixOS vs Guix - A non-programmer's novice perspective - General - System Crafters][https://forum.systemcrafters.net/t/nixos-vs-guix-a-non-programmers-novice-perspective/875]

Telegram:
- #a[GNU/Guix China (\@guixcn][https://t.me/guixcn)]
