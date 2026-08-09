#!/usr/bin/env bash
set -oeux pipefail

git clone https://github.com/zaoth-os/zaoth-share.git
./zaoth-share/install
rm -rf zaoth-share

git clone https://github.com/zaoth-os/zaoth-lib.git
./zaoth-lib/install
rm -rf zaoth-lib
