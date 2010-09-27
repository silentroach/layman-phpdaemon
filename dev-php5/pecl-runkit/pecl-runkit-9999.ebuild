EAPI="2"

PHP_EXT_NAME="runkit"
PHP_EXT_PECL_PKG="RUNKIT"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

MY_P="${PHP_EXT_PECL_PKG}-${PV}"
S="${WORKDIR}/${MY_P}"

inherit git php-ext-source-r1 confutils

KEYWORDS="~x86"

DESCRIPTION="PHP runkit extension."
SLOT="0"
IUSE="modify super sandbox"

DEPEND=">dev-lang/php-4.0"
RDEPEND="${DEPEND}"

HOMEPAGE="http://github.com/zenovich/runkit"
EGIT_REPO_URI="git://github.com/zenovich/runkit.git"
unset SRC_URI

need_php_by_category

src_unpack() {
	git_src_unpack
	cd "${S}"

	php-ext-source-r1_phpize
}

src_configure() {
	my_conf="--enable-runkit"

	enable_extension_enable "runkit-modify" "modify" 0
	enable_extension_enable "runkit-super" "super" 0
	enable_extension_enable "runkit-sandbox" "sandbox" 0
}

src_compile() {
	php-ext-source-r1_src_compile
}

src_install() {
	php-ext-source-r1_src_install
}
