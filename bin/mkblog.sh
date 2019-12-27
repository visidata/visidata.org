#!/bin/bash

set -e

WWWSRC=$(pwd)
BLOGWWW=$WWWSRC/blog
BUILD=$WWWSRC/_blog

BIN=$WWWSRC/bin

TMPDIR=$(mktemp -d)

mkdir -p $BUILD

cp -R $WWWSRC/static/404.html $BUILD/
cp -R $WWWSRC/static/favicon.ico $BUILD/
cp -R $WWWSRC/static/robots.txt $BUILD/
cp -R $WWWSRC/static/vdlogo.png $BUILD/
cp -R $WWWSRC/static/main.css $BUILD/

source "$BIN"/mkpage.sh

build_page . $BLOGWWW/index.md "Blog"
