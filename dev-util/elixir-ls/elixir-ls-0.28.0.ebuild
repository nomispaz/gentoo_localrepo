# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Elixir Language Server (ElixirLS)"
HOMEPAGE="https://github.com/elixir-lsp/elixir-ls"
SRC_URI="https://github.com/elixir-lsp/elixir-ls/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/elixir"
RDEPEND="${DEPEND}"

S="${WORKDIR}/elixir-ls-${PV}"

src_compile() {
  # Force Mix to use local _build
  #mix deps.get || die "deps failed"
  mix compile || die "compile failed"
  MIX_ENV=prod mix elixir_ls.release2 -o release || die "release failed"
}

src_install() {
  # Install the compiled language server release
  exeinto /usr/bin
  doexe release/language_server.sh

  insinto /usr/share/elixir-ls
  doins -r release/*
}
