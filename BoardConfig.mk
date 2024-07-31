#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/redwood

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := redwood

# Board
TARGET_BOOTLOADER_BOARD_NAME := redwood

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/hidl/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG += vendor/redwood_QGKI.config

# Kernel modules
BOOT_KERNEL_MODULES := \
    focaltech_touch.ko \
    goodix_core.ko \
    hwid.ko \
    msm_drm.ko

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Vibrator
SOONG_CONFIG_xiaomiSm8350Vars_vibrator_use_effect_stream := true

# Include proprietary files
include vendor/xiaomi/redwood/BoardConfigVendor.mk
