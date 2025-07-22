---
layout: layouts/page
permalink: /install/
title: Install VisiData
---

## Install VisiData

These packages at minimum support csv, tsv, fixed-width text, json, and sqlite.
Some packages support additional formats.
Some formats will require [additional dependencies](/docs/formats/).

### All platforms - [Python](https://www.python.org/downloads/) v3.6 and above

Run this command (install [Python](https://www.python.org/downloads/) first if necessary):

```shell
pip3 install visidata
```

### MacOS

Run this command (install [brew](https://brew.sh) first if necessary):

```shell
brew install visidata
```

or

```shell
pipx install visidata
pipx inject visidata dependency
```

### Conda

Run this command (install [Anaconda](https://www.anaconda.com/products/distribution) first if necessary):

```shell
conda install --channel conda-forge visidata
```

### Windows

<!-- [Download Windows 64-bit .exe](/install/VisiData-v2.4.exe) (8MB)

Put this file on your desktop, and drop a .csv (or any other supported file format) onto it.

If you use VisiData a lot, you may want to buy [VisiData Max]() which can load Excel (xls) spreadsheets and Google Sheets and many other formats. -->

Use [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/) (WSL) or [MSYS2's Python](https://www.msys2.org/docs/python/).

### Linux

The `visidata` package is available in the package managers for these distributions:

- Debian (apt)
- [Fedora](https://packages.fedoraproject.org/pkgs/visidata/visidata/) (dnf)
- [NixOS](https://search.nixos.org/packages?type=packages&query=visidata) (nix-env)
- GNU Guix
- [Arch Linux](https://archlinux.org/packages/extra/any/visidata) (pacman)

## Update VisiData from an existing installation

Run this command to upgrade to the latest release:

```shell
pip install --upgrade visidata
```

Or, run this command to upgrade to the latest commit on the develop branch (may have intermittent issues; please file any bugs you find!):

```shell
pip install git+https://github.com/saulpw/visidata.git
```
