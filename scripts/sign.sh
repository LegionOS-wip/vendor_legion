#!/bin/bash

LEGION_VERSION=`get_build_var LEGION_VERSION`
echo "Signing Files"
sign_target_files_apks -o --default_key_mappings .android-certs $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip $OUT/signed-target_files.zip
echo "Generating OTA from target files"
ota_from_target_files -k  .android-certs/releasekey $OUT/signed-target_files.zip $OUT/"$LEGION_VERSION.zip"
