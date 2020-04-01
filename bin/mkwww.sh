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
VERSIONS="stable"   # should be populated from tags/releases

### internal env vars

TMPDIR=$(mktemp -d)
BIN="$WWWSRC"/bin
BLOG="$WWWSRC"/blog

mkdir -p "$BUILD"

# STATICFILES=404.html robots.txt main.css devotees.gpg.key vdlogo.png screenshot.png
cp -R "$WWWSRC"/static/* "$BUILD"/

source "$BIN"/mkpage.sh

function build_docs() {
    # $1 -> dest dir, relative to $BUILD (webroot), without leading /
    docdir=$BUILD/$1

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
    mkdir -p "$BUILD"/blog/assets/
    cp -R "$WWWSRC"/blog/assets/* "$BUILD"/blog/assets/

    build_page blog "$BLOG"/index.md "Blog"

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
build_page about "$WWWSRC"/about.md "Credits and Contributions"
build_page formats "$WWWSRC"/formats.md "Supported Sources and Formats"
build_page v2.x "$WWWSRC"/v2.x.md "VisiData version 2.0"
build_blog


set +e

# /docs itself is built from current $SRC checkout
cd $SRC && git checkout "stable"
build_docs docs

# add manpage
mkdir -p $BUILD/man
cp $WWWSRC/man/index.html $BUILD/man

for ver in $VERSIONS ; do
    echo "Building /docs/$ver"

    cd "$SRC" && git checkout "$ver"
    build_docs docs/"$ver"
done

# redirects
cp "$WWWSRC"/redirects.tsv "$BUILD"/_redirects
