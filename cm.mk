## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/nex/nex.mk)

# Correct boot animation size for the screen.
TARGET_BOOTANIMATION_NAME := 480

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nex
PRODUCT_NAME := cm_nex
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := ZTE Nex
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := ZTE Nex
