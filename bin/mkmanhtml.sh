#!/bin/bash

set -e
set -x

TMPDIR=$(mktemp -d)
WWWSRC=$(pwd)
SRC="$WWWSRC"/visidata
export PYTHONPATH=$SRC:$SRC/visidata
BIN="$WWWSRC"/bin

function build_man() {
    # build manpage
    manhtml="$TMPDIR"/vd-man-inc.html
    echo '<section><pre id="manpage">' > "$manhtml"
    # <pre> max-width in main.css should be half of COLUMNS=###
    MAN_KEEP_FORMATTING=1 COLUMNS=1000 man "$SRC"/visidata/man/vd.1 | ul | aha --no-header >> "$manhtml"
    echo '</pre></section>' >> "$manhtml"
    "$BIN"/strformat.py body="$manhtml" title="VisiData Quick Reference" head="" < "$WWWSRC"/template.html > $WWWSRC/man/index.html
}

build_man
