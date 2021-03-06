# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_EXTRA_FILES="browser.js"

inherit node-module

DESCRIPTION="Array-slice method. Slices array from the start index up to, but not including, the end index."

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
