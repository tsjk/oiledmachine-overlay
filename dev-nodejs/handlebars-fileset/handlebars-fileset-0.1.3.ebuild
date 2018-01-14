# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="array-tools:1.0.6 file-set:0.2.0"
#array-tools:1.0.4 is broken use 1.0.6

inherit node-module

DESCRIPTION="Handlebars helper to create filesets"

LICENSE="" #it doesn't say
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

