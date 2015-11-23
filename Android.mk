#
# Copyright 2014 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

ifneq ($(filter clark, $(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(call all-makefiles-under,$(LOCAL_PATH))

# FSG symlinks
FSG_IMAGES :=  \
    0.img.gz 1.img.gz 2.img.gz 3.img.gz \
    att.mbn sprint.mbn super.mbn tmo.mbn usc.mbn vzw.mbn \
    clark_1.img.gz clark_2.img.gz clark_3.img.gz clark_att_2.img.gz \
    clark_emea_1.img.gz clark_latam_1.img.gz clark_sprint_2.img.gz \
    clark_super_1.img.gz clark_super_2.img.gz clark_super_3.img.gz \
    clark_tmo_2.img.gz clark_verizon_2.img.gz kinzie_emea_2.img.gz \
    kinzie_super_2.img.gz kinzie_super_3.img.gz kinzie_verizon_1.img.gz \
    bundle_release

FSG_SYMLINKS := $(addprefix $(TARGET_OUT)/rfs/msm/mpss/readonly/fsg/,$(notdir $(FSG_IMAGES)))
$(FSG_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "FSG firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /fsg/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FSG_SYMLINKS)

endif
