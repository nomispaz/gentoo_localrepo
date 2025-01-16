# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

DESCRIPTION="Soothing pastel theme for Emacs"
HOMEPAGE="https://github.com/catppuccin/emacs"

SRC_URI="https://github.com/catppuccin/emacs/archive/4441d5114fdcc2eb05186a974b4bbad7224e43b5.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-4441d5114fdcc2eb05186a974b4bbad7224e43b5"

KEYWORDS="amd64 ~x86"

LICENSE="MIT"
SLOT="0"

ELISP_REMOVE="
	catppuccin-theme.test.el
"

SITEFILE="50${PN}-gentoo.el"
