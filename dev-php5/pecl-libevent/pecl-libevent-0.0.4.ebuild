PHP_EXT_NAME="libevent"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

S="${WORKDIR}/libevent-${PV}"

inherit php-ext-source-r1 confutils

KEYWORDS="amd64 x86"

DESCRIPTION="PHP libevent extension."
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/php-5.1.3"
RDEPEND="${DEPEND}"

HOMEPAGE="http://pecl.php.net/package/libevent"
SRC_URI="http://pecl.php.net/get/libevent-${PV}.tgz"

need_php_by_category

src_compile() {
	has_php

	my_conf="--with-libevent"	

	php-ext-source-r1_src_compile
}

src_install() {
	php-ext-source-r1_src_install
}
