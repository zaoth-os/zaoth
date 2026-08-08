<p align="center">
  <a href="https://github.com/wayblueorg/wayblue">
    <img src="https://github.com/fyllus/sharefile/blob/main/share/plymouth/themes/spinner/watermark.png" href="[https://github.com/zaoth-os/zaoth](https://github.com/zaoth-os/zaoth)" />
  </a>
</p>

---

[![bluebuild](https://github.com/zaoth-os/zaoth/actions/workflows/build.yml/badge.svg)](https://github.com/zaoth-os/zaoth/actions/workflows/build.yml)[![Dependabot Updates](https://github.com/zaoth-os/zaoth/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/zaoth-os/zaoth/actions/workflows/dependabot/dependabot-updates)

A minimalist, performance-oriented custom Fedora Atomic image built on top of the uBlue (`base-main`) ecosystem.

This image is an independent, personal project designed to be lightweight, pragmatic, and highly optimized. It eliminates standard desktop bloat, focusing exclusively on a keyboard-driven workflow using the Sway window manager, native Wayland utilities, and modular shell-based orchestration tools.

---

## Key Features

* **Minimalist TWM Stack:** Pre-configured Sway environment leveraging resource-efficient tools like `i3blocks` and `wmenu`, alongside custom scripts located in `/usr/bin`.

* **Modular Configuration Architecture:** Completely decoupled keybindings, system calls, and theme variables to prevent system breakage and allow safe, painless user overrides.

* **Integrated CLI Orchestration:** Built-in shell-based tools featuring custom fuzzy finders (`bluemenu`, `bluewall`) for application execution, scratchpads, interactive wallpaper selection, and power management.

* **Atomic Reliability:** Built via BlueBuild, ensuring immutable root-filesystem rollbacks, seamless updates, and container-native delivery.

---

## Installation

To rebase an existing Fedora Atomic (e.g., Silverblue, Kinoite, Sway Spin) installation to the latest Bluehat build, execute the two-step verification process below:

### 1. Initial Unverified Rebase

Rebase to the unverified registry to import the required signing keys and local security policies:


```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/zaoth-os/zaoth:latest
systemctl reboot

```

### 2. Verified Signed Rebase

After rebooting, lock the system deployment down by rebasing to the cryptographically signed image stream:

```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/zaoth-os/zaoth:latest
systemctl reboot

```

 **Note:** The `latest` tag always tracks the stable core version specified within the system build recipe. Major upstream Fedora version upgrades will never occur automatically without user intervention.
