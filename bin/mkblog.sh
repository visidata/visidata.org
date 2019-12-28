#!/bin/bash

set -e

WWWSRC=$(pwd)
BLOG=$WWWSRC/blog
BUILD=$WWWSRC/_blog

BIN=$WWWSRC/bin

TMPDIR=$(mktemp -d)

mkdir -p "$BUILD"

for fn in 404.html favicon.ico robots.txt vdlogo.png main.css; do
    cp -R "$WWWSRC"/static/"$fn" "$BUILD"/
done

source "$BIN"/mkpage.sh

build_page . "$BLOG"/index.md "Blog"
