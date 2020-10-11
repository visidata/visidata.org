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

# VERSIONS (visidata release tags) to generate /docs/vX.Y.Z/ and /docs/api/vX.Y.Z
#    /docs itself will be stable branch
VERSIONS="v1.0 v1.1 v1.2 v1.3 v1.4 v1.5 develop stable"   # should be populated from tags/releases

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

    # build all individual /docs pages
    for postpath in $(find $SRCDOCS -name '*.md'); do
        post=${postpath##$SRCDOCS}
        postname=${post%.md}
        build_page "$1"/"$postname" "$postpath" "$postname"
    done

    mkdir -p "$docdir"/casts
    cp "$SRCDOCS"/casts/* "$docdir"/casts
}

function build_blog() {
    BLOG="$WWWSRC"/blog

    # setup assets
    mkdir -p "$BUILD"/blog/assets/
    cp -R "$WWWSRC"/blog/assets/* "$BUILD"/blog/assets/

    # build index
    build_page blog "$BLOG"/index.md "Blog"

    # build individual blog pages
    for postpath in $(find "$BLOG" -name '*.md'); do
        post=${postpath##$BLOG}
        postname=${post%.md}
        build_page blog/"$postname" "$postpath" "$postname"
    done
}

function build_api() {
    # up until v2.0, we did not have api docs
    if [ -d "$SRC"/docs/api ]; then
        docdir=$BUILD/$1
        mkdir -p "$docdir"
        # our api docs are built using sphinx
        sphinx-build -b html "$SRC"/docs/api "$docdir"
    fi
}

build_page . "$WWWSRC"/index.md "VisiData"
build_page install "$WWWSRC"/install.md "Installation Instructions"
build_page privacy "$WWWSRC"/privacy.md "Privacy Policy"
build_page releases "$WWWSRC"/releases.md "Release History"
build_page about "$WWWSRC"/about.md "Credits and Contributions"
build_page formats "$WWWSRC"/formats.md "Supported Formats"
build_page v2.x "$WWWSRC"/v2.x.md "VisiData version 2.0"
build_page limits "$WWWSRC"/limits.md "VisiData's Limits"
build_blog


set +e

# /docs and /docs/api themselves are built from stable
cd "$SRC" && git checkout "stable"
build_docs docs
build_api docs/api

# add manpage
mkdir -p "$BUILD"/man
cp "$WWWSRC"/man/index.html "$BUILD"/man

for ver in $VERSIONS ; do
    echo "Building /docs/$ver"

    cd "$SRC" && git checkout "$ver"
    build_docs docs/"$ver"

    build_api docs/"$ver"/api
done

# redirects
cp "$WWWSRC"/redirects.tsv "$BUILD"/_redirects
