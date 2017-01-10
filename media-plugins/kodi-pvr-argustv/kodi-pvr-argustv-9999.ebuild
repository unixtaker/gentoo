# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils kodi-addon

DESCRIPTION="Kodi's ARGUS TV client addon"
HOMEPAGE="https://github.com/kodi-pvr/pvr.argustv"
SRC_URI=""

case ${PV} in
9999)
	SRC_URI=""
	EGIT_REPO_URI="git://github.com/kodi-pvr/pvr.argustv.git"
	inherit git-r3
	;;
*)
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/kodi-pvr/pvr.argustv/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/pvr.argustv-${PV}"
	;;
esac

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	media-tv/kodi
	media-libs/kodi-platform
	dev-libs/jsoncpp
	"

RDEPEND="
	${DEPEND}
	"