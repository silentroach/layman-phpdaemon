PHP_EXT_NAME="runkit"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

S="${WORKDIR}/runkit-${PV}"

inherit php-ext-source-r1 confutils

KEYWORDS="amd64 x86"

DESCRIPTION="PHP runkit extension."
SLOT="0"
IUSE="modify super sandbox"

DEPEND=">dev-lang/php-4.0"
RDEPEND="${DEPEND}"

HOMEPAGE="http://github.com/zenovich/runkit"
SRC_URI="http://github.com/downloads/zenovich/runkit/runkit-${PV}.tgz"

need_php_by_category

src_compile() {
    my_conf="--enable-runkit"

    enable_extension_enable "runkit-modify" "modify" 0
    enable_extension_enable "runkit-super" "super" 0
    enable_extension_enable "runkit-sandbox" "sandbox" 0

    php-ext-source-r1_src_compile
}

src_install() {
    php-ext-source-r1_src_install
}
