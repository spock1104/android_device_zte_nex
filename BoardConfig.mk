# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).


# inherit from the proprietary version
-include vendor/zte/nex/BoardConfigVendor.mk
-include device/qcom/sepolicy/sepolicy.mk

BOARD_VENDOR := ZTE

ARCH_ARM_HAVE_NEON := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_INITLOGO := true
TARGET_ARCH_VARIANT := armv7-a-neon

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_CPU_VARIANT := krait

# Architecture
TARGET_CPU_SMP := true

# Flags for Krait CPU
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Krait optimizations
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := nex

# We need to enable Non-PIE executables support for now
# See http://review.cyanogenmod.org/#/c/79136/
TARGET_NEEDS_NON_PIE_SUPPORT := true

# Kernel
TARGET_KERNEL_SOURCE         := kernel/android_kernel_zte_nex
TARGET_KERNEL_CONFIG         := nex_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.selinux=permissive user_debug=31 zcache
BOARD_KERNEL_BASE := 0x80200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_SPECIFIC_HEADER_PATH := device/zte/nex/include

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1082130432
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2122317824
BOARD_CACHEIMAGE_PARTITION_SIZE := 318767104
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Assert
TARGET_OTA_ASSERT_DEVICE := nex,n800

BOARD_HAS_NO_SELECT_BUTTON := true

# chargers
BOARD_CHARGER_RES := device/zte/nex/charger/res

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_FLUENCE_FOR_VOIP := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# Camera
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DDISABLE_HW_ID_MATCH_CHECK -DNEEDS_VECTORIMPL_SYMBOLS -DQCOM_BSP_CAMERA_ABI_HACK 
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_NEEDS_MEMORYHEAPPMEM := true

# Recovery
BOARD_KERNEL_RECOVERY_CMDLINE      := $(BOARD_KERNEL_CMDLINE)
TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/nex/recovery/zImage
TARGET_RECOVERY_FSTAB := device/zte/nex/ramdisk/fstab.qcom
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_LARGE_FILESYSTEM := true

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 24
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1
BOARD_USE_USB_MASS_STORAGE_SWITCH := true

# External apps on SD
TARGET_EXTERNAL_APPS = sdcard1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/nex/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/zte/nex/bluetooth/vnd_nex.txt

# QCOM
TARGET_USES_QCOM_BSP := true
BOARD_USES_QCOM_HARDWARE := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true
TARGET_NO_ADAPTIVE_PLAYBACK := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_COMPRESSED_AUDIO_ENABLED -DQCOM_BSP -DQCOM_LEGACY_UIDS -DOLD_ION_API

# Graphics
BOARD_EGL_CFG := device/zte/nex/prebuilt/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true
TARGET_USES_ION := true
BOARD_HAVE_OLD_ION_API := true
TARGET_HAS_OLD_QCOM_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Light
TARGET_PROVIDES_LIBLIGHT := true

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# RIL
BOARD_RIL_CLASS := ../../../device/zte/nex/ril

# Wifi
BOARD_HAS_QCOM_WLAN_SDK 	:= true
BOARD_HAS_QCOM_WLAN 		:= true
TARGET_USES_WCNSS_CTRL          := true
BOARD_WLAN_DEVICE 		:= qcwcn
BOARD_HOSTAPD_DRIVER 		:= NL80211
BOARD_HOSTAPD_PRIVATE_LIB 	:= lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER 	:= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
HOSTAPD_VERSION 		:= VER_0_8_X
WIFI_DRIVER_FW_PATH_AP 		:= "ap"
WIFI_DRIVER_FW_PATH_P2P 	:= "p2p"
WIFI_DRIVER_FW_PATH_STA 	:= "sta"
WIFI_DRIVER_MODULE_ARG 		:= ""
WIFI_DRIVER_MODULE_NAME 	:= "wlan"
WIFI_DRIVER_MODULE_PATH 	:= "/system/lib/modules/wlan.ko"
WPA_SUPPLICANT_VERSION 		:= VER_0_8_X

BOARD_USES_SECURE_SERVICES := true
BOARD_USES_EXTRA_THERMAL_SENSOR := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

BOARD_USES_LEGACY_MMAP := true

# Logging
TARGET_USES_LOGD := false

#BOARD_SEPOLICY_DIRS += \
#    device/zte/nex/sepolicy

#BOARD_SEPOLICY_UNION += \
#    ueventd.te

#TWRP
#RECOVERY_VARIANT := twrp
TW_TARGET_USES_QCOM_BSP := true
DEVICE_RESOLUTION := 480x800
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_CUSTOM_POWER_BUTTON := 107
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := false
TW_FLASH_FROM_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_INPUT_BLACKLIST := lis3dh_acc
