$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit generic x86_64 settings
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_x86_64.mk)

# ---------------------------------------------------------
# Android TV Configuration
# ---------------------------------------------------------
PRODUCT_CHARACTERISTICS := tv
PRODUCT_AAPT_CONFIG := normal large xlarge xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Enable Android TV UI (Leanback)
PRODUCT_PACKAGES += \
    Launcher3 \
    TvSettings \
    TvProvider \
    LeanbackIME \
    music \
    BasicDreams

# Permissions for TV
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.leanback.xml:system/etc/permissions/android.software.leanback.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.gamepad.xml:system/etc/permissions/android.hardware.gamepad.xml

# ---------------------------------------------------------
# Hardware & GPU
# ---------------------------------------------------------
PRODUCT_NAME := aosp_ps4_tv
PRODUCT_DEVICE := ps4-atv
PRODUCT_BRAND := Sony
PRODUCT_MODEL := PlayStation 4 (Android TV)
PRODUCT_MANUFACTURER := Sony

# Graphics Libraries (Mesa3D for AMD GCN)
PRODUCT_PACKAGES += \
    libGLES_mesa \
    gralloc.gbm \
    hwcomposer.drm

# Audio (ALSA for x86)
PRODUCT_PACKAGES += \
    audio.primary.x86 \
    tinyalsa

# DualShock 4 Keylayout (Essential for TV navigation)
PRODUCT_COPY_FILES += \
    device/sony/ps4/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl
