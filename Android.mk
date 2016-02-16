#
# Copyright 2012 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

ifneq ($(filter geefhd e980,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := hostapd_default.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/hostapd
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := wpa_supplicant_overlay.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/wifi
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := p2p_supplicant_overlay.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/wifi
include $(BUILD_PREBUILT)

include $(call first-makefiles-under, device/lge/e980)

$(shell mkdir -p $(PRODUCT_OUT)/system/vendor/lib/egl && pushd $(PRODUCT_OUT)/system/vendor/lib > /dev/null && ln -s egl/eglsubAndroid.so egl-eglsubAndroid.so && popd > /dev/null)
$(shell mkdir -p $(PRODUCT_OUT)/system/vendor/lib/egl && pushd $(PRODUCT_OUT)/system/vendor/lib > /dev/null && ln -s egl/libGLESv1_CM_adreno.so egl-libGLESv1_CM_adreno.so && popd > /dev/null)
$(shell mkdir -p $(PRODUCT_OUT)/system/vendor/lib/egl && pushd $(PRODUCT_OUT)/system/vendor/lib > /dev/null && ln -s egl/libGLESv2_adreno.so egl-libGLESv2_adreno.so && popd > /dev/null)

endif

