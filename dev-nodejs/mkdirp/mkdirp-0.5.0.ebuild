# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit node-module

NODE_MODULE_EXTRA_FILES="bin"

DESCRIPTION="Recursively mkdir, like mkdir -p"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="${RDEPEND}
	 dev-nodejs/minimist:0.0.8" #must state explicity because it doesn't work as expected
DEPEND="${DEPEND}"

DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	install_node_module_binary "bin/cmd.js" "/usr/local/bin/${PN}-${SLOT}"
	install_node_module_depend "minimist:0.0.8"
	use examples && dodoc -r examples
}
