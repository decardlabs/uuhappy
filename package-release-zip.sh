#!/bin/bash

Arch="$1"
OutputPath="$2"

OutputArch="uuhappy-${Arch}"
FileName="uuhappy-${Arch}.zip"

wget -nv -O $FileName "https://github.com/decardlabs/uuhappy-core-bin/raw/refs/heads/master/$FileName"

ZipPath64="./$OutputArch"
mkdir $ZipPath64

cp -rf $OutputPath "$ZipPath64/$OutputArch"
7z a -tZip $FileName "$ZipPath64/$OutputArch" -mx1