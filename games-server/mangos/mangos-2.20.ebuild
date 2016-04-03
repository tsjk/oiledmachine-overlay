EAPI=5
inherit eutils git-2 cmake-utils

DESCRIPTION="MaNGOS Two for The Wrath of the Lich King (WOTLK) 3.3.5a Client"
HOMEPAGE="https://www.getmangos.eu/"
LICENSE="GPL-2"
SLOT="2"
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
	EGIT_SOURCEDIR="${WORKDIR}"
	EGIT_REPO_URI="https://github.com/mangostwo/server.git"
	EGIT_BRANCH="Rel20_Newbuild"
	EGIT_COMMIT="d7a4f2c10f565b7f75c3d3ebf627574fe54571cb"
	git-2_src_unpack

	EGIT_SOURCEDIR="${WORKDIR}/dep"
	EGIT_REPO_URI="https://github.com/mangos/mangosDeps.git"
	EGIT_BRANCH="master"
	EGIT_COMMIT="607338fc0dba69a049b4ce3594564e76a4158ee1"
	git-2_src_unpack

	EGIT_SOURCEDIR="${WORKDIR}/src/realmd"
	EGIT_REPO_URI="https://github.com/mangos/realmd.git"
	EGIT_BRANCH="master"
	EGIT_COMMIT="15df5d42ae03cabe9cebfbd7534df8af4f739ecb"
	git-2_src_unpack

	EGIT_SOURCEDIR="${WORKDIR}/src/modules/Eluna"
	EGIT_REPO_URI="https://github.com/ElunaLuaEngine/Eluna.git"
	EGIT_BRANCH="master"
	EGIT_COMMIT="9fe397aaf5d89e754467df8a4821e2057d66d9a8"
	git-2_src_unpack

	epatch "${FILESDIR}/mangos-0-vmap-assembler.patch"
	epatch "${FILESDIR}/mangos-2-movemap-generator.patch"
}
src_configure(){
	local mycmakeargs=(
		-DCONF_DIR=/etc/mangos/2
		-DCMAKE_INSTALL_PREFIX=/usr/games/bin/mangos/2
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
}
