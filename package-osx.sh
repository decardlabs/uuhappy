#!/bin/bash

Arch="$1"
OutputPath="$2"
Version="$3"

FileName="uuhappy-${Arch}.zip"
wget -nv -O $FileName "https://github.com/decardlabs/uuhappy-core-bin/raw/refs/heads/master/$FileName"
7z x $FileName
cp -rf uuhappy-${Arch}/* $OutputPath

PackagePath="uuhappy-Package-${Arch}"
mkdir -p "$PackagePath/uuhappy.app/Contents/Resources"
cp -rf "$OutputPath" "$PackagePath/uuhappy.app/Contents/MacOS"
cp -f "$PackagePath/uuhappy.app/Contents/MacOS/uuhappy.icns" "$PackagePath/uuhappy.app/Contents/Resources/AppIcon.icns"
echo "When this file exists, app will not store configs under this folder" > "$PackagePath/uuhappy.app/Contents/MacOS/NotStoreConfigHere.txt"
chmod +x "$PackagePath/uuhappy.app/Contents/MacOS/uuhappy"

cat >"$PackagePath/uuhappy.app/Contents/Info.plist" <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleDevelopmentRegion</key>
  <string>English</string>
  <key>CFBundleDisplayName</key>
  <string>uuhappy</string>
  <key>CFBundleExecutable</key>
  <string>uuhappy</string>
  <key>CFBundleIconFile</key>
  <string>AppIcon</string>
  <key>CFBundleIconName</key>
  <string>AppIcon</string>
  <key>CFBundleIdentifier</key>
  <string>com.decardlabs.uuhappy</string>
  <key>CFBundleName</key>
  <string>uuhappy</string>
  <key>CFBundlePackageType</key>
  <string>APPL</string>
  <key>CFBundleShortVersionString</key>
  <string>${Version}</string>
  <key>CSResourcesFileMapped</key>
  <true/>
  <key>NSHighResolutionCapable</key>
  <true/>
  <key>LSMinimumSystemVersion</key>
  <string>12.7</string>
</dict>
</plist>
EOF

create-dmg \
    --volname "uuhappy Installer" \
    --window-size 700 420 \
    --icon-size 100 \
    --icon "uuhappy.app" 160 185 \
    --hide-extension "uuhappy.app" \
    --app-drop-link 500 185 \
    "uuhappy-${Arch}.dmg" \
    "$PackagePath/uuhappy.app"
