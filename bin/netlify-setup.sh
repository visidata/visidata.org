installdir=$(pwd)/install
mkdir -p "$installdir"

# for building the manpage
wget http://deb.debian.org/debian/pool/main/a/aha/aha_0.5.orig.tar.gz -O "$installdir"/aha_0.5.orig.tar.gz
tar -xzf "$installdir"/aha_0.5.orig.tar.gz
cd aha-0.5 || exit
make
make install PREFIX=/opt/buildhome/.local


bin/mkwww.sh
