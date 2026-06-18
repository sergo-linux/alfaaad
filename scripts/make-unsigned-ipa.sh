#!/usr/bin/env bash
set -euo pipefail

rm -rf build/Payload build/AlfaScan-unsigned.ipa

APP_PATH=$(find "$HOME/Library/Developer/Xcode/DerivedData" \
  -path "*/Build/Products/Release-iphoneos/AlfaScan.app" \
  -type d | head -n 1 || true)

if [ -z "$APP_PATH" ]; then
  echo "AlfaScan.app not found. Run: yarn build:app"
  exit 1
fi

mkdir -p build/Payload
cp -R "$APP_PATH" build/Payload/

(cd build && zip -qry AlfaScan-unsigned.ipa Payload)

echo "Created: build/AlfaScan-unsigned.ipa"
echo "This IPA is unsigned. Sign it with KSign / SideStore / AltStore / your certificate before installing on iPhone."
