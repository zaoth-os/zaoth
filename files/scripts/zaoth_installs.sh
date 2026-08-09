#!/usr/bin/env bash
set -oeux pipefail

git clone https://github.com/zaoth-os/zaoth-share.git
source zaoth-share/setup
install-src

git clone https://github.com/zaoth-os/zaoth-lib.git
source zaoth-lib/setup
install-src
