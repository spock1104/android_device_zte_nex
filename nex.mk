$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/zte/nex/nex-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/nex/overlay

# This device is hdpi.
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# adb + root
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.allow.mock.location=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.usb.config=mass_storage

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    persist.radio.add_power_save=1 \
    persist.radio.dont_use_dsd=true \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.ril.transmitpower=true \
    ro.warmboot.capability=1 \
    ro.qualcomm.cabl=0 \
    ro.opengles.version=196608 \
    af.resampler.quality=4 \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=digital \
    ro.use_data_netmgrd=true \
    lpa.decode=true \
    lpa.use-stagefright=true \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    persist.rild.nitz_plmn="" \
    persist.rild.nitz_long_ons_0="" \
    persist.rild.nitz_long_ons_1="" \
    persist.rild.nitz_long_ons_2="" \
    persist.rild.nitz_long_ons_3="" \
    persist.rild.nitz_short_ons_0="" \
    persist.rild.nitz_short_ons_1="" \
    persist.rild.nitz_short_ons_2="" \
    persist.rild.nitz_short_ons_3="" \
    ril.subscription.types=NV,RUIM \
    persist.gps.qmienabled=true \
    persist.gps.qc_nlp_in_use=0 \
    persist.fuse_sdcard=true \
    ro.vold.umsdirtyratio=50 \
    ro.cwm.enable_key_repeat=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    mm.enable.smoothstreaming=true \
    persist.timed.enable=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0 \
    ro.telephony.ril_class=QualcommSharedRIL \
    ro.telephony.call_ring.multiple=0

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

LOCAL_PATH := device/zte/nex

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zte/nex/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Camera
PRODUCT_PACKAGES := \
	libgenlock \
	libmmcamera_interface \
#	camera-wrapper.msm8960

# Light
PRODUCT_PACKAGES += \
    lights.msm8960

# Increase the HWUI font cache since we have tons of RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    memtrack.msm8960 \
    power.msm8960 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils

# Audio
PRODUCT_PACKAGES += \
	alsa.msm8960 \
	audio.a2dp.default \
        audio_policy.msm8960 \
	audio.primary.msm8960 \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler

# Power
PRODUCT_PACKAGES += \
	power.msm8960

PRODUCT_PACKAGES += \
	Torch \
	FloatSysPop \
	DeviceSettings

# Charger
PRODUCT_PACKAGES += charger

# STK
PRODUCT_PACKAGES += Stk

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	librs_jni

PRODUCT_PACKAGES += \
	libdivxdrmdecrypt \
	libstagefrighthw \
        libmm-omxcore \
        libOmxCore \
        libc2dcolorconvert \
        libOmxVdecHevc \
        libstagefrighthw \
        libOmxVdec \
        libOmxVenc \
        libOmxAacEnc \
        libOmxAmrEnc \
        libOmxEvrcEnc \
        libOmxQcelp13Enc \
        libdashplayer \
        qcmediaplayer

# ramdisk
PRODUCT_COPY_FILES += \
    device/zte/nex/ramdisk/fstab.qcom:root/fstab.qcom \
    device/zte/nex/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    device/zte/nex/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    device/zte/nex/ramdisk/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    device/zte/nex/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/zte/nex/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/zte/nex/ramdisk/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    device/zte/nex/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/zte/nex/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/zte/nex/ramdisk/init.target.rc:root/init.target.rc \
    device/zte/nex/ramdisk/logo.bmp:root/logo.bmp \
    device/zte/nex/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/zte/nex/ramdisk/res/images/charger/battery_0.png:root/res/images/charger/battery_0.png \
    device/zte/nex/ramdisk/res/images/charger/battery_1.png:root/res/images/charger/battery_1.png \
    device/zte/nex/ramdisk/res/images/charger/battery_2.png:root/res/images/charger/battery_2.png \
    device/zte/nex/ramdisk/res/images/charger/battery_3.png:root/res/images/charger/battery_3.png \
    device/zte/nex/ramdisk/res/images/charger/battery_4.png:root/res/images/charger/battery_4.png \
    device/zte/nex/ramdisk/res/images/charger/battery_5.png:root/res/images/charger/battery_5.png \
    device/zte/nex/ramdisk/res/images/charger/battery_charge.png:root/res/images/charger/battery_charge.png \
    device/zte/nex/ramdisk/res/images/charger/battery_fail.png:root/res/images/charger/battery_fail.png

#TWRP
PRODUCT_COPY_FILES += \
    device/zte/nex/recovery/recovery.fstab:recovery/root/etc/twrp.fstab \

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/nex/prebuilt/system,system)

# APN
PRODUCT_COPY_FILES += \
	device/zte/nex/prebuilt/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:/system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:/system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:/system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:/system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:/system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:/system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:/system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:/system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:/system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:/system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:/system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:/system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:/system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:/system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:/system/etc/permissions/android.hardware.compass.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:/system/etc/permissions/android.hardware.telephony.cdma.xml \


# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, build/target/product/full.mk)

$(call inherit-product-if-exists, vendor/zte/nex/nex-vendor.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8
PRODUCT_NAME := full_nex
PRODUCT_DEVICE := nex
PRODUCT_MANUFACTURER := ZTE
PRODUCT_MODEL := ZTE Nex
