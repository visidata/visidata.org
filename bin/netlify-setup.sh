installdir=$(pwd)/install
mkdir -p "$installdir"

# for building the manpage
export PATH=$PATH:/opt/buildhome/.local/bin
tar -xzf "$installdir"/aha_0.5.orig.tar.gz
cd aha-0.5 || exit
make
make install PREFIX=/opt/buildhome/.local


bin/mkwww.sh
