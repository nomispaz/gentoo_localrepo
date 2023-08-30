# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit python-any-r1 meson

MY_PN="MangoHud"
MY_PV=$(ver_cut 1-3)
[[ -n "$(ver_cut 4)" ]] && MY_PV_REV="-$(ver_cut 4)"

DESCRIPTION="A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more."
HOMEPAGE="https://github.com/flightlessmango/MangoHud"

SRC_URI="https://github.com/flightlessmango/MangoHud/releases/download/v${MY_PV}${MY_PV_REV}/${MY_PN}-v${MY_PV}${MY_PV_REV}-Source.tar.xz -> ${P}.tar.gz
					https://github.com/flightlessmango/MangoHud/commit/5754ca13ee2cdf19a76b4fc79dd914a58d6371f5.patch --> ${FILESDIR}/5754ca13ee2cdf19a76b4fc79dd914a58d6371f5.patch"

KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"
IUSE="+dbus debug +X xnvctrl +wayland video_cards_nvidia video_cards_amdgpu"

REQUIRED_USE="
	|| ( X wayland )
	xnvctrl? ( video_cards_nvidia )"

BDEPEND="
	$(python_gen_any_dep 'dev-python/mako[${PYTHON_USEDEP}]')
"

python_check_deps() {
	python_has_version "dev-python/mako[${PYTHON_USEDEP}]"
}

DEPEND="
	dev-cpp/nlohmann_json
	dev-libs/spdlog
	dev-util/glslang
	media-libs/vulkan-loader
	media-libs/libglvnd
	dbus? ( sys-apps/dbus )
	X? ( x11-libs/libX11 )
	video_cards_nvidia? (
		x11-drivers/nvidia-drivers
		xnvctrl? ( x11-drivers/nvidia-drivers[static-libs] )
	)
	wayland? ( dev-libs/wayland )
"

RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/5754ca13ee2cdf19a76b4fc79dd914a58d6371f5.patch"
)

src_prepare() {
	default


	}

src_configure() {
	local emesonargs=(
		-Dappend_libdir_mangohud=false
		-Duse_system_spdlog=enabled
		-Dinclude_doc=false
		$(meson_feature video_cards_nvidia with_nvml)
		$(meson_feature xnvctrl with_xnvctrl)
		$(meson_feature X with_x11)
		$(meson_feature wayland with_wayland)
		$(meson_feature dbus with_dbus)
	)
	meson_src_configure
}

pkg_postinst() {
	if ! use xnvctrl; then
		einfo ""
		einfo "If mangohud can't get GPU load, or other GPU information,"
		einfo "and you have an older Nvidia device."
		einfo ""
		einfo "Try enabling the 'xnvctrl' useflag."
		einfo ""
	fi
}
