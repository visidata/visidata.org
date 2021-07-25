---
title: 10 Ways to Use VisiData
date: 2021-07-24
tags:
    - blog
---

## 1. Explore datasets effortlessly, no matter the format

    $ vd albums.json dropbox/*.xls* agents.sqlite

Use the arrow keys to move around and `q` to quit.

VisiData loads data from [many different sources and formats](/formats), including [anything pandas can load](https://pandas.pydata.org/pandas-docs/stable/reference/io.html)!

New loaders are included in every release, and [you can create one yourself easily](/docs/loaders).

&nbsp;

## 2. Convert from any input format into any output format

    $ vd -b input.csv -o output.json

## 3. Interactively select replacement for cli tools

    $ mv $(ls | vd) /trash

Select files using [any of the selection commands](https://visidata.org/docs/rows).

Press `"` to pull them into their own sheet.

Press `Ctrl+Q` to exit VisiData and write the current sheet to stdout.

&nbsp;

## 4. Scrape HTML table data from a webpage

    $ vd https://en.wikipedia.org/wiki/List_of_largest_cities

## 5. Parse and explore text-based log files

    $ vd output.log

Use `:` to split each line by some string.

Use `;` with a regex with capture groups like `(\d+)`.

&nbsp;

## 6. Explore a Python object from the REPL

    >>> visidata.pyobj.view(obj)

## 7. Explore any pandas DataFrame

    >>> visidata.view_pandas(df)

## 8. Create an adhoc data pipeline

    $ vd -b -p foo.vd

VisiData can also be used in batch mode with [scripts](/docs/save-restore/) without requiring any interaction.

Save the cmdlog to a .vd file with `Ctrl+D foo.vd`, then replay the saved .vd file:

&nbsp;

## 9. rename a bunch of files

    $ vd <directory>

Edit the filenames [(documentation on editing commands)](/docs/edit).
Press `z Ctrl+S` to commit the changes (before v2.0, use `Ctrl+S`).

Watch [this video showing how to use the directory browser](https://www.youtube.com/watch?v=l2Bpmm0yAGw).

&nbsp;

## 10. see all the available options and commands

There are many other ways to use VisiData!  To learn more, press `Ctrl+H` to see the [manpage](/man), or `z Ctrl+H` to see the full list of commands available on the current sheet.

&nbsp;

---

- [written by Saul Pwanson 2019-03-24]
- [updated on 2020-10-15]
- [updated on 2021-07-24]
