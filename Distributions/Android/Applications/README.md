# Applications
## App archiving
- Google Play

  [Android Developers Blog: Reduce uninstalls for your app with auto-archive](https://android-developers.googleblog.com/2023/04/reduce-uninstalls-for-your-app-with-auto-archive.html)
  > Auto-archive is only available for developers using the App Bundle to publish their apps.

  > In order to make Google Play auto-archiving work without OS-level support, Google Play made use of the compartmentalized nature of the Android App Bundle format. When developers upload an Android App Bundle for distribution on Google Play, the Play Console automatically generates the base APK, split APKs, and multi-APKs needed for all configurations the app supports, but it also generates an additional “archived APK.” An archived APK is essentially a trimmed-down version of the base APK that’s installed on devices when you download many apps from Google Play. When the Google Play Store goes to archive an app, it installs the archived APK on top of the base APK file, which is possible because the archived APK has the exact same signature as the base APK.

  [Here's a first look at Android 15's built-in app archiving feature](https://www.androidauthority.com/android-15-app-archiving-demo-3425621/) ([r/Android](https://www.reddit.com/r/Android/comments/1bfib4e/heres_a_first_look_at_android_15s_builtin_app/))

  [Google's Archived APK format is a new way to free up storage on Android](https://www.xda-developers.com/android-archived-apk-announcement/)

- Android 15

  > Android 15’s new app archiving feature works with apps distributed as both APKs and Android App Bundles. The fact that Android 15’s app archiving feature works with regular APKs isn’t mentioned in Google’s documentation, but it’s easy to verify.

  > When Android 15 archives an app like this, it doesn’t install an “archived APK” on top of it. Instead, it completely deletes the app installation files but still treats the app like it’s installed, so it appears in the home screen and in Settings. Android also stores a copy of the app’s original icon in a private data directory which it then applies a filter over and adds an overlay to make it clear the app is archived.
  
  > One of the main reasons why Google wanted to bake app archiving support into the OS is so third-party app stores can support the feature. Most third-party app stores don’t use app bundles, though, which is why Google decided to make app archiving in Android 15 work with apps distributed as APKs, too.

  [Android 15 app archiving is a lot more flexible than you may realize - Android Authority](https://www.androidauthority.com/android-15-app-archiving-apks-3490945/)

[Archive unused apps on Android - Android Help](https://support.google.com/android/answer/15523443)

## Tools
- [CorePatch](https://github.com/LSPosed/CorePatch) (核心破解)
  - 签名校验
  - 降级安装
    - 不支持 ColorOS: [\[BUG\] 模块在1+9R ColorOS11部分功能无效 - Issue #18](https://github.com/LSPosed/CorePatch/issues/18)
