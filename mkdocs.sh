#!/usr/bin/env bash

SRCDOCS=./visidata/docs/

for fn in $SRCDOCS*.md ; do
post=${fn##$SRCDOCS}
postname=${post%.md}
OUTFN=site/docs/$postname.html
echo $OUTFN
./parsefrontmatter.py $fn $OUTFN $OUTFN-rest.md
pandoc --from markdown_strict+table_captions+header_attributes+implicit_header_references+simple_tables+fenced_code_blocks+pipe_tables+fenced_divs -w html $OUTFN-rest.md -o - >> $OUTFN
done