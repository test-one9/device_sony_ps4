#
# Copyright (C) 2026 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

# Target paths for boot components
PS4_BOOT_DIR := $(LOCAL_PATH)/boot
PS4_DISTRO_ARCHIVE := $(PS4_BOOT_DIR)/psxitarch.tar.gz

# Include the custom distribution archive into the recovery/boot build process
INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(PS4_DISTRO_ARCHIVE)
	@echo "--- Making PS4 kexec boot image with psxitarch distro ---"
	$(hide) mkdir -p $(PRODUCT_OUT)/tmp_boot
	$(hide) cp $(PRODUCT_OUT)/kernel $(PRODUCT_OUT)/tmp_boot/bzImage
	$(hide) cp $(PRODUCT_OUT)/ramdisk.img $(PRODUCT_OUT)/tmp_boot/initrd.img
	$(hide) cp $(PS4_DISTRO_ARCHIVE) $(PRODUCT_OUT)/tmp_boot/psxitarch.tar.gz
	# Combine targets using specialized packaging scripts or mkbootimg arguments
	$(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo "--- Made PS4 boot image: $@ ---"

.PHONY: ps4-bootimage
ps4-bootimage: $(INSTALLED_BOOTIMAGE_TARGET)
