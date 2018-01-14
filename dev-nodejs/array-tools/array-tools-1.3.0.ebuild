# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="object-tools:1.0.2 typical:1.0.0"
#object-tools:1.0.0 is broken use 1.0.2 instead

inherit node-module

DESCRIPTION="Useful functions for working with arrays"

LICENSE="" #it doesn't say
KEYWORDS="~amd64 ~x86"

DOCS=( jsdoc2md/README.hbs README.md )

src_install() {
        node-module_src_install
	install_node_module_binary "cli.js" "/usr/local/bin/${PN}-${SLOT}"
}

