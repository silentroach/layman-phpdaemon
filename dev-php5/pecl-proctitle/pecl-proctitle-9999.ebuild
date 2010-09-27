PHP_EXT_NAME="proctitle"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

S="${WORKDIR}/proctitle"

inherit subversion php-ext-source-r1 confutils

KEYWORDS="~x86"

DESCRIPTION="PHP proctitle extension."
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/php-5.2.0"
RDEPEND="${DEPEND}"

HOMEPAGE="http://pecl.php.net/package/proctitle"
ESVN_REPO_URI="http://svn.php.net/repository/pecl/proctitle/trunk/"
unset SRC_URI

need_php_by_category

src_unpack() {
	subversion_src_unpack
	cd "${S}"

	php-ext-source-r1_phpize
}

src_compile() {
	my_conf="--enable-proctitle"

	php-ext-source-r1_src_compile
}

src_install() {
	php-ext-source-r1_src_install
}
