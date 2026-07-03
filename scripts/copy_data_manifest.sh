#!/bin/bash

set -e

echo "===== SourceDataOutput ====="

echo "CODEBUILD_SRC_DIR_SourceDataOutput=${CODEBUILD_SRC_DIR_SourceDataOutput}"

if [ -z "${CODEBUILD_SRC_DIR_SourceDataOutput}" ]; then
    echo "ERROR: CODEBUILD_SRC_DIR_SourceDataOutput is not set."
    exit 1
fi

echo
echo "Listing SourceDataOutput directory..."
ls -R "${CODEBUILD_SRC_DIR_SourceDataOutput}"

echo
echo "Searching for manifest.json..."
MANIFEST_FILE=$(find "${CODEBUILD_SRC_DIR_SourceDataOutput}" -name "manifest.json" | head -n 1)

if [ -z "${MANIFEST_FILE}" ]; then
    echo "ERROR: manifest.json not found under ${CODEBUILD_SRC_DIR_SourceDataOutput}"
    exit 1
fi

echo
echo "Manifest found at:"
echo "${MANIFEST_FILE}"

echo
echo "Copying manifest to repository root..."
cp "${MANIFEST_FILE}" ./dataManifest.json

echo
echo "===== Copied dataManifest.json ====="
ls -l ./dataManifest.json

echo
echo "Contents:"
cat ./dataManifest.json

echo
echo "Data manifest copied successfully."