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

# PS4 uses a custom Linux/kexec based boot sequence rather than standard Android fastboot.
# This mkbootimg.mk overrides the default target to package the bzImage (kernel) 
# and ramdisk into a format suitable for the PS4 Linux loaders (e.g., Orbis/Payloads).

INTERNAL_BOOTIMAGE_ARGS := 	--kernel $(PRODUCT_OUT)/kernel 	--ramdisk $(PRODUCT_OUT)/ramdisk.img 	--cmdline "$(BOARD_KERNEL_CMDLINE)" 	--base $(BOARD_KERNEL_BASE) 	--pagesize $(BOARD_KERNEL_PAGESIZE)

ifeq ($(BOARD_USES_RECOVERY_AS_BOOT),true)
INTERNAL_BOOTIMAGE_ARGS += --recovery_as_boot
endif

ifdef BOARD_INCLUDE_DTB
INTERNAL_BOOTIMAGE_ARGS += --dtb $(PRODUCT_OUT)/dtb.img
endif

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(INTERNAL_MKBOOTIMG_VERSION_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo "==== PS4 Boot Image Built: $@ ===="
	@echo "For PS4 kexec injection, utilize bzImage and ramdisk.img directly or pack via payload."
