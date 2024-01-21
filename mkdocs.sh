#!/usr/bin/env bash

SRCDOCS=./visidata/docs/
OUTDIR="${OUTDIR:=site/docs}"

for fn in $SRCDOCS*.md ; do
post=${fn##$SRCDOCS}
postname=${post%.md}
OUTFN=$OUTDIR/$postname.html
echo $OUTFN
./parsefrontmatter.py $fn $OUTFN $OUTFN-rest.md
pandoc --from markdown_strict+table_captions+header_attributes+implicit_header_references+simple_tables+fenced_code_blocks+pipe_tables+fenced_divs+footnotes -w html $OUTFN-rest.md -o - >> $OUTFN
done
