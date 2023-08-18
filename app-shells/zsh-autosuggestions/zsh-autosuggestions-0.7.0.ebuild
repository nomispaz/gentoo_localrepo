# Copyright 2023 Simon Heise
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zsh-users/zsh-autosuggestions.git"
else
	SRC_URI="https://github.com/zsh-users/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Fish-like fast/unobtrusive autosuggestions for zsh. It suggests commands as you type based on history and completions. Requirements: Zsh v4.3.11 or later"
HOMEPAGE="https://github.com/zsh-users/zsh-autosuggestions"

LICENSE="Apache-2.0 BSD"
SLOT="0"

RDEPEND="app-shells/zsh"

src_install() {
	insinto /usr/share/zsh/plugins/${PN}
	doins ${PN}.zsh
}
