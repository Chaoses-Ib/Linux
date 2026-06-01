#import "@local/ib:0.1.0": *
#show: ib
#title[Android Debug Bridge (ADB)]
#a[Android Debug Bridge (adb)  |  Android Studio  |  Android Developers][https://developer.android.com/tools/adb]

Permissions granted to ADB:
#a[`aosp/platform_frameworks_base/packages/Shell/AndroidManifest.xml`][https://github.com/aosp-mirror/platform_frameworks_base/blob/master/packages/Shell/AndroidManifest.xml]

= Tools
- #a[Shizuku: Using system APIs directly with adb/root privileges from normal apps through a Java process started with `app_process`.][https://github.com/RikkaApps/Shizuku]
  #footnote[#a[Shizuku and ADB hack : r/macrodroid][https://www.reddit.com/r/macrodroid/comments/1izjlof/shizuku_and_adb_hack/]]

- #a[WADB: A simple switch for adb (Android Debug Bridge) over network.][https://github.com/RikkaApps/WADB]
  - Require root.
