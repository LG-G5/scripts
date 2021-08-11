#!/bin/bash

rm -rf vendor/lge/
rm -rf frameworks/base/
rm -rf kernel/lge/msm8996/
rm -rf device/lge/msm8996-common/
rm -rf device/lge/g5-common/
rm -rf device/lge/h830/
rm -rf device/lge/h850/
rm -rf device/lge/rs988/

repo sync --force-sync -j32
source build/envsetup.sh
# repopick -t android-11.0.0_r39

cd frameworks/base/
git fetch https://github.com/LG-G6/android_frameworks_base.git lineage-18.1
# MICROG, CHARGING ANIMATION
git cherry-pick 826b9344ccb9d533f763360203f54f42d542aa01 57738d2b938c4beb456a596ebecf5f8db1f0521e
cd ../../

rm -rf packages/apps/Updater/

# notify-send Android "Source code updated" -i /usr/share/icons/Moka/96x96/apps/android-studio.png
