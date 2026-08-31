$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_NAME := ps4
PRODUCT_DEVICE := ps4
PRODUCT_BRAND := Sony
PRODUCT_MODEL := PlayStation 4

# DualShock 4 Keylayout (Essential for TV navigation)
PRODUCT_COPY_FILES += \
    device/sony/ps4/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl
