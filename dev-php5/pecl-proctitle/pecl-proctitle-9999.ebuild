EAPI=2

PHP_EXT_NAME="proctitle"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

S="${WORKDIR}/proctitle"

inherit subversion php-ext-source-r2 confutils

KEYWORDS="~amd64 ~x86"

DESCRIPTION="PHP proctitle extension."
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/php-5.2.0"
RDEPEND="${DEPEND}"

HOMEPAGE="http://pecl.php.net/package/proctitle"
ESVN_REPO_URI="http://svn.php.net/repository/pecl/proctitle/trunk/"
unset SRC_URI

src_unpack() {
	subversion_src_unpack
	cd "${S}"
}

src_compile() {
	my_conf="--enable-proctitle"

	php-ext-source-r2_src_compile
}

src_install() {
	php-ext-source-r2_src_install
}
