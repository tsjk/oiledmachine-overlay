EAPI=5
inherit eutils git-r3 cmake-utils

DESCRIPTION="MaNGOS Four for the Mists of Pandaria (MOP) 5.4.8 Client"
HOMEPAGE="https://www.getmangos.eu/"
LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64"
RDEPEND="
	>=dev-libs/boost-1.49
	>=virtual/mysql-5.1.0
	>=dev-util/cmake-2.8.9
	>=dev-libs/openssl-1.0
	>=sys-devel/gcc-4.7.2
	>=sys-libs/zlib-1.2.7
	>=net-libs/zeromq-2.2.6
	app-arch/bzip2
"
IUSE="tools pch sd2 eluna"

S="${WORKDIR}"
src_unpack() {
	EGIT_CHECKOUT_DIR="${WORKDIR}"
	EGIT_REPO_URI="https://github.com/mangosfour/server.git"
	EGIT_BRANCH="master"
	EGIT_COMMIT="fcc15e13fa48cd41a3c8dfbd8a04991c14c7368d"
	git-r3_fetch
	git-r3_checkout

	epatch "${FILESDIR}/mangos-4-vmap-assembler.patch"
	epatch "${FILESDIR}/mangos-4-cmake-location.patch"
}
src_configure(){
	local mycmakeargs=(
		-DCONF_DIR=/etc/mangos/4
		-DCMAKE_INSTALL_PREFIX=/usr/games/bin/mangos/4
		-DACE_USE_EXTERNAL=1
	)
	if use eluna; then
		mycmakeargs+=( -DSCRIPT_LIB_ELUNA=1 )
	else
		mycmakeargs+=( -DSCRIPT_LIB_ELUNA=0 )
	fi
	if use sd2; then
		mycmakeargs+=( -DSCRIPT_LIB_SD2=1 )
	else
		mycmakeargs+=( -DSCRIPT_LIB_SD2=0 )
	fi
	if use tools; then
		mycmakeargs+=( -DBUILD_TOOLS=1 )
	else
		mycmakeargs+=( -DBUILD_TOOLS=0 )
	fi
	if use pch; then
		mycmakeargs+=( -DUSE_COREPCH=1 )
		mycmakeargs+=( -DUSE_SCRIPTPCH=1 )
		mycmakeargs+=( -DPCH=1 )
	else
		mycmakeargs+=( -DUSE_COREPCH=0 )
		mycmakeargs+=( -DUSE_SCRIPTPCH=0 )
		mycmakeargs+=( -DPCH=0 )
	fi

	cmake-utils_src_configure
}
src_compile() {
	cmake-utils_src_compile
}
src_test() {
	cmake-utils_src_test
}
src_install() {
	cmake-utils_src_install
	fperms 0755 "/usr/games/bin/mangos/4/bin/run-mangosd"
}