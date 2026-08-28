# COPR Specs

This directory contains the RPM packaging configurations used to build third-party software for Fedora through COPR.

The contents of this directory are primarily intended for the Zaoth ecosystem and should not be confused with the source code of the packaged projects.

## Purpose

The `copr_specs` directory centralizes the RPM `.spec` files and related packaging resources used by Zaoth.

The general structure is:

```text
zaoth/
├── copr_specs/
│   ├── noctalia_greeter/
│   │   └── main.spec
│   │
│   ├── zed/
│   │   └── main.spec
│   │
│   ├── librewolf/
│   │   └── main.spec
│   │
│   └── ...
│
├── recipe.yml
├── modules/
└── ...
```

Each directory inside `copr_specs` represents a package definition and contains the files necessary to build that package for Fedora.

This organization allows the packaging configuration for multiple projects to remain centralized inside the Zaoth repository without requiring a separate repository for every RPM package.

---

# What is included here?

The files in this directory may include:

* RPM `.spec` files;
* package metadata;
* build dependencies;
* source definitions;
* patches, when necessary;
* installation rules;
* Fedora-specific packaging adjustments.

These files are used by COPR and Fedora's RPM build tools to transform upstream source code into installable RPM packages.

The source code of the packaged applications is generally downloaded from their respective upstream projects during the build process.

For example:

```text
Upstream project
      │
      ▼
Source archive / GitHub release
      │
      ▼
RPM .spec
      │
      ▼
COPR build environment
      │
      ▼
Fedora RPM package
      │
      ▼
Zaoth
```

---

# Important: Zaoth does not maintain most of these projects

Most packages defined in this directory are third-party projects.

Zaoth does not claim ownership of their source code and does not necessarily maintain the upstream software.

The responsibility of this repository is primarily limited to maintaining the packaging configuration necessary to build and distribute the software as Fedora RPM packages.

The original projects remain under the ownership and maintenance of their respective upstream developers and communities.

This means that:

* bugs in the original software should generally be reported upstream;
* feature requests should generally be directed to the upstream project;
* upstream licenses continue to apply to the packaged software;
* the `.spec` files in this repository may contain Fedora-specific modifications;
* package maintainers may update or adapt the RPM packaging independently from upstream releases.

When possible, the package metadata should reference the original upstream project.

---

# Why maintain these specifications?

Zaoth aims to provide a consistent and controlled ecosystem built around Fedora Atomic technologies.

Some applications required by Zaoth may:

* not be available in the official Fedora repositories;
* only be available through third-party COPR repositories;
* require external repositories with unrelated packages;
* require packaging configurations that are not suitable for the Zaoth ecosystem.

Maintaining the RPM specifications directly allows Zaoth to control the packages it depends on without requiring users to enable multiple unrelated third-party repositories.

Instead of this:

```text
Zaoth

├── Fedora repositories
├── COPR repository A
├── COPR repository B
├── COPR repository C
├── COPR repository D
└── ...
```

The goal is to move toward a more centralized structure:

```text
Zaoth

├── Fedora repositories
└── Zaoth COPR packages
```

This reduces external repository dependencies and makes the image configuration easier to maintain.

---

# Packaging process

The general process used to create a package is described below.

## 1. Select an upstream project

First, an application is selected because it is needed by Zaoth or is considered part of the Zaoth ecosystem.

Examples may include:

* greeters;
* desktop applications;
* development tools;
* browsers;
* terminal applications;
* file managers;
* other software not directly available in Fedora.

The upstream project remains independent from Zaoth.

---

## 2. Create a package directory

A directory is created inside `copr_specs`.

For example:

```text
copr_specs/
└── noctalia_greeter/
```

This directory contains the packaging configuration for that application.

The package specification can then be stored as:

```text
copr_specs/noctalia_greeter/main.spec
```

This structure allows all package definitions to remain inside the main Zaoth repository.

---

## 3. Create the RPM specification

The `.spec` file defines how Fedora should build the package.

A typical RPM specification contains information such as:

```spec
Name:
Version:
Release:
Summary:
License:
URL:
Source:
```

It also defines the required build dependencies:

```spec
BuildRequires:
```

And the build stages:

```spec
%prep
%build
%install
%files
```

The RPM build process can therefore be represented as:

```text
Source
   │
   ▼
%prep
   │
   ▼
%build
   │
   ▼
%install
   │
   ▼
%files
   │
   ▼
RPM package
```

---

# Example: Noctalia Greeter

One of the first packages prepared for this structure was `noctalia-greeter`.

The process involved creating an RPM specification that:

1. downloads the upstream source release;
2. installs the required Fedora build dependencies;
3. configures the project using Meson;
4. builds the project using Ninja;
5. installs the resulting files into the RPM build root;
6. generates a Fedora-compatible RPM package.

During this process, dependency problems were encountered inside the COPR/mock build environment.

Some dependencies available or expected in a local environment were not available under the expected names in the Fedora build environment.

Examples of issues encountered included missing dependencies such as:

* `wlroots`;
* `wayland-scanner`;
* other build-time dependencies required by the upstream build system.

The RPM specification was adjusted according to the actual requirements of the project and the Fedora build environment until the package successfully built through COPR.

The important part of this process is that a successful local build is not always sufficient.

COPR builds packages inside an isolated Fedora environment.

Therefore, the package must explicitly define everything necessary for the build:

```text
Developer machine
      │
      │ may contain additional packages
      ▼
Local build works
```

does not necessarily mean:

```text
COPR / Mock environment
      │
      │ clean build environment
      ▼
Build succeeds
```

The `.spec` file must therefore correctly declare its build requirements.

---

# Build dependencies

Fedora RPM packages distinguish between dependencies required during compilation and dependencies required by the final installed package.

For example:

```spec
BuildRequires: meson
BuildRequires: ninja-build
BuildRequires: gcc-c++
```

These dependencies are necessary to build the software.

Runtime dependencies are dependencies required by the final package after installation.

The RPM system can automatically detect some runtime dependencies, but explicit dependencies may also be necessary depending on the package.

---

# COPR

COPR is used to build the RPM packages in a Fedora-compatible environment.

The process is approximately:

```text
Zaoth repository
      │
      ▼
copr_specs/<package>/main.spec
      │
      ▼
COPR
      │
      ▼
Mock build environment
      │
      ▼
Dependency resolution
      │
      ▼
Source preparation
      │
      ▼
Compilation
      │
      ▼
Installation into RPM build root
      │
      ▼
RPM generation
      │
      ▼
COPR repository
```

The resulting RPM can then be consumed by Fedora systems and by the Zaoth image.

---

# Relationship with Zaoth

The packages built from this directory are intended to support the Zaoth ecosystem.

However, the package definitions and the Zaoth image should remain separate in terms of responsibility.

The RPM package is responsible for:

```text
Installing the application
Installing application files
Installing binaries
Installing libraries
Installing application resources
```

The Zaoth image is responsible for:

```text
Installing the RPM
Configuring the operating system
Enabling system services
Integrating applications
Providing the default system environment
```

For example, `noctalia-greeter` may provide the greeter application itself, while Zaoth configures `greetd` to launch it.

Conceptually:

```text
noctalia-greeter RPM
        │
        ├── application
        ├── binaries
        └── application resources

Zaoth
        │
        ├── installs greetd
        ├── installs noctalia-greeter
        ├── configures /etc/greetd/config.toml
        └── enables greetd.service
```

This separation keeps the RPM reusable outside of Zaoth.

---

# Package maintenance

Maintaining an RPM specification does not necessarily mean maintaining the original software.

There are two separate projects involved:

```text
Upstream software
        │
        │ maintained by upstream developers
        ▼
Source release
        │
        ▼
Zaoth RPM packaging
        │
        │ maintained independently
        ▼
Fedora RPM package
```

Changes made to the RPM specification may include:

* dependency adjustments;
* Fedora compatibility fixes;
* build system configuration;
* installation paths;
* packaging metadata;
* patches necessary for RPM builds.

These changes do not imply ownership of the original project.

---

# Licenses

Each packaged application remains subject to its original license.

The existence of an RPM specification in this repository does not change the license of the upstream software.

For example:

```text
Upstream Project A → MIT
Upstream Project B → GPL
Upstream Project C → Apache-2.0
```

Each project continues using its respective license.

The packaging configuration itself may have a separate license depending on the licensing policy of the Zaoth project.

Always check the upstream repository and source distribution for the correct license before creating or modifying a package specification.

---

# Goals

The long-term goal of this directory is to provide a centralized packaging system for the Zaoth ecosystem.

The main objectives are:

* reduce dependency on unrelated third-party repositories;
* centralize package definitions;
* simplify Zaoth image configuration;
* make builds reproducible;
* keep Fedora packaging isolated from the main application logic;
* maintain a clear separation between upstream projects and Zaoth integration;
* allow packages to be reused independently from Zaoth.

The project does not aim to replace the upstream developers.

Instead, it provides Fedora RPM packaging and integration for software used by the Zaoth ecosystem.

---

# Disclaimer

The projects packaged through `copr_specs` are generally independent third-party projects.

Their names, trademarks, source code, licenses, and copyrights belong to their respective owners and contributors.

This repository primarily contains packaging configurations and Fedora integration required to build RPM packages through COPR.

Zaoth is not affiliated with, endorsed by, or necessarily associated with the upstream projects unless explicitly stated otherwise.
