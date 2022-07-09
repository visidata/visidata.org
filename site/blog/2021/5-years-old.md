---
title: VisiData Turns 5
date: 2021-10-29
tags:
    - blog
---

Today, we celebrate 5 years of VisiData.  In honor of the occasion, I thought I'd put together a little retrospective, and some thoughts on what the future might hold.

# What is VisiData?

VisiData is an *interactive tabulator*.  Like [VisiCalc](https://en.wikipedia.org/wiki/VisiCalc) is an interactive calculator, and [vim](https://en.wikipedia.org/wiki/Vim_(text_editor)) is an interactive text editor.
It's the ultimate tool for dealing with tabular data: exploring, cleaning, analyzing, and transmuting.
VisiData is not a spreadsheet, where cells are the first-class elements.  However, it *can* load and interact with data in spreadsheet format, and many other formats too, even some things you might not think of at first: like filesystem metadata and API results and packet captures.
Because **everything is data**.

## Where are we now?

As of October 2021, 5 years after its conception in October 2016, VisiData now has ~15k lines of Python code, some thousands of regular users, and is frequently mentioned wherever people talk about tabular data tools and/or the terminal.
Its architecture for working with row/column data is powerful, and the interface is remarkably flexible and ergonomic for experienced users.
VisiData has been called "delightful", ["amazing"](https://www.reddit.com/r/vim/comments/kf4wgb/visidata_a_cool_vimlike_tool_for_examining_and/), and say they ["love"](https://twitter.com/AlexNetoGeo/status/1451327794860941319) it.
My favorite response (as for most of my work) is ["holy shit"](https://twitter.com/hillelogram/status/1252827658745860096).

# How did we get here?

I've been working on VisiData since October 2016, and in the beginning, there was only one user (me).

The first "release" was [v0.14 to r/Python](https://www.reddit.com/r/Python/comments/5ct5kd/visidata_a_curses_interface_for_exploration_of/) in November 2016 but no one noticed.  Then in December I shared [v0.37 to r/pystats](https://www.reddit.com/r/pystats/comments/5hpph6/please_help_test_my_new_cursestextmode_data/), which got a bit more attention, but was [scorned for not having any tests](https://www.reddit.com/r/pystats/comments/5hpph6/please_help_test_my_new_cursestextmode_data/db30878/).

Back then it was a single [1000-line script](https://github.com/saulpw/visidata/blob/v0.31/bin/vd) that had loaders for csv, json, xlsx, hdf5, and could already create frequency tables and join sheets.  Many people would be quite happy with just this functionality.

I kept going.

## 2017: pre-v1

After only a few months, VisiData was already incredibly useful.  But I had a lot more ideas, so in 2017 I worked on VisiData extensively, always thinking a 1.0 was just around the corner.
The first major release prior to v1.0 was in June 2017, and made it to the top of Hacker News.

I didn't have firm criteria for "version 1.0" was, I just knew I didn't want it to be a
[version 0](https://0ver.org/) project forever.  I mainly wanted 1.0 to be robust and useful without
major maintainance.

## 2018: v1 era

In Jan 2018, I released version 1.0, and then took a step back.
Shortly after 1.0 I started getting some basic usage data.
I kept plugging away at it, and Anja (who I met at the [Recurse Center](https://recurse.com) in 2017) became involved in the project.
Jeremy Singer-Vine, who had discovered VisiData the year before, wrote the excellent [Introduction to VisiData tutorial](https://jsvine.github.io/intro-to-visidata/).

## 2019: v1.5.2 era

At the end of 2018 I took a [full-time job](https://cionic.com), so in January of 2019 we [released a "final" v1.5.2](https://www.visidata.org/blog/2019/v1.5.2/) which was very reliable, and it was the last official release for almost 2 years.

During 2019 I worked full-time, but still added functionality to VisiData on the side, or as I needed features for my paid work.  These stayed in the develop branch, and only used by a handful of dedicated users.

## 2020: pre-v2 era

I wanted to clean up some elements of the API but I was aware of the responsibilities of maintaining a stable platform.
So I let the develop branch accumulate changes, and we only made some internal beta releases.

Then 2020 happened, and I stopped working full-time to keep things together.
Anja and I put a bunch of effort into cleaning up the API, and we [released v2.0](https://www.visidata.org/blog/2020/v2.0/) in October 2020.

## 2021: v2 era

In 2021, we've continued to put out new releases every few months.
In September, v2.6 introduced the menu system.

Earlier in the year, the [Devottys](https://github.com/devottys/) and I released the [xdplayer](https://github.com/devottys/xdplayer) terminal crossword player and [DarkDraw](https://github.com/devottys/darkdraw) (a Unicode drawing tool).

I also reorganized most of my VisiData addons into [VisiData Plus](https://github.com/visidata/vdplus).

# The Future of VisiData

According to [Lindy's Law](https://en.wikipedia.org/wiki/Lindy_effect), the life expectancy of software is proportional to its age.
So now that VisiData has been around for 5 years, we can look forward to and plan for another 5 years.

## More Usability and Teachability

Like many powertools, VisiData has so much functionality that it can be offputting to new users.  Even though a handful of commands would already provide a large amount of power and flexibility, new users often bounce off of it because it just seems overwhelming.

So a major and ongoing effort, is to make VisiData even easier to use, while not degrading the experience for power users, and in fact guiding new users into becoming power users without a lot of effort.  The new menu system in [v2.6](https://www.visidata.org/blog/2021/v2.6/) is a big step towards better discoverability.  Next on the list will be a sidebar for "wizard" commands like join, group, and plot; a more holistic and guided fancy chooser.


## Bigger Data

VisiData is great for dealing with a few million rows of data.  But more than that, and it starts to buckle.  Modern hardware and databases can readily work with 100 million rows on a single machine if they are stored and accessed correctly.  In the next few years, VisiData will be able to access these larger datasets without having to load everything into memory.  Imagine being able to browse a BigQuery table using `Shift+F` for a Frequency Sheet and `Enter` to dive into a subset, and then copying the resulting SQL into a notebook!

## Bonkers Plugins

Like Emacs is to text, VisiData is to tables.  If my wildest ambitions were fulfilled, VisiData would be the solution in the following analogy:

    Emacs : text : Lisp :: VisiData : tables : Python

and with that in mind, there's lots of room to grow!

## Absurd Amounts of Polish

As always, what makes VisiData so great to use, is the absurd amount of polish and attention to detail.  One by one, we find the frictions and try to remove them.  The minor inconsistencies.  The edge cases.  The little things that are deemed "not worth it" in most software.

# Here's to another 5 years of VisiData!

Thanks again to our current corporate sponsors [October Swimmer](https://www.octoberswimmer.com/) and [General UI](https://genui.com), and to all of the people who have contributed to make VisiData awesome!
