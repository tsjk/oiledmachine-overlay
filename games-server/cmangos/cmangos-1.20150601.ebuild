# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils git-r3 cmake-utils

DESCRIPTION="CMaNGOS One for The Burning Crusade (TBC) 2.4.3 Client"
HOMEPAGE="https://www.getmangos.eu/"
LICENSE="GPL-2"
SLOT="1"
KEYWORDS="amd64"
RDEPEND="
	dev-libs/ace
	dev-cpp/tbb
	>=dev-libs/boost-1.49
	>=virtual/mysql-5.1.0
	>=dev-util/cmake-2.8.9
	>=dev-libs/openssl-1.0
	>=sys-devel/gcc-4.7.2
	>=sys-libs/zlib-1.2.7
	>=net-libs/zeromq-2.2.6
	app-arch/bzip2
	virtual/cmangos-db:1
"
IUSE="pch sd2 eluna"

S="${WORKDIR}"

src_unpack() {
	EGIT_CHECKOUT_DIR="${WORKDIR}"
	EGIT_REPO_URI="https://github.com/cmangos/mangos-tbc.git"
	EGIT_BRANCH="master"
	EGIT_COMMIT="aabe1d0763caa34a61fdc2118324e1abb8e0eb6d"
	git-r3_fetch
	git-r3_checkout
	eapply "${FILESDIR}/mangos-4-cmake-location.patch"

	if use sd2; then
		EGIT_CHECKOUT_DIR="${WORKDIR}/src/bindings/sd2"
		EGIT_REPO_URI="https://github.com/scriptdev2/scriptdev2-tbc.git"
		EGIT_BRANCH="master"
		EGIT_COMMIT="28fb90cde649df98313f37c9c561508f34263067"
		git-r3_fetch
		git-r3_checkout
	fi
	if use eluna; then
		EGIT_CHECKOUT_DIR="${WORKDIR}/src/bindings/eluna"
		EGIT_REPO_URI="https://github.com/ElunaLuaEngine/ElunaMangosClassic.git"
		EGIT_BRANCH="master"
		EGIT_COMMIT="38a921e92be5861ace72dbc2a77bedf6bb66f04c"
		git-r3_fetch
		git-r3_checkout
	fi
}

src_prepare() {
	eapply_user
}

src_configure() {
	local mycmakeargs=(
		-DCONF_DIR=/etc/cmangos/1
		-DCMAKE_INSTALL_PREFIX=/usr/games/bin/cmangos/1
		-DTBB_USE_EXTERNAL=1
		-DACE_USE_EXTERNAL=1
	)
	if use sd2 && use eluna; then
		die "Only one script engine is supported."
	fi
	if use sd2; then
		mycmakeargs+=( -DINCLUDE_BINDINGS_DIR=sd2 )
	fi
	if use eluna; then
		mycmakeargs+=( -DINCLUDE_BINDINGS_DIR=eluna )
	fi
	if use pch; then
		mycmakeargs+=( -DPCH=1 )
	else
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
	fperms 0755 "/usr/games/bin/cmangos/1/bin/run-mangosd"
	mkdir -p "${D}/usr/share/cmangos/1/sql"
	mkdir -p "${D}/usr/share/cmangos/1/sql/sd2"
	cp -R "${WORKDIR}"/sql/* "${D}/usr/share/cmangos/1/sql"
	cp -R "${WORKDIR}"/src/bindings/sd2/sql/* "${D}/usr/share/cmangos/1/sql/sd2"
}

pkg_postinst() {
	echo ""
	echo "Use cmangos-db-1 to install the databases."
	echo ""
}
