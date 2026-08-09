#!/usr/bin/env bash
set -oeux pipefail

git clone https://github.com/zaoth-os/zaoth-share.git
cp -r zaoth-share/src/ /

git clone https://github.com/zaoth-os/zaoth-lib.git
cp -r zaoth-lib/src/ /
