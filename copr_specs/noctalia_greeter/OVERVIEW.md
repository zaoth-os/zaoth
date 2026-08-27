# Noctalia Greeter — Fedora Packaging

[![Copr build status](https://copr.fedorainfracloud.org/coprs/fyllus/zaoth/package/noctalia-greeter/status_image/last_build.png)](https://copr.fedorainfracloud.org/coprs/fyllus/zaoth/package/noctalia-greeter/)

Fedora RPM packaging for **Noctalia Greeter**, a minimal login greeter for [`greetd`](https://github.com/kennylevinsen/greetd) designed to match the visual language of **Noctalia Shell**.

This repository contains the RPM packaging files required to build and distribute Noctalia Greeter through Fedora COPR.

The actual Noctalia Greeter source code is maintained upstream:

* **Project:** https://github.com/noctalia-dev/noctalia-greeter
* **Documentation:** https://docs.noctalia.dev/v5/greeter/
* **License:** MIT

## About Noctalia Greeter

Noctalia Greeter is a Wayland login greeter built specifically for `greetd`.

It provides:

* User selection
* Password authentication
* Wayland session selection
* Color scheme selection
* Multi-monitor support
* Keyboard navigation
* Cursor configuration
* Optional appearance synchronization with Noctalia Shell
* A bundled wlroots-based compositor

The greeter is started by `greetd` through:

```text
/usr/bin/noctalia-greeter-session
```

The greeter itself is not a desktop environment or a general-purpose compositor. It is specifically intended to provide the login interface before a desktop session starts.

## Repository Purpose

This repository is intentionally minimal.

It does **not** contain a fork of the Noctalia Greeter source tree. Instead, the RPM spec downloads the corresponding upstream release tarball during the package build.

The repository currently contains:

```text
.
└── noctalia-greeter.spec
```

The build flow is:

```text
GitHub
  │
  │ upstream release
  ▼
Noctalia Greeter tarball
  │
  │ Source0
  ▼
RPM build
  │
  ├── Meson
  ├── Ninja
  ├── Tests
  └── Installation
  │
  ▼
Fedora RPM
  │
  ▼
COPR
```

This keeps the packaging repository independent from the upstream source code while allowing new upstream releases to be packaged by updating the package version.

## Building

The package uses Fedora's standard RPM/Meson build macros.

The build does **not** use the upstream `Justfile`. The upstream project provides Meson as its actual build system, while `just` is primarily a convenience interface for development.

The package therefore builds using:

```spec
%build
%meson
%meson_build
```

and installs using:

```spec
%install
%meson_install
```

### Local build

Install the Fedora packaging tools and required dependencies, then run:

```bash
rpmbuild -ba noctalia-greeter.spec
```

For COPR builds, the required build dependencies are resolved automatically from the RPM spec.

## Dependencies

Noctalia Greeter currently requires `wlroots` 0.20 and several Wayland, graphics, text-rendering and utility libraries.

Important build dependencies include:

* Meson
* Ninja
* GCC/G++
* Wayland
* Wayland protocols
* wlroots 0.20
* EGL
* GLES
* FreeType
* Fontconfig
* Cairo
* Pango
* HarfBuzz
* libxkbcommon
* GLib
* librsvg
* libwebp
* libinput
* tomlplusplus
* nlohmann-json
* stb_image_resize2

Wuffs is not listed as an external dependency because it is vendored by the upstream project.

The Fedora package uses `pkgconfig(...)` dependencies where possible so RPM can resolve the appropriate Fedora development package.

## Fedora Compatibility

The package targets Fedora releases providing **wlroots 0.20**.

The upstream project explicitly requires:

```text
wlroots-0.20
wayland-server
```

Therefore, older Fedora releases that only provide an older wlroots ABI are not expected to build this package without an additional wlroots 0.20 package.

The primary target is therefore current Fedora releases with wlroots 0.20 available.

## Installation

Once the package is available through COPR, it can be installed with:

```bash
sudo dnf install noctalia-greeter
```

The package installs the main binaries under `/usr/bin`:

```text
/usr/bin/noctalia-greeter
/usr/bin/noctalia-greeter-compositor
/usr/bin/noctalia-greeter-session
/usr/bin/noctalia-greeter-apply-appearance
/usr/bin/noctalia-greeter-print-greetd-config
```

It also installs the required Noctalia Greeter assets and system integration files.

## greetd Configuration

Installing the RPM does not automatically replace the existing `greetd` configuration.

After installing the package, configure `greetd` to start the Noctalia Greeter session wrapper.

For example:

```toml
[default_session]
command = "/usr/bin/noctalia-greeter-session"
user = "greeter"
```

The `user` value should match the user configured for `greetd` on the system.

You can verify the installed session wrapper with:

```bash
command -v noctalia-greeter-session
```

It should normally return:

```text
/usr/bin/noctalia-greeter-session
```

### Optional default session

A default Wayland session can be specified through the greeter command:

```toml
[default_session]
command = "/usr/bin/noctalia-greeter-session -- --session niri"
user = "greeter"
```

Available sessions can be listed with:

```bash
noctalia-greeter sessions
```

## System Setup

The RPM intentionally does not automatically execute the upstream:

```text
scripts/setup_greeter_system.sh
```

during package installation.

That script performs system-level setup involving the greeter state directory and greetd integration. Automatically modifying a user's greetd configuration or authentication setup from an RPM transaction would be undesirable.

The script is installed as part of the package and can be run manually when appropriate.

This separation keeps package installation predictable and allows the system administrator to decide how `greetd` should be configured.

## State Directory

The package includes the upstream `tmpfiles.d` configuration:

```text
/usr/lib/tmpfiles.d/noctalia-greeter.conf
```

This is used to create the Noctalia Greeter state directory:

```text
/var/lib/noctalia-greeter/
```

The upstream configuration assumes the standard `greeter` account used by `greetd`.

Systems using a different greetd user may require manual adjustment.

## Updating the Package

The package version follows the upstream Noctalia Greeter release.

For example:

```spec
Version: 1.2.1
```

produces the source URL:

```text
https://github.com/noctalia-dev/noctalia-greeter/archive/refs/tags/v1.2.1/noctalia-greeter-1.2.1.tar.gz
```

To package a new upstream release:

1. Change `Version` in `noctalia-greeter.spec`.
2. Verify the new upstream release tag.
3. Build the RPM locally.
4. Run the package tests.
5. Submit the updated spec to COPR.

No source code needs to be copied into this repository.

## Packaging Philosophy

This package follows a few principles:

### Upstream source remains upstream

The Fedora repository does not maintain a separate copy or fork of Noctalia Greeter.

### Use Fedora's build system

The package uses Fedora RPM and Meson macros instead of invoking development convenience scripts.

### Do not modify system configuration silently

Installing an RPM should not unexpectedly replace the user's `greetd` configuration or authentication setup.

### Keep dependencies explicit

Libraries required for compilation are declared through RPM `BuildRequires`, preferably using `pkgconfig(...)`.

Runtime dependencies are declared separately through `Requires`.

### Keep the package reproducible

The source is obtained from a versioned upstream release rather than cloning an arbitrary development branch.

## License

Noctalia Greeter is distributed under the **MIT License**.

This repository contains packaging metadata and does not change the upstream project's license.

## Upstream

Noctalia Greeter is developed by the Noctalia project:

https://github.com/noctalia-dev/noctalia-greeter

This repository is an independent Fedora packaging project and is not the upstream Noctalia Greeter repository.
