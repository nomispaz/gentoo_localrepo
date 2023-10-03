# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="Font-Awesome-icons"
inherit font

DESCRIPTION="Fontawesome SVG Icons"
HOMEPAGE="https://fontawesome.com"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/FortAwesome/${MY_PN}.git"
else
	SRC_URI="https://github.com/FortAwesome/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 arm arm64 ~ppc64 ~riscv x86"
	S="${WORKDIR}/${MY_PN}-${PV}"
fi

LICENSE="CC-BY-4.0 OFL-1.1"
SLOT="0"
IUSE=""

src_install() {
	insinto /usr/share/icons/fontawesome
	doins -r svgs/*
}
