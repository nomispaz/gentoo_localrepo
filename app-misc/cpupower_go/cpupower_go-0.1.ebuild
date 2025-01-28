# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 go-module

DESCRIPTION="A simple wrapper to set maximum cpu frequency with cpupower"
HOMEPAGE="https://github.com/nomispaz/cpupower_go"
SRC_URI="https://github.com/nomispaz/cpupower_go/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sys-power/cpupower
"
DEPEND="
	${RDEPEND}
"
BDEPEND="
"

# Set Go module variables
EGO_PN="${PN}"
EGO_VENDOR="vendor"
EGO_SUM="go.sum"
EGO_MOD="go.mod"

# Fetch dependencies using go mod
src_unpack() {
    git-r3_src_unpack
}

src_prepare() {
    default
    # Ensure Go modules are tidy and dependencies are fetched
    go mod tidy
    go mod vendor
}

src_compile() {
    ego build
}

src_install() {
    dobin cpupower_go

    default
}
