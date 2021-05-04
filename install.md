These packages all support csv, tsv, fixed-width text, json, and sqlite, at minimum.  Packages often support additional formats.

# MacOS

Install [brew](https://brew.sh) if necessary, and then:

    brew install saulpw/vd/visidata

## Linux

A `visidata` package is available in the package managers for many Linux distros, including:

~~~
apt install visidata
~~~

~~~
nix-env -i visidata
~~~

~~~
guix install visidata
~~~

Or install via the Python/pip method below.

# Windows

<!-- [Download Windows 64-bit .exe](/install/VisiData-v2.4.exe) (8MB)

Put this file on your desktop, and drop a .csv (or any other supported file format) onto it.

If you use VisiData a lot, you may want to buy [VisiData Max]() which can load Excel (xls) spreadsheets and Google Sheets and many other formats. -->

You can use [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/) (WSL) or install with the Conda or Python methods below.


## [Conda](https://docs.conda.io/projects/conda/en/latest/glossary.html#anaconda-glossary)

    conda install --channel conda-forge visidata

## Python

For the most up-to-date release, install [Python 3.6 or later](https://www.python.org/downloads/) and then:

    pip3 install visidata

## Unreleased Bleeding Edge

For the most recent changes in the development branch (not for the faint of heart):

    pip3 install git+https://github.com/saulpw/visidata.git@develop
