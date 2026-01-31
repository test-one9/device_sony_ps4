# Architecture - AMD Jaguar is x86_64
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64
TARGET_CPU_VARIANT := generic

# Bootloader & Kernel (Using the 5.15 kernel from your postmarketOS screenshot)
TARGET_NO_BOOTLOADER := true
TARGET_PREBUILT_KERNEL := device/sony/ps4/kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=ps4 androidboot.selinux=permissive qemu=1 androidboot.console=tty0
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
