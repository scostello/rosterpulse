#!/bin/bash
set -eu

# If the TULSI_APP environment variable is set, use it.
if [[ "${TULSI_APP:-}" != "" ]]; then
  readonly app_bundle_path="${TULSI_APP}"
else
  readonly tulsi_bundle_id=com.google.Tulsi
  app_bundle_path=$(mdfind kMDItemCFBundleIdentifier=${tulsi_bundle_id} | head -1)
fi

if [[ "${app_bundle_path}" == "" ]]; then
  if [[ -f "/Applications/Tulsi.app/Contents/MacOS/Tulsi" ]]; then
    readonly app_bundle_path="/Applications/Tulsi.app"
  else
    echo "Tulsi.app could not be located. Please ensure that you have built\
 Tulsi and that it exists in an accessible location."

    exit 1
  fi
fi

readonly tulsi_path="${app_bundle_path}/Contents/MacOS/Tulsi"

readonly config=${1:-Rosterpulse}

echo "Using Tulsi at ${app_bundle_path}"
exec "${tulsi_path}" -- --bazel $(which bazel) \
    --genconfig "$(pwd)/clients/rosterpulse-ios/Rosterpulse.tulsiproj:${config}"
