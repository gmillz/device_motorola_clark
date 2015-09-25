#
# Copyright (C) 2014 The Android Open-Source Project
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

-include vendor/motorola/clark/BoardConfigVendor.mk

BOARD_VENDOR := motorola-qcom

# Platform
TARGET_BOARD_PLATFORM := msm8992
TARGET_BOARD_PLATFORM_GPU := qcom-adreno430

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8992
TARGET_NO_BOOTLOADER := true

TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true

# Architecture
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_SMP := true
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH_VARIANT := armv7-a-neon

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/motorola/clark/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 earlyprintk=msm_hsl_uart,0xf991e000 utags.blkdev=/dev/block/bootdevice/by-name/utags utags.backup=/dev/block/bootdevice/by-name/utagsBackup androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE :=  4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_SOURCE := kernel/motorola/msm8992
TARGET_KERNEL_CONFIG := clark_defconfig
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_ARCH := arm64
TARGET_USES_UNCOMPRESSED_KERNEL := true

# MkBootImg Args
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset BOARD_RAMDISK_OFFSET --tags_offset BOARD_KERNEL_TAGS_OFFSET


# Platform Base
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

+# Audio
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
TARGET_USES_QCOM_MM_AUDIO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/motorola/clark/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_HAVE_NEW_GRALLOC := true
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
HAVE_ADRENO_SOURCE:= false

OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
USE_OPENGL_RENDERER := true

# FM
TARGET_QCOM_NO_FM_FIRMWARE := true
AUDIO_FEATURE_ENABLED_FM := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true


# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040	
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 42024960	
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824	
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13725837312 

# Power
TARGET_POWERHAL_VARIANT := qcom 
BOARD_CHARGER_ENABLE_SUSPEND := true

# Motorola
TARGET_USES_MOTOROLA_LOG := true

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
# BOARD_SUPPRESS_SECURE_ERASE := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

#BOARD_SEPOLICY_DIRS += \
#   device/motorola/clark/sepolicy
#
#BOARD_SEPOLICY_UNION += \
#    

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi related defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME     := "wlan"

# TWRP definitions
DEVICE_RESOLUTION := 1440x2560
TW_BOARD_CUSTOM_GRAPHICS := ../../../$(DEVICE_PATH)/recovery/graphics.c
TW_INCLUDE_L_CRYPTO := true
TW_TARGET_USES_QCOM_BSP := true
TW_NEW_ION_HEAP := true
TW_INCLUDE_CRYPTO := true
TW_SCREEN_BLANK_ON_BOOT := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

