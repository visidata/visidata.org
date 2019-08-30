# setup visidata submodule
git submodule update --init --recursive

# for building the manpage
apt-get install -y aha

# pandoc - for building all docs
wget https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-1-amd64.deb
dpkg -i pandoc-2.7.3-1-amd64.deb

# cleanup
rm pandoc-2.7.3-1-amd64.deb
