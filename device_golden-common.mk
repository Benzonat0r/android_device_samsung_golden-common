#
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2013 Óliver García Albertos (oliverarafo@gmail.com)
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

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit common configuration for Samsung u8500 devices
$(call inherit-product-if-exists, device/samsung/u8500-common/device_u8500-common.mk)

# TODO: Inherit the proprietary common vendors blobs for all Samsung Golden variants.
# $(call inherit-product-if-exists, vendor/samsung/golden-common/golden-common-vendor.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.samsunggolden:root/fstab.samsunggolden \
    $(LOCAL_PATH)/rootdir/lib/modules/j4fs.ko:root/lib/modules/j4fs.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/param.ko:root/lib/modules/param.ko

# TouchScreen & Inputs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    ste.cam.ext.cfg.path.secondary=/system/usr/share/camera/config_file/aptina_mt9v113.dat

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/cspsa.conf:system/etc/cspsa.conf
# Vold
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/vold.fstab:system/etc/vold.fstab
