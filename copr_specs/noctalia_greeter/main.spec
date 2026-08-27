Name:           noctalia-greeter
Version:        1.2.1
Release:        1%{?dist}
Summary:        Minimal greetd login greeter with a bundled wlroots compositor

License:        MIT
URL:            https://github.com/noctalia-dev/%{name}
Source0:        %{url}/archive/refs/tags/v%{version}.tar.gz

BuildRequires:  gcc-c++
BuildRequires:  meson
BuildRequires:  ninja-build
BuildRequires:  pkgconf

BuildRequires:  cairo-devel
BuildRequires:  dbus-devel
BuildRequires:  fontconfig-devel
BuildRequires:  freetype-devel
BuildRequires:  glib2-devel
BuildRequires:  libglvnd-devel
BuildRequires:  libinput-devel
BuildRequires:  librsvg2-devel
BuildRequires:  libwebp-devel
BuildRequires:  libxkbcommon-devel
BuildRequires:  nlohmann-json-devel
BuildRequires:  pango-devel
BuildRequires:  stb-devel
BuildRequires:  tomlplusplus-devel
BuildRequires:  wayland-devel
BuildRequires:  wayland-protocols-devel
BuildRequires:  wlroots-devel

Requires:       cairo
Requires:       dbus
Requires:       fontconfig
Requires:       freetype
Requires:       glib2
Requires:       greetd
Requires:       libglvnd
Requires:       libinput
Requires:       librsvg2
Requires:       libwebp
Requires:       libxkbcommon
Requires:       pango

Requires:       wlroots

Suggests:       noctalia

%description
Noctalia Greeter is a minimal login greeter for greetd that matches
the look and feel of Noctalia Shell.

It provides user selection, password authentication, Wayland session
selection and color scheme selection through a Wayland-based greeter
and its bundled wlroots compositor.

%prep
%autosetup

%build
export CFLAGS="%{optflags} -fno-PIE"
export CXXFLAGS="%{optflags} -fno-PIE -Wno-unused-result"
export LDFLAGS="-Wl,-no-pie"

%meson -Db_pie=false -Db_ndebug=true
%meson_build

%install
%meson_install

install -Dpm 0644 LICENSE \
    %{buildroot}%{_licensedir}/%{name}/LICENSE

install -Dpm 0644 README.md \
    %{buildroot}%{_docdir}/%{name}/README.md

find %{buildroot} -type f -o -type l | sort

%files
%license LICENSE
%doc README.md

%{_bindir}/noctalia-greeter
%{_bindir}/noctalia-greeter-apply-appearance
%{_bindir}/noctalia-greeter-session
%{_bindir}/noctalia-greeter-print-greetd-config
%{_bindir}/noctalia-greeter-compositor

%{_datadir}/noctalia-greeter/
%{_datadir}/polkit-1/actions/org.noctalia.greeter.apply-appearance.policy

%{_prefix}/lib/tmpfiles.d/noctalia-greeter.conf

%changelog
* Wed Aug 26 2026 Geliardi Oliveira <geliardi9728@gmail.com> - 1.2.1-1
- Initial package
