REM cmd
echo on
PAUSE
REM cd \adb
PAUSE

REM adb sideload twrp-xyz.zip
PAUSE

adb wait-for-device devices
PAUSE
REM adb wait-for-device shell magisk --remove-modules
PAUSE

adb reboot-bootloader
PAUSE

fastboot devices
PAUSE

REM fastboot continue
REM PAUSE

fastboot getvar product
PAUSE

fastboot getvar anti
PAUSE

fastboot oem device-info
PAUSE

fastboot boot boot-Xiaomi.eu_Stable_13.0.2.0-12.img
REM fastboot boot OrangeFox-R11.1_2-Unofficial-lisa.img
REM fastboot boot OrangeFox-R11.1_2_A12-Beta-lisa.img
REM fastboot boot OrangeFox-R11.1_0-Unofficial-lisa.img
REM fastboot boot boot-Magisk_Canary_25203-xiaomi.eu_multi_MI11LE_XM11Lite5GNE_22.8.25_v13-12.img
PAUSE

REM fastboot flash boot boot-Xiaomi.eu_Stable_13.0.2.0-12.img
REM fastboot flash boot boot-xiaomi.eu_multi_MI11LE_XM11Lite5GNE_22.8.25_v13-12.img
REM fastboot flash boot boot-Magisk_Canary_25203-xiaomi.eu_multi_MI11LE_XM11Lite5GNE_22.8.25_v13-12.img
PAUSE

fastboot reboot

EXIT
