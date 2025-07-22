# Copyright 2019-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="xrandr clone for wlroots compositors"
HOMEPAGE="https://gitlab.freedesktop.org/emersion/wlr-randr/"

SRC_URI="https://gitlab.freedesktop.org/emersion/wlr-randr/-/releases/v${PV}/downloads/${P}.tar.gz"
S="${WORKDIR}/${P}"
KEYWORDS="~amd64"

LICENSE="ISC"
SLOT="0"

DEPEND="
	dev-libs/wayland
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/wayland-protocols
	virtual/pkgconfig
"

src_prepare() {
	default
	sed -i 's/werror=true/werror=false/' meson.build || die
}
