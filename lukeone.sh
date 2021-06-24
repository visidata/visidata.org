#!/usr/bin/env bash

SRCDOCS=visidata/docs/
post=${1##$SRCDOCS}
postname=${post%.md}
OUTFN=site/docs/$postname.njk
echo $OUTFN
./parsefrontmatter.py $1 $OUTFN $OUTFN-rest.md
pandoc --from markdown_strict+table_captions+header_attributes+implicit_header_references+simple_tables+fenced_code_blocks+pipe_tables+fenced_divs -w html $OUTFN-rest.md -o - >> $OUTFN
