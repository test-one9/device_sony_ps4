# device/sony/ps4/mkbootimg.mk

LOCAL_PATH := $(call my-dir)

# Define the output names
INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img

# The PS4 usually boots via a bzImage and an initrd.img
# We combine them here so the build system outputs a flashable/loadable file.
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) \
		--kernel $(PRODUCT_OUT)/kernel \
		--ramdisk $(PRODUCT_OUT)/ramdisk.img \
		--cmdline "$(BOARD_KERNEL_CMDLINE)" \
		--base $(BOARD_KERNEL_BASE) \
		--pagesize $(BOARD_KERNEL_PAGESIZE) \
		--output $@
	@echo "--- Made PS4 Boot Image: $@ ---"

# Create a specialized PS4-kexec package (bzImage + initrd)
.PHONY: ps4_kexec_package
ps4_kexec_package: $(INSTALLED_BOOTIMAGE_TARGET)
	@mkdir -p $(PRODUCT_OUT)/ps4_boot
	cp $(PRODUCT_OUT)/kernel $(PRODUCT_OUT)/ps4_boot/bzImage
	cp $(PRODUCT_OUT)/ramdisk.img $(PRODUCT_OUT)/ps4_boot/initrd.img
	@echo "--- PS4 Kexec files ready in $(PRODUCT_OUT)/ps4_boot ---"
