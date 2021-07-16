---
title: The implications of tabular data architecture
date: 2020-06-18
tags:
    - blog
---

A known bug in VisiData ([#413](https://github.com/saulpw/visidata/issues/413)) is that the contents of `SettableColumn`s created with `addcol-*` are not able to be yanked (copied to VisiData's internal clipboard).

![settable](/blog/assets/2020-settable-screenshot.png)

The reason behind why this happens illuminates something significant behind VisiData's architecture.

There are two main ways table data can be organized: **row-major** and **column-major**.
Row-major keeps each row together, whereas column-major keeps each column together.
SQL databases are an example of a row-major data analysis tool (if they support row-level locking).
Python pandas is an example of a column-major library.

Users might intuitively feel like VisiData is column-major, since it has so many [column-centric commands](/docs/columns), but architecturally it's actually row-major. 
This is so we can use objects as rows, and also have heterogenous column values.
You can toss around bulk row references like they're nothing.
Operations like load and filter are really fast.

`SettableColumn` (and other columns which store data inside themselves "about" rows) is column-major, and so the distinctions are blurred.
It does happen to work pretty well for most things, but it's trepidacious and kind of off-label.

This is the fundamental issue behind [#413](https://github.com/saulpw/visidata/issues/413) and why it can't be fixed.

This is also why working with the pandas loader (or any columnar store like raw parquet files) can be tricky.
You have the hammering of row-oriented semantics around a lower level functionality or storage layer that is fundamentally column-oriented.
It's awkward and carries a stiff performance penalty.
VisiData is designed for loading and filtering over aggregating and saving.

In the future, perhaps pandas should be a completely different kind of **Sheet**.
A **TableSheet** would actually be the row-oriented sheet, and there's another **ColumnSheet** that's column-oriented.
Operations would be implemented differently, and maybe different ones would be available.

However, in the meanwhile, with this awareness we can make cleaner choices within VisiData, and understand other implications this can have for different loaders and commands.

[Written by Saul Pwanson 2020-06-17]
[Edited by Anja Boskovic 2020-06-17]
