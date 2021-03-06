# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.4.0"
NODE_MODULE_EXTRA_FILES="dist src bin"

inherit node-module

DESCRIPTION="ECMAScript parser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md AUTHORS CHANGELOG.md )

src_install() {
        node-module_src_install
        install_node_module_binary "bin/acorn" "/usr/bin/local/${PN}-${SLOT}"
}
