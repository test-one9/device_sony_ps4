# Architecture - AMD Jaguar is x86_64
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64
TARGET_CPU_VARIANT := generic

# kernel
TARGET_KERNEL_ARCH := x86_64
BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_SOURCE := kernel/sony/ps4
TARGET_NO_BOOTLOADER := true
BOARD_KERNEL_CMDLINE := androidboot.hardware=ps4 androidboot.selinux=permissive qemu=1 androidboot.console=tty0
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
# Note: "qemu=1" is often used in x86 builds to trigger software rendering fallbacks if GPU init fails, 
# but we aim for hardware acceleration below.
# Graphics - AMD Custom GCN requires Mesa3D with RadeonSI
BOARD_GPU_DRIVERS := radeonsi
BOARD_USE_VULKAN := true
USE_OPENGL_RENDERER := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 512
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472

# Android TV Specifics
TARGET_USES_64_BIT_BINDER := true
# System properties
TARGET_SYSTEM_PROP += device/sony/ps4/system.prop
