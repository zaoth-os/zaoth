#!/usr/bin/env bash
set -oeux pipefail

systemctl disable gdm.service || true
systemctl disable sddm.service || true
systemctl disable greetd.service || true
#systemctl enable --force lightdm
