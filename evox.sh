#!/bin/bash

rm -rf .repo/local_manifests/
rm -rf device/xiaomi/mojito
rm -rf device/xiaomi/sm6150-common
rm -rf kernel/xiaomi/mojito
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi/mojito
rm -rf vendor/xiaomi/sm6150-common

# Rom source repo
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs

# Clone repository
git clone https://github.com/BKA-16/device_xiaomi_mojito.git -b 16 device/xiaomi/mojito

git clone https://github.com/BKA-16/device_xiaomi_sm6150-common.git -b 16 device/xiaomi/sm6150-common

git clone https://github.com/BKA-16/kernel_xiaomi_mojito.git -b testing kernel/xiaomi/mojito

git clone https://github.com/BKA-16/android_hardware_xiaomi.git -b mojito hardware/xiaomi

git clone https://gitlab.com/romgharti/android_vendor_xiaomi_mojito.git -b 15 vendor/xiaomi/mojito

git clone https://gitlab.com/romgharti/android_vendor_xiaomi_sm6150-common.git -b 15 vendor/xiaomi/sm6150-common

# Sync the repositories
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Set up build environment
source build/envsetup.sh

# Lunch
lunch lineage_mojito-bp1a-userdebug

# Build rom
m evolution