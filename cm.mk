## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/nex/nex.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
TARGET_BOOTANIMATION_NAME := 480

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nex
PRODUCT_NAME := cm_nex
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := N800
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := ZTE Awe
