#import "@local/ib:0.1.0": *
#show: ib
#title[Android Security]
- Root access
- Screen lock (the Android Lockscreen)
- Reset lock (Factory Reset Prevention, FRP)
- Bootloader lock
- ADB lock (developer mode)
- MNO/Carrier lock (SIM lock)
- Device lock

#a[Android security trade-offs 0: Ecosystem complexity | René Mayrhofer][https://www.mayrhofer.eu.org/post/android-tradeoffs-0-meta/]
- #a[Android security trade-offs 1: Root access | René Mayrhofer][https://www.mayrhofer.eu.org/post/android-tradeoffs-1-rooting/]
- #a[Android security trade-offs 2: Lock states | René Mayrhofer][https://www.mayrhofer.eu.org/post/android-tradeoffs-2-lockstates/]

= Files
- `MANAGE_EXTERNAL_STORAGE`
  : #a[Manage all files on a storage device  |  App data and files  |  Android Developers][https://developer.android.com/training/data-storage/manage-all-files]

#footnote[#a[Is there a way to access the `/data/data` folder in Android 14 without root? : r/AndroidQuestions][https://www.reddit.com/r/AndroidQuestions/comments/192vfjt/is_there_a_way_to_access_the_datadata_folder_in/]]

= Tools
- #a[Shizuku: Using system APIs directly with adb/root privileges from normal apps through a Java process started with `app_process`.][https://github.com/RikkaApps/Shizuku]
