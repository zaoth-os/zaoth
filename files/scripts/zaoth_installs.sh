#!/usr/bin/env bash
set -oeux pipefail

git clone https://github.com/zaoth-os/zaoth-share.git
bash zaoth-share/install
rm -rf zaoth-share

git clone https://github.com/zaoth-os/zaoth-lib.git
bash zaoth-lib/install
rm -rf zaoth-lib
