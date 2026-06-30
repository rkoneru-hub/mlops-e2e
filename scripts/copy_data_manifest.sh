#!/bin/bash

set -e

# Copy the Data Manifest file to the main folder

# echo "Data Manifest:"
# cat ${CODEBUILD_SRC_DIR_SourceDataOutput}/manifest.json

# echo "Copying Data Manifest to main folder"
# cat ${CODEBUILD_SRC_DIR_SourceDataOutput}/manifest.json > ./dataManifest.json

echo "===== Files in SourceDataOutput ====="
find ${CODEBUILD_SRC_DIR_SourceDataOutput} -type f

echo "===== Directory Structure ====="
ls -R ${CODEBUILD_SRC_DIR_SourceDataOutput}

echo "===== Data Manifest ====="
cat ${CODEBUILD_SRC_DIR_SourceDataOutput}/manifest.json

echo "Copying Data Manifest"
cp ${CODEBUILD_SRC_DIR_SourceDataOutput}/manifest.json ./dataManifest.json