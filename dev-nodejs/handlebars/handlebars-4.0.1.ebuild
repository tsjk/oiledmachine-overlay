# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.4.7"
NODE_MODULE_EXTRA_FILES="dist runtime.js"
NODE_MODULE_DEPEND="async:1.4.0	source-map:0.4.4 optimist:0.6.1"

inherit node-module

DESCRIPTION="Provides the power necessary to let you build semantic templates effectively"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS=( README.markdown CONTRIBUTING.md FAQ.md release-notes.md )

src_install() {
	node-module_src_install
	use doc && dodoc docs/*
}
