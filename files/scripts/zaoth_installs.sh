#!/usr/bin/env bash
set -oeux pipefail

git clone https://github.com/zaoth-os/zaoth-share.git
cd zaoth-share
./install
cd ..
rm -rf zaoth-share

git clone https://github.com/zaoth-os/zaoth-lib.git
cd zaoth-lib
./install
cd ..
rm -rf zaoth-lib
