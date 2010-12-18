EAPI=2

PHP_EXT_NAME="libevent"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

S="${WORKDIR}/libevent"

inherit subversion php-ext-source-r2 confutils

KEYWORDS="~amd64 ~x86"

DESCRIPTION="PHP libevent extension."
SLOT="0"
IUSE=""

DEPEND="
	>=dev-lang/php-5.1.3
	dev-libs/libevent
"
RDEPEND="${DEPEND}"

HOMEPAGE="http://pecl.php.net/package/libevent"
ESVN_REPO_URI="http://svn.php.net/repository/pecl/libevent/trunk/"
unset SRC_URI

src_unpack() {
	subversion_src_unpack
	cd "${S}"

	php-ext-source-r2_phpize
}

src_compile() {
	my_conf="--with-libevent"

	php-ext-source-r2_src_compile
}

src_install() {
	php-ext-source-r2_src_install
}
