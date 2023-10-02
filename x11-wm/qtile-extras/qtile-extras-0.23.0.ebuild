# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 virtualx

DESCRIPTION="Unofficial mods for qtile. Tagged release to match stable qtile releases."
HOMEPAGE="https://github.com/elParaguayo/qtile-extras"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/elParaguayo/qtile-extras.git"
else
	inherit pypi
	SRC_URI="https://github.com/elParaguayo/qtile-extras/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~riscv ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
"

BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

S="${WORKDIR}/${P}"

python_prepare_all() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_python_prepare_all
}

src_test() {
	virtx distutils-r1_src_test
}

python_compile() {
	export CFFI_TMPDIR=${T}
	distutils-r1_python_compile
}

python_install_all() {
	distutils-r1_python_install_all
}
