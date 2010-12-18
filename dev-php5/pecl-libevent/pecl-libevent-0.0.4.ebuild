EAPI=2

PHP_EXT_NAME="libevent"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

S="${WORKDIR}/libevent-${PV}"

inherit php-ext-source-r2 confutils

KEYWORDS="amd64 x86"

DESCRIPTION="PHP libevent extension."
SLOT="0"
IUSE=""

DEPEND="
	>=dev-lang/php-5.1.3
	dev-libs/libevent
"
RDEPEND="${DEPEND}"

HOMEPAGE="http://pecl.php.net/package/libevent"
SRC_URI="http://pecl.php.net/get/libevent-${PV}.tgz"

src_compile() {
	my_conf="--with-libevent"

	php-ext-source-r2_src_compile
}

src_install() {
	php-ext-source-r2_src_install
}
