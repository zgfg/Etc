ECHO OFF
CLS

adb wait-for-device devices
PAUSE

ECHO List packages
adb shell pm list packages
PAUSE

ECHO List disabled packages
adb shell pm list packages -d
PAUSE


ECHO Disable (Not debloated by Systemless Debloater?) *
adb shell pm disable-user com.miui.analytics
PAUSE

ECHO Disable Miui Ads *
adb shell pm disable-user com.miui.msa.global
PAUSE

ECHO Disable Feedback *
adb shell pm disable-user com.miui.bugreport
PAUSE

ECHO Disable Miui Daemon
adb shell pm disable-user com.miui.daemon
PAUSE

ECHO Disable Services and Feedback *
adb shell pm disable-user com.miui.miservice
PAUSE

ECHO Disable Yellow Page *
adb shell pm disable-user com.miui.yellowpage
PAUSE

ECHO Disable GetApps (Disabled by default) ** 
adb shell pm disable-user com.xiaomi.mipicks
PAUSE

ECHO Disable MiCredit (Disabled by default) **
adb shell pm disable-user com.micredit.in
PAUSE

ECHO Disable PaymentService *
adb shell pm disable-user com.xiaomi.payment
PAUSE

ECHO Disable Mi Pay (disabled by default) **
adb shell pm disable-user com.mipay.wallet.in
PAUSE

ECHO Disable IMS *
adb shell pm disable-user org.codeaurora.ims
PAUSE

ECHO Disable Mi Link *
adb shell pm disable-user com.milink.service
PAUSE

ECHO Disable Mi Play *
adb shell pm disable-user com.xiaomi.miplay_client
PAUSE

ECHO Disable Uce Shim (Keep?) *
REM adb shell pm disable-user com.qualcomm.qti.uceShimService
PAUSE

ECHO Disable Quick Apps *
adb shell pm disable-user com.miui.hybrid
adb shell pm disable-user com.miui.hybrid.accessory
PAUSE

ECHO Disable Catch Log *
adb shell pm disable-user com.bsp.catchlog
PAUSE

ECHO Disable Joyose *
adb shell pm disable-user com.xiaomi.joyose
PAUSE

ECHO Disable Weather (Keep) *
REM adb shell pm disable-user com.miui.weather
PAUSE

ECHO Disable Quick Ball
adb shell pm disable-user com.miui.touchassistant
PAUSE

ECHO Disable Wallpaper (Not debloated by Systemless Debloater?) *
adb shell pm disable-user com.miui.android.fashiongallery
PAUSE

ECHO Disable Miui Notes (Keep for now) *
REM adb shell pm disable-user com.miui.notes
PAUSE

ECHO Disable File Manager (Keep)
REM adb shell pm disable-user com.mi.android.globalFileexplorer
PAUSE

ECHO Disable Calculator (Keep for now) *
REM adb shell pm disable-user com.miui.calculator
PAUSE

ECHO Disable Easter Egg *
adb shell pm disable-user com.android.egg
PAUSE

ECHO Disable Market Feedback Agent *
adb shell pm disable-user com.google.android.feedback
PAUSE

ECHO Disable System Tracing *
adb shell pm disable-user com.android.traceur
PAUSE

ECHO Disable Device Health Services *
adb shell pm disable-user com.google.android.apps.turbo
PAUSE

ECHO Disable SIM Toolkit *
adb shell pm disable-user com.android.stk
PAUSE

ECHO Disable Browser *
adb shell pm disable-user com.android.browser
PAUSE

ECHO Disable Partner Bookmarks *
adb shell pm disable-user com.android.bookmarkprovider
adb shell pm disable-user com.android.providers.partnerbookmarks
adb shell pm disable-user com.google.android.partnersetup
PAUSE

ECHO Disable DT TSC (disabled by default) **
adb shell pm disable-user de.telekom.tsc
PAUSE

ECHO Disable DayDreams *
adb shell pm disable-user com.android.dreams.basic
adb shell pm disable-user com.android.dreams.phototable													   
PAUSE

ECHO Disable Android Auto (Keep) *
REM adb shell pm disable-user com.google.android.projection.gearhead
PAUSE

ECHO Disable Google (Keep) *
REM adb shell pm disable-user com.google.android.googlequicksearchbox
PAUSE

ECHO Disable Digital Wellbeing *
adb shell pm disable-user com.google.android.apps.wellbeing
PAUSE

ECHO Disable Facebook *
adb shell pm disable-user com.facebook.appmanager
adb shell pm disable-user com.facebook.system
adb shell pm disable-user com.facebook.services
PAUSE

ECHO Disable Google One *
adb shell pm disable-user com.google.android.apps.subscriptions.red
PAUSE

ECHO Disable Cne App *
adb shell pm disable-user com.qualcomm.qti.cne
PAUSE

ECHO Disable Google Duo (Not present)
REM adb shell pm disable-user com.google.android.apps.tachyon
PAUSE

ECHO Disable Google Play Music (Not present)
REM adb shell pm disable-user com.google.android.music
PAUSE

ECHO Disable Google Play Videos (Not present)
REM adb shell pm disable-user com.google.android.videos
PAUSE

ECHO Disable Google Photos (Not present)
REM adb shell pm disable-user com.google.android.apps.photos
PAUSE

ECHO Disable GMail *
adb shell pm disable-user com.google.android.gm
PAUSE

ECHO Booking.com  (Not present)
REM adb shell pm disable-user com.booking
PAUSE

ECHO Disable YouTube (Keep) *
REM adb shell pm disable-user com.google.android.youtube
PAUSE

REM com.miui.android.fashiongallery is installed to /data/app (???)
REM All other packages marked by * are installed to /system and can be also removed/debloated by MiuiDebloater Magisk module

ECHO List disabled packages
adb shell pm list packages -d
PAUSE

ECHO Optimize packages
REM adb shell cmd package bg-dexopt-job
PAUSE

EXIT


REM Semantics

ECHO Disable Google
REM adb shell pm disable-user com.google.android.googlequicksearchbox
PAUSE

ECHO Re-enable Google
REM adb shell pm enable com.google.android.googlequicksearchbox
PAUSE

ECHO Uninstall Google
REM adb shell pm uninstall -k --user 0 com.google.android.googlequicksearchbox
PAUSE

ECHO Re-install Google
REM adb shell cmd package install-existing com.google.android.googlequicksearchbox
PAUSE

EXIT


REM Disabled by ADB
>adb shell pm list packages -d
package:com.booking
package:com.google.android.apps.subscriptions.red
package:com.android.dreams.phototable
package:com.android.dreams.basic
package:com.miui.touchassistant
package:com.xiaomi.joyose
package:com.xiaomi.payment
package:com.miui.daemon
package:com.bsp.catchlog
package:com.miui.msa.global
package:com.android.browser
package:com.miui.hybrid
package:com.android.egg
package:com.android.stk
package:com.miui.miservice
package:com.google.android.gm
package:com.miui.android.fashiongallery (Not debloated by Systemless Debloater?)
package:com.facebook.services
package:com.miui.bugreport
package:com.google.android.apps.wellbeing
package:com.google.android.partnersetup
package:com.google.android.feedback
package:com.miui.hybrid.accessory
package:com.android.providers.partnerbookmarks
package:com.facebook.system
package:com.miui.analytics (Not debloated by Systemless Debloater?)
package:com.android.bookmarkprovider
package:com.google.android.apps.turbo
package:com.miui.yellowpage
package:com.facebook.appmanager
package:com.android.traceur

REM Disabled by default
>adb shell pm list packages -d
package:de.telekom.tsc
package:com.xiaomi.mipicks
package:com.micredit.in (Not debloated by Systemless Debloater?)
package:com.mipay.wallet.in

REM Installed packages
>adb shell pm list packages
package:com.miui.screenrecorder
package:com.google.android.networkstack.tethering
package:com.android.cts.priv.ctsshim
package:com.google.android.youtube
package:com.qualcomm.qti.qcolor
package:com.android.internal.display.cutout.emulation.corner
package:com.google.android.ext.services
package:com.android.internal.display.cutout.emulation.double
package:com.android.providers.telephony
package:com.android.dynsystem
package:com.miui.powerkeeper
package:com.xiaomi.miplay_client
package:com.android.theme.color.amethyst
package:com.android.theme.icon.pebble
package:com.google.android.googlequicksearchbox
package:cn.wps.xiaomi.abroad.lite
package:com.miui.qr
package:com.google.android.cellbroadcastservice
package:com.android.providers.calendar
package:com.google.android.apps.googleassistant
package:com.android.providers.media
package:com.milink.service
package:com.qti.service.colorservice
package:com.google.android.onetimeinitializer
package:com.google.android.ext.shared
package:com.android.internal.systemui.navbar.gestural_wide_back
package:com.xiaomi.powerchecker
package:com.android.theme.color.sand
package:com.qualcomm.qti.simcontacts
package:com.xiaomi.account
package:com.android.wallpapercropper
package:com.android.theme.icon.vessel
package:com.android.theme.color.cinnamon
package:miui.systemui.plugin
package:com.xiaomi.mi_connect_service
package:com.android.theme.icon_pack.victor.settings
package:com.xiaomi.micloud.sdk
package:com.android.protips
package:com.android.theme.icon_pack.rounded.systemui
package:com.android.theme.icon.taperedrect
package:com.android.updater
package:com.android.externalstorage
package:com.qualcomm.uimremoteclient
package:com.android.htmlviewer
package:com.miui.extraphoto
package:com.miui.securityadd
package:com.qualcomm.qti.uceShimService
package:com.android.companiondevicemanager
package:com.miui.gallery
package:com.android.mms.service
package:com.android.providers.downloads
package:com.google.android.apps.messaging
package:com.miui.securitycenter
package:com.miui.systemserver
package:com.android.theme.icon_pack.rounded.android
package:vendor.qti.hardware.cacert.server
package:com.quicinc.voice.activation
package:com.xiaomiui.downloader
package:com.qualcomm.qti.telephonyservice
package:android.deviceandroidconfig.config.overlay
package:com.qualcomm.qti.performancemode
package:com.miui.videoplayer
package:com.android.theme.icon_pack.victor.systemui
package:com.android.theme.icon_pack.circular.themepicker
package:vendor.qti.iwlan
package:com.google.android.configupdater
package:com.android.systemui.icon.overlay
package:com.google.android.providers.media.module
package:com.google.android.overlay.modules.permissioncontroller
package:com.android.soundrecorder
package:com.qualcomm.uimremoteserver
package:com.android.theme.color.tangerine
package:com.qti.confuridialer
package:com.miui.guardprovider
package:android.qvaoverlay.common
package:com.google.ar.core
package:com.android.providers.downloads.ui
package:com.android.vending
package:com.android.pacprocessor
package:com.android.simappdialog
package:com.miui.backup
package:com.android.settings.overlay.miui
package:com.miui.notification
package:android.overlay.common
package:com.android.theme.color.aquamarine
package:com.miui.micloudsync
package:com.android.internal.display.cutout.emulation.hole
package:com.android.internal.display.cutout.emulation.tall
package:com.android.networkstack.overlay
package:com.miui.easygo
package:com.android.certinstaller
package:com.android.theme.color.black
package:com.android.carrierconfig
package:com.google.android.marvin.talkback
package:com.android.theme.color.green
package:com.android.theme.color.ocean
package:com.android.theme.color.space
package:com.android.internal.systemui.navbar.threebutton
package:com.google.android.apps.work.oobconfig
package:com.xiaomi.migameservice
package:com.qti.qualcomm.datastatusnotification
package:android
package:com.android.hotwordenrollment.xgoogle
package:com.qualcomm.wfd.service
package:android.miui.overlay
package:com.miui.securitycore
package:com.android.theme.icon_pack.rounded.launcher
package:com.qti.qualcomm.deviceinfo
package:com.android.theme.icon_pack.kai.settings
package:ru.andr7e.deviceinfohw
package:com.android.mtp
package:com.android.nfc
package:com.android.ons
package:com.android.uwb
package:com.android.backupconfirm
package:com.xiaomi.simactivate.service
package:com.miui.phrase
package:com.miui.player
package:com.android.provision
package:org.codeaurora.ims
package:com.android.statementservice
package:android.overlay.target
package:com.miui.system
package:com.google.android.overlay.gmsconfig.common
package:com.android.theme.icon_pack.sam.settings
package:com.miui.cleaner
package:com.android.settings.intelligence
package:com.qualcomm.qti.gpudrivers.lahaina.api30
package:com.miui.global.packageinstaller
package:com.android.internal.systemui.navbar.gestural_extra_wide_back
package:com.google.android.permissioncontroller
package:com.miui.systemui.devices.overlay
package:com.miui.compass
package:com.android.theme.icon_pack.kai.themepicker
package:com.qualcomm.qti.dynamicddsservice
package:com.google.android.setupwizard
package:com.miui.aod
package:com.miui.cit
package:com.miui.rom
package:com.qualcomm.qti.xrvd.service
package:com.qualcomm.qcrilmsgtunnel
package:com.android.providers.settings
package:com.android.sharedstoragebackup
package:com.android.theme.icon_pack.victor.launcher
package:com.android.printspooler
package:com.android.hotwordenrollment.okgoogle
package:com.miui.misound
package:com.qualcomm.qti.services.systemhelper
package:com.android.theme.icon_pack.filled.settings
package:com.android.wifi.resources.overlay.common
package:org.ifaa.aidl.manager
package:com.google.android.overlay.modules.ext.services
package:com.android.systemui.gesture.line.overlay
package:com.fido.xiaomi.uafclient
package:com.duokan.phone.remotecontroller
package:com.android.theme.icon_pack.kai.systemui
package:com.android.se
package:com.android.inputdevices
package:com.fido.asm
package:com.android.systemui.deviceconfig.config.overlay
package:com.google.android.dialer
package:com.qti.slaservice
package:com.android.bips
package:com.qti.dpmserviceapp
package:com.google.android.captiveportallogin
package:com.android.theme.icon_pack.circular.settings
package:com.google.android.overlay.gmsconfig.comms
package:com.qti.xdivert
package:com.android.systemui.overlay.miui
package:com.google.android.apps.docs
package:com.google.android.apps.maps
package:com.android.theme.icon_pack.sam.systemui
package:com.miui.mediafeature
package:com.google.android.modulemetadata
package:com.miui.cloudbackup
package:com.miui.wallpaper.overlay
package:com.miui.face.overlay.miui
package:com.android.cellbroadcastreceiver
package:com.google.android.webview
package:com.android.theme.icon.teardrop
package:com.google.android.overlay.modules.documentsui
package:com.amazon.appmanager
package:com.google.android.networkstack
package:com.google.android.contacts
package:com.android.server.telecom
package:com.android.server.telecom.overlay.miui
package:com.google.android.syncadapters.contacts
package:com.android.theme.icon_pack.rounded.themepicker
package:com.android.keychain
package:com.qti.snapdragon.qdcm_ff
package:com.android.wifi.resources.overlay.target
package:com.android.camera
package:com.android.chrome
package:com.xiaomi.xmsf
package:com.android.theme.icon_pack.filled.systemui
package:com.google.android.packageinstaller
package:com.miui.mishare.connectivity
package:com.google.android.gms
package:com.google.android.gsf
package:com.google.android.ims
package:com.google.android.tts
package:com.android.wifi.resources
package:com.android.phone.overlay.common
package:com.android.carrierconfig.overlay.common
package:com.google.android.apps.walletnfcrel
package:com.android.calllogbackup
package:com.miui.freeform
package:android.aosp.overlay
package:com.android.systemui.overlay.common
package:com.xiaomi.xmsfkeeper
package:com.miui.rom.miuidefaultconfigoverlay.config.overlay
package:com.android.server.telecom.overlay.common
package:com.android.localtransport
package:com.google.android.overlay.gmsconfig.gsa
package:com.miui.miwallpaper.overlay
package:com.android.carrierdefaultapp
package:com.qualcomm.qti.remoteSimlockAuth
package:com.xiaomi.finddevice
package:com.qualcomm.qti.devicestatisticsservice
package:com.android.theme.icon_pack.sam.android
package:com.android.theme.font.notoserifsource
package:com.android.theme.icon_pack.filled.android
package:com.android.proxyhandler
package:com.android.internal.display.cutout.emulation.waterfall
package:com.qualcomm.qti.workloadclassifier
package:com.netflix.mediaclient
package:com.android.theme.icon_pack.circular.systemui
package:com.mi.android.globalFileexplorer
package:com.rongcard.eidapi
package:com.miui.notes
package:com.miui.wmsvc
package:com.google.android.connectivity.resources
package:com.google.android.overlay.modules.permissioncontroller.forframework
package:com.xiaomi.misettings
package:com.topjohnwu.magisk
package:com.google.android.printservice.recommendation
package:com.google.android.calendar
package:com.android.theme.icon_pack.kai.android
package:com.miui.cloudservice
package:com.android.managedprovisioning
package:com.fingerprints.sensortesttool
package:com.android.soundpicker
package:com.tencent.soter.soterserver
package:com.google.android.documentsui
package:com.miui.audiomonitor
package:com.google.mainline.telemetry
package:com.xiaomi.mtb
package:com.android.theme.icon_pack.kai.launcher
package:com.mixplorer.beta
package:com.android.smspush
package:com.miui.calculator
package:com.android.wallpaper.livepicker
package:com.miui.cloudservice.sysbase
package:com.android.apps.tag
package:com.miui.miwallpaper
package:com.android.systemui.navigation.bar.overlay
package:com.android.theme.icon_pack.sam.launcher
package:com.xiaomi.bluetooth
package:com.android.theme.icon.squircle
package:com.google.android.cellbroadcastservice.overlay.miui
package:com.google.android.networkstack.permissionconfig
package:com.android.theme.icon_pack.victor.android
package:android.autoinstalls.config.Xiaomi.model
package:com.android.storagemanager
package:com.wdstechnology.android.kryten
package:com.android.theme.color.palette
package:com.android.settings
package:com.qualcomm.qti.cne
package:com.qualcomm.qti.lpa
package:com.qualcomm.qti.smq
package:com.qualcomm.qti.uim
package:com.miui.weather2
package:com.android.theme.icon_pack.filled.launcher
package:com.modemdebug
package:com.google.android.projection.gearhead
package:com.qualcomm.location
package:com.android.systemui.miui.optimization.overlay
package:com.xiaomi.scanner
package:com.android.cts.ctsshim
package:com.android.theme.color.carbon
package:com.miui.mediaeditor
package:com.google.android.overlay.modules.modulemetadata.forframework
package:com.offsec.nhterm
package:io.github.vvb2060.keyattestation
package:com.android.theme.icon_pack.circular.launcher
package:com.qualcomm.qti.uimGbaApp
package:com.qti.diagservices
package:com.miui.systemui.carriers.overlay
package:com.miui.systemui.overlay.devices.android
package:com.qualcomm.qti.services.secureui
package:com.xiaomi.bluetooth.overlay
package:com.android.vpndialogs
package:com.android.phone
package:com.android.overlay.gmstelephony
package:com.android.shell
package:com.android.theme.icon_pack.filled.themepicker
package:com.android.wallpaperbackup
package:com.android.providers.blockednumber
package:com.miui.screenshot
package:com.android.overlay.gmstelecomm
package:com.android.providers.userdictionary
package:com.google.android.apps.setupwizard.searchselector
package:com.android.emergency
package:com.qualcomm.qti.seccamservice
package:com.android.hotspot2.osulogin
package:com.google.android.gms.location.history
package:com.android.internal.systemui.navbar.gestural
package:mega.privacy.android.app
package:com.android.location.fused
package:com.android.theme.icon_pack.victor.themepicker
package:com.android.theme.color.orchid
package:com.android.deskclock
package:com.android.systemui
package:com.google.android.apps.youtube.music
package:com.android.wifi.resources.xiaomi
package:com.android.theme.color.purple
package:com.android.bluetoothmidiservice
package:com.qualcomm.qti.poweroffalarm
package:com.qti.ltebc
package:com.google.android.cellbroadcastreceiver.overlay.miui
package:com.mi.globallayout
package:com.xiaomi.discover
package:com.android.thememanager
package:com.google.android.cellbroadcastreceiver
package:com.android.thememanager.module
package:com.lbe.security.miui
package:com.android.theme.icon_pack.sam.themepicker
package:com.qualcomm.qti.server.wigig.tethering.rro
package:com.android.bluetooth
package:com.qualcomm.timeservice
package:com.qualcomm.atfwd
package:com.qualcomm.embms
package:com.android.providers.contacts
package:com.android.theme.icon.roundedrect
package:com.android.internal.systemui.navbar.gestural_narrow_back
package:com.android.cellbroadcastreceiver.overlay.common
package:com.android.theme.icon_pack.rounded.settings
package:com.miui.core
package:com.miui.face
package:com.miui.home
package:com.google.android.inputmethod.latin
package:com.xiaomi.digitalkey
package:com.miui.audioeffect
package:com.android.theme.icon_pack.circular.android
package:com.google.android.apps.restore
