#!/bin/bash

set -e  # stop script on error

### config env vars

# SRC is already cloned visidata repo, with no modifications (other tags/branches will be checked out)
SRC=`pwd`/visidata

# WWWSRC is already cloned visidata.org repo, with desired branch to build checked out
WWWSRC=`pwd`

# BUILDWWW is output directory (corresponding to webroot)
BUILDWWW=$WWWSRC/_build

# VERSIONS (visidata release tags) to generate /docs/vX.Y.Z/
#    /docs itself will be branch already checked out
VERSIONS="v1.0 v1.1 v1.2 v1.3 v1.4 v1.5 develop"   # should be populated from tags/releases

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
    pandoc --from markdown_strict+table_captions+header_attributes+implicit_header_references+simple_tables+fenced_code_blocks+pipe_tables+fenced_divs -w html -o $fnbody $2
    $BINDIR/strformat.py body=$fnbody title="$3" head="" < $WWWSRC/template.html > $BUILDWWW/$1/index.html
    rm $fnbody
}

function build_docs() {
    # $1 -> dest dir, relative to $BUILDWWW (webroot), without leading /
    docdir=$BUILDWWW/$1

    # build manpage
    mkdir -p $BUILDWWW/man
    manhtml=$TMPDIR/vd-man-inc.html
    echo '<section><pre id="manpage">' > $manhtml
    # <pre> max-width in main.css should be half of COLUMNS=###
    MAN_KEEP_FORMATTING=1 COLUMNS=1000 man $SRC/visidata/man/vd.1 | ul | aha --no-header >> $manhtml
    echo '</pre></section>' >> $manhtml
    $BINDIR/strformat.py body=$manhtml title="VisiData Quick Reference" head="" < $WWWSRC/template.html > $BUILDWWW/man/index.html

    # Create /man/#loaders
    sed -i -e "s#<span style=\"font-weight:bold;\">SUPPORTED</span> <span style=\"font-weight:bold;\">SOURCES</span>#<span style=\"font-weight:bold;\"><a name=\"loaders\">SUPPORTED SOURCES</a></span>#g" $BUILDWWW/man/index.html
    # Create /man#edit for editing commands
    sed -i -e "s#<span style=\"font-weight:bold;\">Editing</span> <span style=\"font-weight:bold;\">Rows</span> <span style=\"font-weight:bold;\">and</span> <span style=\"font-weight:bold;\">Cells</span>#<span style=\"font-weight:bold;\"><a name=\"edit\">Editing Rows and Cells</a></span>#g" $docdir/man/index.html
    # Create /man#options
    sed -i -e "s#<span style=\"font-weight:bold;\">COMMANDLINE</span> <span style=\"font-weight:bold;\">OPTIONS</span>#<span style=\"font-weight:bold;\"><a name=\"options\">OPTIONS</a></span>#g" $BUILDWWW/man/index.html
    # Create /man#columns for columns sheet
    sed -i -e "s#<span style=\"font-weight:bold;\">Columns</span> <span style=\"font-weight:bold;\">Sheet</span> <span style=\"font-weight:bold;\">(Shift-C)</span>#<span style=\"font-weight:bold;\"><a name=\"columns\">Columns Sheet (Shift-C)</a></span>#g" $BUILDWWW/man/index.html

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
build_page releases $WWWSRC/releases.md "Release History"
build_page credits $WWWSRC/credits.md "Credits and Contributions"
build_page formats $WWWSRC/formats.md "Supported Sources and Formats"


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
