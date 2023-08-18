# Copyright 2023 Simon Heise
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zsh-users/zsh-history-substring-search.git"
else
	SRC_URI="https://github.com/zsh-users/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="This is a clean-room implementation of the Fish shell's history search feature, where you can type in any part of any command from history and then press chosen keys, such as the UP and DOWN arrows, to cycle through matches."
HOMEPAGE="https://github.com/zsh-users/zsh-history-substring-search"

LICENSE="Apache-2.0 BSD"
SLOT="0"

RDEPEND="app-shells/zsh"

src_install() {
	insinto /usr/share/zsh/plugins/${PN}
	doins ${PN}.zsh
}
