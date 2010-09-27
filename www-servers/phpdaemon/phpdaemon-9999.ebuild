EAPI="2"

S="${WORKDIR}/runkit"

inherit git

KEYWORDS="~amd64 ~x86"

DESCRIPTION="PHPDaemon"
SLOT="0"
IUSE="+proctitle +runkit examples"

DEPEND="
	>=dev-lang/php-5.3.1[cli,ctype,sockets,sharedmem,pcntl,posix,json]
	dev-php5/pecl-libevent
	runkit? ( dev-php5/pecl-runkit[modify] )
	proctitle? ( dev-php5/pecl-proctitle )
"
RDEPEND="${DEPEND}"

HOMEPAGE="http://github.com/kakserpom/phpdaemon/"
EGIT_REPO_URI="git://github.com/kakserpom/phpdaemon.git"
unset SRC_URI

src_unpack() {
	git_src_unpack
	cd "${S}"

	mv conf/logrotate conf/phpd_rotate
	mv conf/phpdaemon.conf.php conf/phpd.conf
}

src_install() {
	BASE="/opt/phpdaemon"

	insinto ${BASE}
	doins VERSION || die

	insinto ${BASE}/app-clients
	doins app-clients/*.php || die

	if use examples; then
		insinto ${BASE}/app-examples
		doins app-examples/*.php || die
	fi

	insinto ${BASE}/app-servers
	doins app-servers/*.php || die

	insinto ${BASE}/app-web
	doins app-web/*.php || die

	insinto ${BASE}/bin
	doins bin/* || die

	fperms +x ${BASE}/bin/phpdaemon
	fperms +x ${BASE}/bin/php-chroot

	if use examples; then
		insinto ${BASE}/clientside-connectors/websocket
		doins clientside-connectors/websocket/index.html || die

		insinto ${BASE}/clientside-connectors/websocket/js
		doins clientside-connectors/websocket/js/* || die
	fi

	insinto ${BASE}/conf
	doins conf/crossdomain.xml || die

	insinto ${BASE}/lib
	doins lib/*.php || die

	insinto /etc/logrotate.d
	doins conf/phpd_rotate || die

	insinto /etc/phpd
	doins conf/phpd.conf || die
	doins conf/appResolver.php || die

	dosym ${BASE}/bin/phpdaemon /usr/bin/phpd
}










