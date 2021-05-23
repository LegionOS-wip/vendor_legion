#!/bin/bash

LEGION_VERSION=`get_build_var LEGION_VERSION`
FILE_NAME="$LEGION_VERSION.zip"
echo "Signing Files"
if sign_target_files_apks -o --default_key_mappings .android-certs $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip $OUT/signed-target_files.zip; then
	echo "Generating OTA from target files"
	if ota_from_target_files -k .android-certs/releasekey $OUT/signed-target_files.zip $OUT/$FILE_NAME; then
		echo "Package completed successfully"
		echo "Zip: $OUT/$FILE_NAME"
	fi
fi
