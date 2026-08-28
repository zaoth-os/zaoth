<p align="center">
  <a href="https://github.com/zaoth-os/zaoth">
    <img src="https://github.com/zaoth-os/zaoth-share/blob/main/////src/share/plymouth/themes/spinner/watermark.png" href="[https://github.com/zaoth-os/zaoth](https://github.com/zaoth-os/zaoth)" />
  </a>
</p>

---

[![bluebuild](https://github.com/zaoth-os/zaoth/actions/workflows/build.yml/badge.svg)](https://github.com/zaoth-os/zaoth/actions/workflows/build.yml)[![Dependabot Updates](https://github.com/zaoth-os/zaoth/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/zaoth-os/zaoth/actions/workflows/dependabot/dependabot-updates)

A minimalist, performance-oriented custom Fedora Atomic image built on top of the uBlue (`base-main`) ecosystem.

This image is an independent, personal project designed to be lightweight, pragmatic, and highly optimized. It eliminates standard desktop bloat, focusing exclusively on a keyboard-driven workflow using the Sway window manager, native Wayland utilities, and modular shell-based orchestration tools.

---

## Important!

To keep the Zaoth ecosystem up to date and reduce its dependence on multiple external repositories, the project maintains RPM packages through independent Fedora COPR projects.

These packages are primarily used in the official build of **Zaoth-OS**, a system based on Fedora Atomic. The goal is to centralize part of the external dependencies used by the system and allow them to be integrated and tested consistently within the Zaoth ecosystem.

Packages provided through Zaoth COPRs may receive specific adjustments to work together with Zaoth-OS. Therefore, some of them may not work perfectly outside the Zaoth ecosystem or may have configurations that differ from those used by the upstream projects.

It is important to note that Zaoth does not necessarily maintain the development of the packaged software. In most cases, the project is only responsible for creating and maintaining the RPM packaging configurations required to build the packages on Fedora.

Currently, one of the available packages is `noctalia-greeter`, which is used as the greeter by Zaoth-OS. The package can be found in the following COPR:

`fyllus/zaoth`

The package is available under the name:

`noctalia-greeter`

During the packaging process, the compilation of `noctalia-greeter` received specific adjustments to allow it to build in the environment used by Zaoth. One of these adjustments is building without PIE (*Position Independent Executable*). This configuration may raise security concerns for some users and should be considered before using the package in environments where this mitigation is required.

The configurations used to build the RPM packages are maintained in the following directory:

```text
copr_specs/
```

Each package has its own directory containing the files required for its packaging, such as `.spec` files, additional configurations, and documentation when necessary.

For more detailed information about the organization and operation of the packaging system, see:

```text
copr_specs/COPRS.md
```

It is also recommended to consult the documentation available inside each package directory, as some projects may have specific requirements, dependencies, limitations, or adjustments.

The general structure follows this model:

```text
Zaoth
│
├── Zaoth-OS
│    └── Fedora Atomic-based system
│
├── COPR
│    └── RPM packages used by the ecosystem
│
└── copr_specs/
     │
     ├── README.md
     │
     ├── noctalia_greeter/
     │    ├── main.spec
     │    └── README.md
     │
     └── other_packages/
          ├── main.spec
          └── README.md
```

The goal of this structure is to keep the packaging process organized, documented, and centralized within the Zaoth project, allowing new packages to be added and maintained without the need to create a separate repository for each piece of software.

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
