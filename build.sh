#!/bin/bash

version=$(curl -s https://api.github.com/repos/stedolan/jq/releases/latest | jq -r .tag_name)

curl -L https://github.com/stedolan/jq/releases/download/$version/jq-linux64 -o jq_linux_amd64
curl -L https://github.com/stedolan/jq/releases/download/$version/jq-linux32 -o jq_linux_386
curl -L https://github.com/stedolan/jq/releases/download/$version/jq-osx-amd64 -o jq_darwin_amd64
curl -L https://github.com/stedolan/jq/releases/download/$version/jq-win64 -o jq_windows_amd64
curl -L https://github.com/stedolan/jq/releases/download/$version/jq-win32 -o jq_windows_386

mkdir _
mv jq_* _
nami release github.com/namipkg/jq $version _
rm -rf _
