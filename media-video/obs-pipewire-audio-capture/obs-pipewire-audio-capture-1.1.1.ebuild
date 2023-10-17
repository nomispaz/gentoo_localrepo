# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Audio device and application capture for OBS Studio using PipeWire"
HOMEPAGE="https://github.com/dimtpap/obs-pipewire-audio-capture"

SRC_URI="https://github.com/dimtpap/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

BDEPEND="media-video/wireplumber
         media-video/obs-studio
         "

src_configure () {
	MYCMAKEARGS=(
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	)

	cmake_src_configure
}