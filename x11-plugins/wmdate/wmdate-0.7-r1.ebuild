# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils toolchain-funcs

DESCRIPTION="yet another date-display dock application"
HOMEPAGE="http://solfertje.student.utwente.nl/~dalroi/applications.php"
SRC_URI="http://solfertje.student.utwente.nl/~dalroi/${PN}/files/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND=">=x11-libs/libdockapp-0.7:=
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXpm"
DEPEND="${RDEPEND}
	x11-misc/gccmakedep
	x11-misc/imake"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-ComplexProgramTargetNoMan.patch

	sed -e 's#<dockapp.h>#<libdockapp/dockapp.h>#' -i *.c || die
}

src_configure() {
	xmkmf || die "xmkmf failed."
}

src_compile() {
	emake CC="$(tc-getCC)" CDEBUGFLAGS="${CFLAGS}" \
		LDOPTIONS="${LDFLAGS}"
}

src_install() {
	dobin ${PN}
	dodoc Changelog README
}
