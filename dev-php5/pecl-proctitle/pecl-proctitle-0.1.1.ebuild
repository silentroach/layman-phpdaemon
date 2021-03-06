EAPI=2

PHP_EXT_NAME="proctitle"
PHP_EXT_PECL_PKG="PROCTITLE"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

S="${WORKDIR}/proctitle-${PV}"

KEYWORDS="x86 amd64"

inherit php-ext-source-r2 confutils

DESCRIPTION="PHP proctitle extension."
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/php-5.2.0"
RDEPEND="${DEPEND}"

HOMEPAGE="http://pecl.php.net/package/proctitle"
SRC_URI="http://pecl.php.net/get/proctitle-${PV}.tgz"

src_compile() {
	my_conf="--enable-proctitle"

	php-ext-source-r2_src_compile
}

src_install() {
	php-ext-source-r2_src_install
}
