# Android App Stores
[Wikipedia](https://en.wikipedia.org/wiki/List_of_Android_app_stores)

- Google Play Store
- Manufacturer app stores
- Third-party app stores
  - [F-Droid](#f-droid)
  - 酷安
  - TapTap

  This form of the app store is often used by web developers to distribute apps that are not allowed in the Google Play Store; this may be due to an app allowing users wider access to the app system, or offering apps for "niche users" who choose to use only free and open-source software (F-Droid) or prefer to play indie games (Itch.io). Moreover, there are alternative stores that serve to distribute "hacked" versions of paid apps, for no cost.

- Proxy app store

2024-08 [安卓第三方应用商店推荐 - 讨论分享 - 小众软件官方论坛](https://meta.appinn.net/t/topic/59470)

## [F-Droid](https://f-droid.org/)
[Wikipedia](https://en.wikipedia.org/wiki/F-Droid), [GitLab](https://gitlab.com/fdroid/), [GitHub](https://github.com/f-droid)

[找 Android 应用的好去处：开源应用商店 F-Droid 使用指南 - 少数派](https://sspai.com/post/77601)
> 和 Linux 软件源类似，F-Droid 官方存储库中的软件，几乎全部都是 F-Droid 的维护者从各个软件的源代码编译打包并签名的，你可以下载安装 F-Droid [Build Status](https://sspai.com/link?target=https%3A%2F%2Ff-droid.org%2Fzh_Hans%2Fpackages%2Fde.storchp.fdroidbuildstatus%2F) 来监控应用的构建状态。也正因为如此，同一个应用在其他渠道下载到的安装包与在 F-Droid 下载到的安装包签名往往是不同的，因而往往不能相互覆盖安装，版本更新也会慢一些，并且有些应用的 F-Droid 版本与其他渠道的版本在功能上还会有所不同，如开源的消息推送服务 [ntfy](https://sspai.com/link?target=https%3A%2F%2Ff-droid.org%2Fzh_Hans%2Fpackages%2Fio.heckel.ntfy%2F)，相比与其在 Google Play 上架的版本，其 F-Droid 版本移除了一些专有组件，如 Google Play Service 和 FCM 推送功能等；还有 RSS 阅读器 [Read You](https://sspai.com/link?target=https%3A%2F%2Ff-droid.org%2Fzh_Hans%2Fpackages%2Fme.ash.reader%2F)，最新版本添加了 Fever API 的支持，但是其 F-Droid 版本的 Fever API 当前不可用，这是一个[已知问题](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FAshinch%2FReadYou%2Fissues%2F299)，会在下个版本修复。在使用 F-Droid 安装应用时，这点需要格外注意。

Repos:
- F-Droid
- [IzzyOnDroid](https://android.izzysoft.de/repo/info)

Clients:
- F-Droid
  - Android 6+

- [Droid-ify: F-Droid client with Material UI.](https://github.com/Droid-ify/client)
  - Android 6+
  - F-Droid and IzzyOnDroid by default

  > [Droid-ify](https://sspai.com/link?target=https%3A%2F%2Ff-droid.org%2Fzh_Hans%2Fpackages%2Fcom.looker.droidify%2F)，从 Foxy Droid 修改而来，相比于官方客户端更新存储库更快；采用了最新的 Material You 设计语言，在 Android 12 及以上系统甚至还支持系统的动态取色，笔者目前的主力机系统还是 Android 11，可惜目前无法演示这个功能；支持 Shizuku 或 root 授权静默安装；内置了很多第三方存储库，可以按需启用。不过这个客户端对中文支持比官方客户端还差，应用详情没有中文，也不支持中文搜索，英文不好的人用起来可能有些费劲。

- [Neo-Store: An F-Droid client with modern UI and an arsenal of extra features.](https://github.com/NeoApplications/Neo-Store)
  - Android 7+

  > [Neo Store](https://sspai.com/link?target=https%3A%2F%2Ff-droid.org%2Fzh_Hans%2Fpackages%2Fcom.machiav3lli.fdroid%2F) 是另一个修改自 Foxy Droid 的第三方客户端，由 [NeoApplications](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FNeoApplications) 开发，功能和 Droid-ify 基本相同，界面也大同小异，同样的中文支持也很差，不过更新频率更快，比如就在最近的更新中在应用详情界面添加了跟踪器和权限请求信息，不过也正因为更新频率快，界面更改比较频繁，优化较差，有时比较卡顿。此外 NeoApplications 还开发了 [Neo Backup](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FNeoApplications%2FNeo-Backup)、[Neo Launcher](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FNeoApplications%2FNeo-Launcher) 和 [Neo Feed](https://sspai.com/link?target=https%3A%2F%2Fgithub.com%2FNeoApplications%2FNeo-Feed) 等其他应用，有些已经被 F-Droid 官方库收录，有些可以通过添加 IzzyOnDroid 存储库下载，感兴趣的话可以下载尝试。

Antifeatures:
- NSFW apps are hidden by default

在中国部分地区可直连。
- 2023-06 [F-Droid 喜提认证，大家还能直接访问吗？ - V2EX](https://fast.v2ex.com/t/952246)
- [F-Droid使用教程 | searchstar](https://seekstar.github.io/2021/12/29/f-droid%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B/)