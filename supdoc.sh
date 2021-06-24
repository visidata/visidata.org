#!/bin/bash

set -e  # stop script on error
SRCDOCS=visidata/docs

function build_docs () {
 # build all individual /docs pages
    for postpath in $(find $SRCDOCS -name '*.md'); do
        post=${postpath##$SRCDOCS}
        postname=${post%.md}
        build_page "$1"/"$postname" "$postpath" "$postname"
    done
}

function build_page () {
    # $1 -> dest dir, relative to $BUILD (webroot), without leading /
    # $2 -> source md, full path
    # $3 -> page ittle (quoted for shell to give as single argument)
    mkdir -p "$BUILD"/"$1"
    fnbody=$(mktemp)
    pandoc --from markdown_strict+table_captions+header_attributes+implicit_header_references+simple_tables+fenced_code_blocks+pipe_tables+fenced_divs -w html -o "$fnbody" "$2"
    "$BIN"/strformat.py body="$fnbody" title="$3" head="" < "$WWWSRC"/template.html > "$BUILD"/"$1"/index.html
    rm "$fnbody"
}

build_docs
