#!/bin/bash

set -e  # stop script on error

### config env vars

# WWWSRC is already cloned visidata.org repo, with desired branch to build checked out
WWWSRC=$(pwd)

# SRC is already cloned visidata repo, with no modifications (other tags/branches will be checked out)
SRC="$WWWSRC"/visidata
export PYTHONPATH=$SRC:$SRC/visidata

# BUILD is output directory (corresponding to webroot)
BUILD="$WWWSRC"/_build

# VERSIONS (visidata release tags) to generate /docs/vX.Y.Z/
#    /docs itself will be branch already checked out
VERSIONS="v1.0 v1.1 v1.2 v1.3 v1.4 v1.5 develop"   # should be populated from tags/releases

### internal env vars

TMPDIR=$(mktemp -d)
BIN="$WWWSRC"/bin

mkdir -p "$BUILD"

# STATICFILES=404.html robots.txt main.css devotees.gpg.key vdlogo.png screenshot.png
cp -R "$WWWSRC"/static/* "$BUILD"/

source "$BIN"/mkpage.sh

function build_docs() {
    # $1 -> dest dir, relative to $BUILD (webroot), without leading /
    docdir=$BUILD/$1

    # build manpage
    mkdir -p "$BUILD"/man
    manhtml="$TMPDIR"/vd-man-inc.html
    echo '<section><pre id="manpage">' > "$manhtml"
    # <pre> max-width in main.css should be half of COLUMNS=###
    MAN_KEEP_FORMATTING=1 COLUMNS=1000 man "$SRC"/visidata/man/vd.1 | ul | aha --no-header >> "$manhtml"
    echo '</pre></section>' >> "$manhtml"
    "$BIN"/strformat.py body="$manhtml" title="VisiData Quick Reference" head="" < "$WWWSRC"/template.html > "$BUILD"/man/index.html

    # Create /man#options
    sed -i -e "s#<span style=\"font-weight:bold;\">COMMANDLINE</span> <span style=\"font-weight:bold;\">OPTIONS</span>#<span style=\"font-weight:bold;\"><a name=\"options\">OPTIONS</a></span>#g" "$BUILD"/man/index.html
    # Create /man#columns for columns sheet
    sed -i -e "s#<span style=\"font-weight:bold;\">Columns</span> <span style=\"font-weight:bold;\">Sheet</span> <span style=\"font-weight:bold;\">(Shift-C)</span>#<span style=\"font-weight:bold;\"><a name=\"columns\">Columns Sheet (Shift-C)</a></span>#g" "$BUILD"/man/index.html

    # build kblayout
    mkdir -p "$docdir"/kblayout
    "$BIN"/mklayout.py "$WWWSRC"/template.html "$SRC"/visidata/commands.tsv > "$docdir"/kblayout/index.html
    cp "$WWWSRC"/static/kblayout.css "$docdir"/kblayout/

    # build index
    if [ -d "$SRC/docs" ]; then
        SRCDOCS=$SRC/docs
        build_page "$1" "$SRCDOCS"/index.md "VisiData Documentation"
    else
        # up until v1.4 docs were located in $SRC/www/docs
        SRCDOCS=$SRC/www/docs
        build_page "$1" "$SRC"/www/docs.md "VisiData Documentation"
    fi

    for postpath in $(find $SRCDOCS -name '*.md'); do
        post=${postpath##$SRCDOCS}
        postname=${post%.md}
        build_page "$1"/"$postname" "$postpath" "$postname"
    done

    mkdir -p "$docdir"/casts
    cp "$SRCDOCS"/casts/* "$docdir"/casts
}

function build_blog() {
    # build index
    mkdir -p "$BUILD"/blog

    build_page blog "$BLOG"/index.md "vd log"

    for postpath in $(find "$BLOG" -name '*.md'); do
        post=${postpath##$BLOG}
        postname=${post%.md}
        build_page blog/"$postname" "$postpath" "$postname"
    done
}

build_page . "$WWWSRC"/index.md "VisiData"
build_page install "$WWWSRC"/install.md "Installation Instructions"
build_page privacy "$WWWSRC"/privacy.md "Privacy Policy"
build_page releases "$WWWSRC"/releases.md "Release History"
build_page credits "$WWWSRC"/credits.md "Credits and Contributions"
build_page formats "$WWWSRC"/formats.md "Supported Sources and Formats"
build_page v2.x "$WWWSRC"/v2.x.md "VisiData version 2.0"
build_page podcast "$WWWSRC"/podcast-transcript.md "Podcast"
build_blog


set +e

# /docs itself is built from current $SRC checkout
build_docs docs

for ver in $VERSIONS ; do
    echo "Building /docs/$ver"

    cd "$SRC" && git checkout "$ver"
    build_docs docs/"$ver"
done

