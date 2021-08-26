---
layout: layouts/page
permalink: /install/
title: Install VisiData
---

These packages all support csv, tsv, fixed-width text, json, and sqlite, at minimum.  Packages often support additional formats. Some formats will require [additional dependencies](/docs/formats/).

## Windows

<!-- [Download Windows 64-bit .exe](/install/VisiData-v2.4.exe) (8MB)

Put this file on your desktop, and drop a .csv (or any other supported file format) onto it.

If you use VisiData a lot, you may want to buy [VisiData Max]() which can load Excel (xls) spreadsheets and Google Sheets and many other formats. -->

You can use [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/) (WSL) or use the Conda or Python methods below.

## MacOS

Install [brew](https://brew.sh) if necessary, and then run:

    brew install saulpw/vd/visidata

## Linux - Debian/Ubuntu

    apt install visidata

## Linux - [NixOS](https://github.com/NixOS/nixpkgs/issues/48852)

    nix-env -i visidata

## Linux - GNU Guix

    guix install visidata

## Conda

    conda install --channel conda-forge visidata

## [Python](https://www.python.org/downloads/) v3.6+

    pip3 install visidata

## Unreleased Bleeding Edge

Using Pip:

    pip3 install git+https://github.com/saulpw/visidata.git@develop

Using Guix:

    guix install --without-tests=visidata --with-git-url=visidata=https://github.com/saulpw/visidata.git --with-branch=visidata=develop visidata
