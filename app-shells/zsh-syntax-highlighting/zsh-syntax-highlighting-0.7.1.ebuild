# Copyright 2023 Simon Heise
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zsh-users/zsh-syntax-highlighting.git"
else
	SRC_URI="https://github.com/zsh-users/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="This package provides syntax highlighting for the shell zsh. It enables highlighting of commands whilst they are typed at a zsh prompt into an interactive terminal. This helps in reviewing commands before running them, particularly in catching syntax errors."
HOMEPAGE="https://github.com/zsh-users/zsh-syntax-highlighting"

LICENSE="BSD-3-Clause license"
SLOT="0"

RDEPEND="app-shells/zsh"

src_install() {
	insinto /usr/share/zsh/plugins/${PN}
	doins ${PN}.zsh
}
