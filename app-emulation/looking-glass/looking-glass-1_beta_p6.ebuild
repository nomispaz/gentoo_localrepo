# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="${PV/1_beta_p/B}"
MY_P="${MY_PN}-${MY_PV}"

inherit cmake

DESCRIPTION="A low latency KVM FrameRelay implementation for guests with VGA PCI Passthrough"
HOMEPAGE="https://looking-glass.io/"
SRC_URI="https://looking-glass.io/artifact/${MY_PV}/source -> ${PN}-${MY_PV}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug pipewire pulseaudio wayland X"
REQUIRED_USE="X"

RDEPEND="debug? ( sys-devel/binutils )
                    media-libs/libsdl2
                    media-libs/fontconfig
                    dev-libs/nettle
                    media-libs/glu
                    pipewire? (
                    media-video/pipewire
                    media-libs/libsamplerate
                    )
                    pulseaudio? (
                        media-libs/libpulse
                        media-libs/libsamplerate
                    )
                    X? (
                        x11-libs/libX11
                        x11-libs/libXfixes
                        x11-libs/libXi
			x11-libs/libXpresent
                    )
                    wayland? (
                        dev-libs/wayland
                    )
"

DEPEND="${RDEPEND}
	app-emulation/spice-protocol
	wayland? ( dev-libs/wayland-protocols )
"
BDEPEND="dev-util/cmake
"

S="${WORKDIR}/${PN}-${MY_PV}"

CMAKE_USE_DIR="${S}"/client

src_configure () {
ss
	MYCMAKEARGS=(
		-DENABLE_BACKTRACE=$(usex debug) \
		-DENABLE_X11=$(usex X)
		-DENABLE_WAYLAND=$(usex wayland) \
		-DENABLE_PIPEWIRE=$(usex pipewire) \
		-DENABLE_PULSEAUDIO=$(usex pulseaudio)
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	einstalldocs
}
