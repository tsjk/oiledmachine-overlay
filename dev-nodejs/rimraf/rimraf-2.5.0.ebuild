# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="glob:6.0.1"
NODE_MODULE_EXTRA_FILES="bin.js"

inherit node-module

DESCRIPTION="A deep deletion module for node (like rm -rf)"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_install() {
        node-module_src_install
	install_node_module_binary "bin.js" "/usr/local/bin/${PN}-${SLOT}"
}
