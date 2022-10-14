---
title: Connect VisiData to SQL Databases with vdsql
date: 2022-10-14
tags:
    - blog
---



I have some big news today.

If you’ve used VisiData, you know it’s a super powerful tool for loading, parsing, and exploring tabular data.

Well, today we’re introducing **vdsql**, a fork of VisiData that you can connect *directly to your live databases* — pretty much any database that speaks SQL!

- BigQuery
- ClickHouse
- DuckDB
- MySQL
- PostgreSQL
- SQLite

You use VisiData in almost exactly the same way as before — the same commands, the same keyboard shortcuts — only instead of loading files into local memory, vdsql translates your commands into SQL queries, and relays those to your database. Those queries run server-side, and the results are sent back to VisiData.

Yes, this means you can explore your live databases — leveraging VisiData’s powerful transformations and aggregations — *without writing a line of SQL yourself.*

### Bigger Data, Faster

Since vdsql’s queries run server-side, you can work with much larger data sets — like your entire data warehouse.

There’s no longer any need to first export an extract for local analysis; just have vdsql to talk *directly* to your database, like so:

[EMBED TEASER VIDEO]

### Output

Once connected to your database, explore tables using the normal VisiData interface. When you’re done, you can save out the resulting queries as SQL (and eventually as Substrait or Python).

### Requirements

To run vdsql, you’ll first need to install Python 3.8 and `pip` (the Python package manager).  vdsql also depends on recent versions of VisiData and Ibis, but these will be installed automatically when you install vdsql.

### Installation

The short answer is:

`pip install vdsql`

**[Learn a bit more about how to install vdsql here.](https://github.com/visidata/vdsql/blob/develop/README.md#install-latest-release)** Note that only the SQLite and Clickhouse backends are installed by default; to connect to any of the other backends listed above, you’ll need to install the Ibis dependencies for each one separately, using (e.g. for MySQL):

`pip install ibis-framework[mysql]`

Once installed, you can use `vdsql` instead of `vd` whenever you want to query a database directly, instead of loading the database tables into memory first (as `vd` does with flat files).  Remember, `vdsql` to use a SQL connection; `vd` for in-memory processing.

Find all the details in the [CHANGELOG](https://github.com/visidata/vdsql/blob/develop/CHANGELOG.md).

### Why two different tools?

Why are we introducing vdsql (`vdsql`) as a separate tool from VisiData (`vd`)? Why not integrate this new, fancy, whiz-bang SQL connectivity directly into VisiData?

Great question.

The short answer is: This is all very, very new, and we want to make sure we do it right.

So, for now, vdsql is its own tool, separate from VisiData, and you have to install vdsql separately. But, that said, vdsql is also a VisiData plugin, so, once vdsql is installed, you can use it from within VisiData core — up to you.

As we continue to develop vdsql, it may become part of the VisiData core, at some point.

### Usage

Open a database like…

```bash
vdsql foo.sqlite  # or .sqlite3
vdsql mysql://...
vdsql postgres://...
vdsql foo.duckdb  # or .ddb
vdsql clickhouse://explorer@play.clickhouse.com:9440/?secure=1
vdsql bigquery:///bigquery-public-data
vdsql <file_or_url>
```

…where `file_or_url` is any connection string supported by `ibis.connect()` or any of the filetypes and options that VisiData itself supports.

### Super SQL-ly Sidebar

![vdsql screenshot](/blog/2022/assets/vdsql-screenshot-2022.jpg)

`vdsql` uses the VisiData sidebar (introduced in v2.9) to show the SQL query for the current view.

- To toggle the sidebar on/off, press `b`.
- To choose a sidebar option, press `zb`.
- To open the sidebar as its own sheet, press `gb`.

In this way you can compose a SQL expression using VisiData commands, open the SQL sidebar, and save the resulting query to a file (or copy it into your system clipboard buffer).

## What’s next for you?

- Share feedback with the team by [logging a GitHub issue](https://github.com/visidata/vdsql/issues)
- [Subscribe to the blog RSS feed](https://www.visidata.org/feed.xml) for updates
- [Become a patron](https://www.patreon.com/bePatron?u=13873753) to support this development work

## What’s next for vdsql?

First and foremost: We want to know what *you* want! [Submit a feature request on GitHub](https://github.com/visidata/vdsql/issues).

That said, here’s what *we* think are some important next steps:

- vdsql is powered by [Ibis](https://ibis-project.org/). While Ibis supports [other backends](https://ibis-project.org/docs/3.1.0/backends/), we haven’t tested them with vdsql yet. So we want to test and confirm support for:
    - Apache Impala
    - Dask
    - Datafusion
    - HeavyAI
    - PySpark
- Currently, the SQL that vdsql generates via Ibis is not optimized. The next version of Ibis will generate optimized SQL.
- We’d like to be able to write out the results of the expression as a data file (e.g. parquet or DuckDB).
- We think it could be really useful to be able to pass in an existing, saved SQL query from the CLI, right when launching VisiData. For example, something like: `vdsql <db> --sql startq.sql`

## Thanks

A special thanks to [Phillip Cloud](https://github.com/cpcloud) and [Anja Kefala](https://github.com/anjakefala) for their contributions to the project thus far!


