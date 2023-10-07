# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="NerdFontsSymbolsOnly"

inherit font

DESCRIPTION="High number of extra glyphs from popular 'iconic fonts'"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/${MY_PN}.tar.xz -> ${P}.tar.xz"

KEYWORDS="~amd64"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0/6"
IUSE="+ttf"

src_install() {
		FONT_S="${S}" FONT_SUFFIX="ttf" font_src_install
}
