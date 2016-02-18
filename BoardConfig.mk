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
# Device specific headers
TARGET_SPECIFIC_HEADER_PATH := device/lge/e980/include

# Bootloader, kernel
BOARD_KERNEL_CMDLINE := vmalloc=600M console=ttyHSL0,115200,n8 lpj=67677 user_debug=31 msm_rtb.filter=0x0 ehci-hcd.park=3 coresight-etm.boot_enable=0 androidboot.hardware=geefhd
TARGET_BOOTLOADER_BOARD_NAME := geefhd
TARGET_BOOTLOADER_NAME=e980

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/lge/e980/bluetooth/vnd_gk.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/e980/bluetooth

# Wi Fi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4334
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_BAND                        := 802_11_ABG
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

# Recovery
# TODO: TWRP-ify
BOARD_USE_CUSTOM_RECOVERY_FONT:= \"roboto_23x41.h\"
TARGET_RECOVERY_FSTAB = device/lge/e980/fstab.geefhd
ENABLE_LOKI_RECOVERY := true
BOARD_RECOVERY_SWIPE := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2621440000 # 2500M. Actually 2560, but hold some in reserve

# Vendor files
-include vendor/lge/e980/BoardConfigVendor.mk

# OTA
TARGET_OTA_ASSERT_DEVICE := e986,e980,geefhd,e988,gkatt

# Extensions
TARGET_RELEASETOOLS_EXTENSIONS := device/lge/e980/loki

MALLOC_IMPL := dlmalloc

# CFLAGS
COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"androidboot.mode"' -DBOARD_CHARGING_CMDLINE_VALUE='"chargerlogo"'
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# CPU, GPU
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno320
TARGET_NO_RADIOIMAGE := true
BOARD_EGL_CFG := device/lge/e980/egl.cfg
#BOARD_USES_HGL := true
#BOARD_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITION := false

# Bootloader
TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000

# ALSA
BOARD_USES_ALSA_AUDIO:= true
BOARD_USES_LEGACY_ALSA_AUDIO:= false
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_HAVE_LOW_LATENCY_AUDIO := true

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
RECOVERY_FSTAB_VERSION = 2

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 880803840 # 840M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6189744128 # 5.9G
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Other stuff
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_USES_SECURE_SERVICES := true
BOARD_USES_EXTRA_THERMAL_SENSOR := true
BOARD_USES_CAMERA_FAST_AUTOFOCUS := true
TARGET_NO_RPC := true
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_LOGD := false
BOARD_USES_LEGACY_MMAP := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# RIL and HW classes
BOARD_RIL_CLASS := ../../../device/lge/e980/ril
BOARD_HARDWARE_CLASS := device/lge/e980/cmhw

# SELINUX xD
# qcom sepolicy
include device/qcom/sepolicy/sepolicy.mk

# SELinux policies
BOARD_SEPOLICY_DIRS += \
        device/lge/e980/sepolicy

# Enable dex-preoptimization to speed up first boot sequence. Disabled until I get that damn thing to boot.
#ifeq ($(HOST_OS),linux)
# ifeq ($(WITH_DEXPREOPT),)
#    WITH_DEXPREOPT := true
#  endif
#endif
