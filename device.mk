#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_yupikidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/audio_platform_info_yupikidp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_yupikidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_yupikidp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_dynamic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_overlay_dynamic.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_yupikidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/sound_trigger_mixer_paths_yupikidp.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/sound_trigger_platform_info.xml

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.redwood.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.redwood.rc

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# FaceSense
PRODUCT_SYSTEM_PROPERTIES += \
    ro.face.sense_service.camera_id=1

# Overlays-RRO
PRODUCT_PACKAGES += \
    redwoodCNSettingsProviderOverlay \
    redwoodCNWifiOverlay \
    redwoodGLSettingsProviderOverlay \
    redwoodGLWifiOverlay \
    redwoodINSettingsProviderOverlay \
    redwoodINWifiOverlay \
    redwoodproCNSettingsProviderOverlay \
    redwoodproCNWifiOverlay

# Refresh Rate
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.use_content_detection_for_refresh_rate=false

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# SurfaceFlinger
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=4000 \
    ro.surface_flinger.set_touch_timer_ms=4000 \
    ro.surface_flinger.set_display_power_timer_ms=1000

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/redwood/redwood-vendor.mk)
