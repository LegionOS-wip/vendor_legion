#!/usr/bin/env bash
# Authored By : @https://t.me/Immanuel_Raj

DEVICE=$1
DECISION=$2
TYPE=$3
KBU=$4
. build/envsetup.sh

if [ $# -lt 3 ]; then
    echo "Missing mandatory parameters it must be like this :- bash build.sh jasmine_sprout true/false userdebug/eng/user Immanuel"
    exit 1
fi

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export KBUILD_BUILD_USER=$KBU
export KBUILD_BUILD_HOST=legion-os
export WITH_GAPPS=$DECISION
lunch legion_$DEVICE-$TYPE
make installclean
make legion -j$(nproc --all)
