#!/bin/bash

set -e

WWWSRC=$(pwd)
BLOGWWW=$WWWSRC/blog
BUILDWWW=$WWWSRC/_blog

BINDIR=$WWWSRC/bin

TMPDIR=$(mktemp -d)

mkdir -p $BUILDWWW

cp -R $WWWSRC/static/404.html $BUILDWWW/
cp -R $WWWSRC/static/favicon.ico $BUILDWWW/
cp -R $WWWSRC/static/robots.txt $BUILDWWW/
cp -R $WWWSRC/static/vdlogo.png $BUILDWWW/
cp -R $WWWSRC/static/main.css $BUILDWWW/

function build_page () {
    # $1 -> dest dir, relative to $BUILDWWW (webroot), without leading /
    # $2 -> source md, full path
    # $3 -> page title (quoted for shell to give as single arg)
    mkdir -p $BUILDWWW/$1
    fnbody=$(mktemp)
    pandoc --from markdown_strict+table_captions+header_attributes+implicit_header_references+simple_tables+fenced_code_blocks+pipe_tables+fenced_divs -w html -o $fnbody $2
    $BINDIR/strformat.py body=$fnbody title="$3" head="" < $WWWSRC/template.html > $BUILDWWW/$1/index.html
    rm $fnbody
}

build_page . $BLOGWWW/index.md "Blog"
