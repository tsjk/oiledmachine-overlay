# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils cmake-utils

DESCRIPTION="MojoShader is a library to work with Direct3D shaders on alternate 3D APIs and non-Windows platforms."
HOMEPAGE="https://icculus.org/mojoshader/"
COMMIT="b873f3b0f838"
SRC_URI="https://hg.icculus.org/icculus/${PN}/archive/${COMMIT}.tar.bz2 -> ${P}.tar.bz2"

LICENSE="ZLIB"
SLOT="9999"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="debug static +profile_bytecode +profile_d3d +profile_glsl120 +profile_glsl +profile_arb1 +profile_arb1_nv -effect_support -flip_viewport -depth_clipping -xna_vertextexture"
REQUIRED_USE=""

RDEPEND="dev-util/re2c
	 media-libs/libsdl2"
DEPEND="${RDEPEND}
	>=dev-util/cmake-2.6
"

S="${WORKDIR}/${PN}-${COMMIT}"

src_prepare() {
	eapply_user

	cmake-utils_src_prepare
}

src_configure() {
	if use debug ; then
		CMAKE_BUILD_TYPE="Debug"
	else
		CMAKE_BUILD_TYPE="Release"
	fi

	PREFIX="${D}"

        local mycmakeargs=(
                -DPROFILE_D3D=$(usex profile_d3d)
                -DPROFILE_BYTECODE=$(usex profile_bytecode)
                -DPROFILE_GLSL120=$(usex profile_glsl120)
                -DPROFILE_GLSL=$(usex profile_glsl)
                -DPROFILE_ARB1=$(usex profile_arb1)
                -DPROFILE_ARB1_NV=$(usex profile_arb1_nv)
                -DEFFECT_SUPPORT=$(usex effect_support)
                -DFLIP_VIEWPORT=$(usex flip_viewport)
                -DDEPTH_CLIPPING=$(usex depth_clipping)
                -DXNA4_VERTEXTEXTURE=$(usex xna_vertextexture)
        )
	if use static; then
		mycmakeargs+=( -DBUILD_SHARED=OFF )
	else
		mycmakeargs+=( -DBUILD_SHARED=ON )
	fi

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	#cmake-utils_src_install
	cd "${WORKDIR}/${PN}-${PV}_build"
	mkdir -p "${D}/usr/$(get_libdir)/mojoshader"
	cp libmojoshader.so "${D}/usr/$(get_libdir)"
	cp $(find . -maxdepth 1 -type f -executable | grep -v "\.so") "${D}/usr/$(get_libdir)/mojoshader"

	cd "${S}"
	mkdir -p "${D}/usr/include/MojoShader"
	cp mojoshader_internal.h "${D}/usr/include/MojoShader"
	cp mojoshader.h "${D}/usr/include/MojoShader"
	cp mojoshader_effects.h "${D}/usr/include/MojoShader"
	dodoc README.txt
}
