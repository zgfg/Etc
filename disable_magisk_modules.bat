#From TWRP to force Core Only mode  (no modules), access to /data/cache needed
touch /cache/.disable_magisk

#From TWRP to disable or remove Magisk morule, access to /data needed
touch /data/adb/modules/<module folder>/disable
touch /data/adb/modules/<module folder>/remove

#From PC by adb to remove all Magisk modules (not working on Huawei P9)
adb wait-for-device shell magisk --remove-modules
