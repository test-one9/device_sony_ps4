TARGET_BOARD_PLATFORM := ps4
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64
TARGET_CPU_VARIANT := generic

# Kernel-Schnittstelle (PS4 benötigt bzImage und DTB)
BOARD_KERNEL_CMDLINE := amd_iommu=off radeon.modeset=1 console=tty0
BOARD_KERNEL_IMAGE_NAME := bzImage

# Dateisysteme
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_USE_EXT4 := true
