#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL geefhd devices, and
# are also specific to geefhd devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS += device/lge/e980/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
   
PRODUCT_PACKAGES += \
       lights.geefhd \
       camera.geefhd

PRODUCT_PACKAGES += \
       hostapd_default.conf \
       wpa_supplicant_overlay.conf \
       p2p_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
        device/lge/e980/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
        device/lge/e980/thermald-geefhd.conf:system/etc/thermald.conf

# sysinit was missing...
PRODUCT_COPY_FILES += \
        device/lge/e980/init.d/sysinit:system/bin/sysinit \

# Add bluetooth configuration from stock
PRODUCT_COPY_FILES += \
       device/lge/e980/bluetooth_extras/etc/audio.conf:system/etc/bluetooth/audio.conf \
       device/lge/e980/bluetooth_extras/etc/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
       device/lge/e980/bluetooth_extras/etc/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
       device/lge/e980/bluetooth_extras/etc/avrcp_toggle_white_list.conf:system/etc/bluetooth/avrcp_toggle_white_list.conf \
       device/lge/e980/bluetooth_extras/etc/blacklist.conf:system/etc/bluetooth/blacklist.conf \
       device/lge/e980/bluetooth_extras/etc/block_avrcp_toggle_new.conf:system/etc/bluetooth/block_avrcp_toggle_new.conf \
       device/lge/e980/bluetooth_extras/etc/bt.a2dp.tuning.sh:system/etc/bluetooth/bt.a2dp.tuning.sh \
       device/lge/e980/bluetooth_extras/etc/bt_did.conf:system/etc/bluetooth/bt_did.conf \
       device/lge/e980/bluetooth_extras/etc/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
       device/lge/e980/bluetooth_extras/etc/bt_tts_list.conf:system/etc/bluetooth/bt_tts_list.conf \
       device/lge/e980/bluetooth_extras/etc/carkit_cod_headsets.conf:system/etc/bluetooth/carkit_cod_headsets.conf \
       device/lge/e980/bluetooth_extras/etc/device_config.xml:system/etc/bluetooth/device_config.xml \
       device/lge/e980/bluetooth_extras/etc/input.conf:system/etc/bluetooth/input.conf \
       device/lge/e980/bluetooth_extras/etc/iop_bt.db:system/etc/bluetooth/iop_bt.db \
       device/lge/e980/bluetooth_extras/etc/main.conf:system/etc/bluetooth/main.conf \
       device/lge/e980/bluetooth_extras/etc/network.conf:system/etc/bluetooth/network.conf \

# Add bluetooth framework file...
PRODUCT_COPY_FILES += \
       device/lge/e980/bluetooth_extras/framework/com.broadcom.bt.jar:system/framework/com.broadcom.bt.jar \

# Add bluetooth libs and binaries. Those should be in vendor/lge/e980, but that one needs some updating...
PRODUCT_COPY_FILES += \
       device/lge/e980/bluetooth_extras/lib/libbluedroid_bdt.so:system/lib/libbluedroid_bdt.so \
       device/lge/e980/bluetooth_extras/lib/libbluetooth_jni.so:system/lib/libbluetooth_jni.so \
       device/lge/e980/bluetooth_extras/lib/libbluetoothsettings_jni.so:system/lib/libbluetoothsettings_jni.so \
       device/lge/e980/bluetooth_extras/xbin/hciconfig:system/xbin/hciconfig \
       device/lge/e980/bluetooth_extras/xbin/hcidump:system/xbin/hcidump \
       device/lge/e980/bluetooth_extras/xbin/hcitool:system/xbin/hcitool \

PRODUCT_COPY_FILES += \
       device/lge/e980/initlogo-shady.rle:root/initlogo.rle888 \
       device/lge/e980/initlogo-shady.rle:root/initlogo.rle \
       device/lge/e980/init.geefhd.rc:root/init.geefhd.rc \
       device/lge/e980/fstab.geefhd:root/fstab.geefhd \
       device/lge/e980/ueventd.geefhd.rc:root/ueventd.geefhd.rc

PRODUCT_COPY_FILES += \
       device/lge/e980/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_COPY_FILES += \
       device/lge/e980/keypad_8064.kl:system/usr/keylayout/gk-keypad-8064.kl

PRODUCT_COPY_FILES += \
       device/lge/e980/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

PRODUCT_PROPERTY_OVERRIDES += \
       ro.sf.lcd_density=420

PRODUCT_PACKAGES += \
       hwaddrs

PRODUCT_PROPERTY_OVERRIDES += \
       ro.bt.bdaddr_path=/data/misc/bdaddr

# This hw ships locked, work around it with loki
PRODUCT_PACKAGES += \
       loki.sh \
       loki_tool_static_gproj \
       recovery-transform.sh

PRODUCT_COPY_FILES += \
       frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PROPERTY_OVERRIDES += \
       ro.telephony.default_network=9 \
       telephony.lteOnGsmDevice=1 \
       camera2.portability.force_api=1 \

# Add pm.sleep_mode by popular request.
PRODUCT_PROPERTY_OVERRIDES += \
       pm.sleep_mode=1 \

PRODUCT_PACKAGES += \
       libwpa_client \
       hostapd \
       dhcpcd.conf \
       wpa_supplicant \
       wpa_supplicant.conf

PRODUCT_PACKAGES += \
       charger_res_images

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

PRODUCT_COPY_FILES += \
        device/lge/e980/init.gee-common.rc:root/init.gee-common.rc \
        device/lge/e980/init.gee.usb.rc:root/init.gee.usb.rc

PRODUCT_COPY_FILES += \
       device/lge/e980/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
       device/lge/e980/qosmgr_rules.xml:system/etc/qosmgr_rules.xml

PRODUCT_COPY_FILES += \
       device/lge/e980/media_profiles.xml:system/etc/media_profiles.xml \
       device/lge/e980/media_codecs.xml:system/etc/media_codecs.xml \
       frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
       frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
       device/lge/e980/kickstart_checker.sh:system/etc/kickstart_checker.sh

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
       device/lge/e980/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
       device/lge/e980/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
       device/lge/e980/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
       device/lge/e980/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
       device/lge/e980/touch_dev.idc:system/usr/idc/touch_dev.idc \
       device/lge/e980/touch_dev.kl:system/usr/keylayout/touch_dev.kl

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
       frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
       frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
       frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
       frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
       frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
       frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
       frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
       frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
       frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
       frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
       frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
       frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
       frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
       frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
       frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# GPS configuration
PRODUCT_COPY_FILES += \
       device/lge/e980/gps.conf:system/etc/gps.conf

# NFC packages
PRODUCT_PACKAGES += \
       libnfc \
       libnfc_jni \
       Nfc \
       Tag \
       com.android.nfc_extras

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/lge/e980/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/lge/e980/nfc/nfcee_access_debug.xml
endif

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
       $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
       frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
       frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

PRODUCT_PROPERTY_OVERRIDES += \
       ro.opengles.version=196608

# Audio Configuration
# FIXME: Remove persist.audio.handset.mic and persist.audio.fluence.mode
#        while switching new audio HAL from legacy HAL
PRODUCT_PROPERTY_OVERRIDES += \
       persist.audio.handset.mic.type=digital \
       persist.audio.dualmic.config=endfire \
       persist.audio.fluence.voicecall=true \
       persist.audio.handset.mic=dmic \
       persist.audio.fluence.mode=endfire \
       persist.audio.lowlatency.rec=false

# Bluetooth additional config...
PRODUCT_PROPERTY_OVERRIDES += \
       bluetooth.chip.vendor=brcm \
       ro.bluetooth.request.master=true \
       ro.bluetooth.remote.autoconnect=true \
       ro.bluetooth.PANenable = 1 \
       bluetooth.a2dp.sink.enabled=false \
       ro.product.bluetooth=4.0 \
       ro.bt.chipset=Broadcom BCM4334 \
       ro.bt.version=4.0 \
       ro.bt.stack=BTL-A \
       ro.bt.stack.version=5.0 \
       ro.bt.profiles=12806403 \
       service.brcm.bt.activation=0 \
       service.brcm.bt.srv_active=0 \
       service.brcm.bt.hcid_active=0 \
       service.brcm.bt.btld=0 \
       service.brcm.bt.btld_pid=0 \
       service.brcm.bt.avrcp_pass_thru=0 \
       service.brcm.bt.avrcp_toggle=1 \
       service.brcm.bt.btport_redir_on=1 \

# Better internet browsing & download speed
PRODUCT_PROPERTY_OVERRIDES += \
       net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960 \
       net.tcp.buffersize.wifi=4096,87380,256960,4096,16384,256960 \
       net.tcp.buffersize.umts=4096,87380,256960,4096,16384,256960 \
       net.tcp.buffersize.gprs=4096,87380,256960,4096,16384,256960 \
       net.tcp.buffersize.edge=4096,87380,256960,4096,16384,256960 \
       net.tcp.buffersize.hspa=6144,87380,524288,6144,16384,262144 \
       net.tcp.buffersize.lte=524288,1048576,2097152,524288,1048576,2097152 \
       net.tcp.buffersize.hsdpa=6144,87380,1048576,6144,87380,1048576 \
       net.tcp.buffersize.evdo_b=6144,87380,1048576,6144,87380,1048576 \

# Set ro.wifi.channels, may help with hotspot
PRODUCT_PROPERTY_OVERRIDES += \
       ro.wifi.channels=13 13 \

# Random overrides
PRODUCT_PROPERTY_OVERRIDES += \
       debug.performance.tuning=1 \

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
       persist.radio.apm_sim_not_pwdn=1

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
       ro.telephony.call_ring.multiple=0

PRODUCT_PROPERTY_OVERRIDES += \
       ro.telephony.ril_class=LgeLteRIL \
       ro.telephony.ril.config=qcomdsds

# Upto 3 layers can go through overlays
PRODUCT_PROPERTY_OVERRIDES += \
       persist.hwc.mdpcomp.enable=true \

# More overrides from stock build.prop
PRODUCT_PROPERTY_OVERRIDES += \
       debug.sf.hw=1 \
       debug.egl.hw=1 \
       debug.composition.type=gpu \
       video.accelerate.hw=1 \
       wlan.chip.vendor=brcm \
       wlan.chip.version=bcm4334 \
       ro.media.enc.jpeg.quality=100 \
       af.resampler.quality=255 \

PRODUCT_PACKAGES += \
       librs_jni \
       com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
       e2fsck

PRODUCT_PACKAGES += \
       libgenlock \
       liboverlay \
       hwcomposer.msm8960 \
       gralloc.msm8960 \
       copybit.msm8960 \
       memtrack.msm8960

PRODUCT_PACKAGES += \
       audio_policy.msm8960 \
       audio.primary.msm8960 \
       audio.a2dp.default \
       audio.usb.default \
       audio.r_submix.default \
       libaudio-resampler

# Voice processing
PRODUCT_PACKAGES += libqcomvoiceprocessing
PRODUCT_COPY_FILES += \
       device/lge/e980/audio_effects.conf:system/vendor/etc/audio_effects.conf

PRODUCT_PACKAGES += \
       libmm-omxcore \
       libdivxdrmdecrypt \
       libOmxVdec \
       libOmxVenc \
       libOmxCore \
       libstagefrighthw \
       libc2dcolorconvert

PRODUCT_PACKAGES += \
       libloc_adapter \
       libloc_eng \
       libloc_api_v02 \
       libgps.utils \
       gps.msm8960

# ShadySquirrel's edit: add & enable secure ADB.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
       rild.libpath=/system/lib/libril-qc-qmi-1.so \
       ro.adb.secure=1 \

PRODUCT_PROPERTY_OVERRIDES += \
       drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=wlan0 \
       wifi.supplicant_scan_interval=180

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
        media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
        debug.egl.recordable.rgba8888=1

PRODUCT_PROPERTY_OVERRIDES += \
       ro.qc.sensors.wl_dis=true \
       ro.qualcomm.sensors.smd=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
       persist.sys.usb.config=mtp

PRODUCT_COPY_FILES += \
       device/lge/e980/fetch-swv:system/bin/fetch-swv

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/lge/gproj
TARGET_KERNEL_CONFIG := zeKrnl_e980_defconfig

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(TARGET_KERNEL_SOURCE)
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
       $(LOCAL_KERNEL):kernel

# Call my vendor makefile
$(call inherit-product, vendor/ShadySquirrel/config/common.mk)
    
# This is the mako-specific audio package
$(call inherit-product, frameworks/base/data/sounds/AudioPackage10.mk)

$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
