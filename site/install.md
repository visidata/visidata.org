---
layout: layouts/page
permalink: /install/
title: Install VisiData
---

# Install VisiData

These packages at minimum support csv, tsv, fixed-width text, json, and sqlite.
Some packages support additional formats.
Some formats will require [additional dependencies](/docs/formats/).

## All platforms - [Python](https://www.python.org/downloads/) v3.6 and above

1. Install [Python](https://www.python.org/downloads/) if necessary

2. Run this command:

    pip3 install visidata


## MacOS

1. Install [brew](https://brew.sh) if necessary.

2. Run this command:

    brew install saulpw/vd/visidata

## Conda

    conda install --channel conda-forge visidata

## Windows

<!-- [Download Windows 64-bit .exe](/install/VisiData-v2.4.exe) (8MB)

Put this file on your desktop, and drop a .csv (or any other supported file format) onto it.

If you use VisiData a lot, you may want to buy [VisiData Max]() which can load Excel (xls) spreadsheets and Google Sheets and many other formats. -->

You can use [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/) (WSL) or use the Conda or Python method above.

## Linux

The `visidata` package is available in the package managers for these distributions:

    - Debian (apt)
    - [NixOS](https://github.com/NixOS/nixpkgs/issues/48852) (nix-env)
    - GNU Guix
    - [Arch Linux](https://archlinux.org/packages/community/any/visidata) (pacman)


# Update VisiData {#update} from an existing installation

Run this command to upgrade to the latest release:

    pip install --upgrade visidata

Or, run this command to upgrade to the latest commit on the develop branch (may have intermittent issues; please file any bugs you find!):

    pip install git+https://github.com/saulpw/visidata.git
