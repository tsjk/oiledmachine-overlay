# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="qs:1.0.0 json-stringify-safe:5.0.0 mime-types:1.0.1 forever-agent:0.5.0 node-uuid:1.4.0"
NODE_MODULE_EXTRA_FILES="request.js"

inherit node-module

DESCRIPTION="Simplified HTTP request client"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
