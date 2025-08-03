# Copyright 2019-2022 Haelwenn (lanodan) Monnier <contact@hacktivis.me>
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit mix

DESCRIPTION="Package manager for the Erlang VM"
HOMEPAGE="https://github.com/hexpm/hex"
SRC_URI="https://github.com/hexpm/hex/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT=0
KEYWORDS="~amd64"
