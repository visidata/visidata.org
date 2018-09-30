#!/bin/bash

set -e  # stop script on error

### config env vars

# SRC is already cloned visidata repo, with no modifications (other tags/branches will be checked out)
SRC=~/git/visidata

# WWWSRC is already cloned visidata.org repo, with desired branch to build checked out
WWWSRC=~/git/www/visidata.org

# BUILDWWW is output directory (corresponding to webroot)
BUILDWWW=$WWWSRC/_build

# VERSIONS (visidata release tags) to generate /docs/vX.Y.Z/
#    /docs itself will be branch already checked out
VERSIONS="v1.0 v1.1 v1.2 v1.3 develop"   # should be populated from tags/releases

### internal env vars

TMPDIR=`mktemp -d`
BINDIR=$WWWSRC/bin
export PYTHONPATH=$SRC:$SRC/visidata

mkdir -p $BUILDWWW

# STATICFILES=404.html robots.txt main.css devotees.gpg.key vdlogo.png screenshot.png
cp -R $WWWSRC/static/* $BUILDWWW/

function build_page () {
    # $1 -> dest dir, relative to $BUILDWWW (webroot), without leading /
    # $2 -> source md, full path
    # $3 -> page title (quoted for shell to give as single arg)
    mkdir -p $BUILDWWW/$1
    fnbody=`mktemp`
#    pandoc -r markdown -w html -o $fnbody $2
    pandoc --from markdown_strict+table_captions+simple_tables+fenced_code_blocks -w html -o $fnbody $2
    $BINDIR/strformat.py body=$fnbody title="$3" head="" < $WWWSRC/template.html > $BUILDWWW/$1/index.html
    rm $fnbody
}

function build_docs() {
    # $1 -> dest dir, relative to $BUILDWWW (webroot), without leading /
    docdir=$BUILDWWW/$1

    # build manpage
    mkdir -p $docdir/man
    manhtml=$TMPDIR/vd-man-inc.html
    echo '<section><pre id="manpage">' > $manhtml
    # <pre> max-width in main.css should be half of COLUMNS=###
    MAN_KEEP_FORMATTING=1 COLUMNS=120 man $SRC/visidata/man/vd.1 | ul | aha --no-header >> $manhtml
    echo '</pre></section>' >> $manhtml
    $BINDIR/strformat.py body=$manhtml title="VisiData Quick Reference" head="" < $WWWSRC/template.html > $docdir/man/index.html

    # build kblayout
    mkdir -p $docdir/kblayout
    $BINDIR/mklayout.py $WWWSRC/template.html $SRC/visidata/commands.tsv > $docdir/kblayout/index.html
    cp $WWWSRC/static/kblayout.css $docdir/kblayout/

    # build index
    if [ -d "$SRC/docs" ]; then
        SRCDOCS=$SRC/docs
        build_page $1 $SRCDOCS/index.md "VisiData Documentation"
    else
        # up until v1.4 docs were located in $SRC/www/docs
        SRCDOCS=$SRC/www/docs
        build_page $1 $SRC/www/docs.md "VisiData Documentation"
    fi

    for postpath in `find $SRCDOCS -name '*.md'`; do
        post=${postpath##$SRCDOCS}
        postname=${post%.md}
        build_page $1/$postname $postpath "$postname"
    done

    mkdir -p $docdir/casts
    cp $SRCDOCS/casts/* $docdir/casts
}

build_page . $WWWSRC/index.md "VisiData"
build_page install $WWWSRC/install.md "Installation Instructions"
build_page privacy $WWWSRC/privacy.md "Privacy Policy"
build_page releases $WWWSRC/releases.md "Releases"

set +e

# /docs itself is built from current $SRC checkout
build_docs docs

for ver in $VERSIONS ; do
    echo "Building /docs/$ver"

    cd $SRC && git checkout $ver
    build_docs docs/$ver
done

#### At the end
# add analytics to .html files
for fn in `find $BUILDWWW -name '*.html'` ; do
    sed -i -e "/<head>/I{r $WWWSRC/analytics.thtml" -e 'd}' $fn
done
