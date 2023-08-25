# Copyright 2023 Simon Heise
# Distributed under the terms of the GNU General Public License v2

EAPI=8

SRC_URI="https://download.clipgrab.org/${PN}-${PV}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A video downloader and converter for YouTube, Veoh, DailyMotion, MyVideo, ..."
HOMEPAGE="https://clipgrab.org/"

LICENSE="GPL3"
SLOT="0"

DEPEND=""
RDEPEND="
        ${DEPEND}
        media-video/ffmpeg
        net-misc/yt-dlp
        #dev-qt/qtwebengine
        "
BDEPEND=""

src_install() {
	insinto /usr/share/zsh/plugins/${PN}
	doins ${PN}.zsh
}
