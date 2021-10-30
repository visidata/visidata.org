---
title: VisiData Turns 5
date: 2021-10-29
tags:
    - history
---

Today, we celebrate 5 years of VisiData.  In honor of the occasion, I thought I'd put together a little retrospective, and some thoughts on what the future might hold.

# What is VisiData?

VisiData is an *interactive tabulator*.  Like [VisiCalc](https://en.wikipedia.org/wiki/VisiCalc) is an interactive calculator, and [vim](https://en.wikipedia.org/wiki/Vim_(text_editor)) is an interactive text editor.
It's the ultimate tool for dealing with tabular data: exploring, cleaning, analyzing, and transmuting.
VisiData is not a spreadsheet, where cells are the first-class elements.  However, it *can* load and interact with data in spreadsheet format, and many other formats too, even some things you might not think of at first: like filesystem metadata and API results and packet captures.
Because **everything is data**.

# History

I've been working on VisiData since Oct 2016, and in the beginning, there was only one user (me).
Back then it was a single [1000-line script](https://github.com/saulpw/visidata/blob/v0.31/bin/vd) that already had loaders for json, xlsx, hdf5, and could already do frequency tables and join sheets.  Already very recognizable.

The first "release" was [v0.14 to r/Python](https://www.reddit.com/r/Python/comments/5ct5kd/visidata_a_curses_interface_for_exploration_of/) in November 2016 but no one noticed.  Then in December I shared [v0.37 to r/pystats](https://www.reddit.com/r/pystats/comments/5hpph6/please_help_test_my_new_cursestextmode_data/), which got a bit more attention, but was [scorned for not having any tests](https://www.reddit.com/r/pystats/comments/5hpph6/please_help_test_my_new_cursestextmode_data/db30878/).

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
I kept plugging away at it, and Anja (who I met at the [Recurse Center](https://recurse.com in 2017) became involved in the project.
Jeremy Singer-Vine, who had discovered VisiData the year before, wrote the excellent [Introduction to VisiData tutorial](https://jsvine.github.io/intro-to-visidata/).

## 2019: v1.5.2 era

At the end of 2018 I took a [full-time job](https://cionic.com), so in January of 2019 we [released a "final" v1.5.2](https://www.visidata.org/blog/2019/v1.5.2/) which was very reliable, and it was the last official release for almost 2 years.

Here's what VisiData usage looked like for the first 2.5 years of its existence: from 40 weekdaily users in early 2018, to almost 100 in mid-2019.

  ![graph of usage from 2016-10-29 2019-04-29, y=0-125](/blog/assets/vd-usage-2.5y-125.png)

During 2019 I worked full-time, but still added functionality to VisiData on the side, or as I needed features for my paid work.  These stayed in the develop branch, and only used by a handful of dedicated users.

## 2020: pre-v2 era

I wanted to clean up some elements of the API but I was aware of the responsibilities of maintaining a stable platform.
So I let the develop branch accumulate changes, and we only made some internal beta releases.

Then 2020 happened, and I stopped working full-time to keep things together.
Anja and I put a bunch of effort into cleaning up the API, and we [released v2.0](https://www.visidata.org/blog/2020/v2.0/) in October 2020.

## 2021 (now): v2 era

In 2021, we've continued to put out new releases every few months.
The [Devottys](https://github.com/devottys/) and I released the [xdplayer](https://github.com/devottys/xdplayer) terminal crossword player) and [DarkDraw](https://github.com/devottys/darkdraw) (a terminal drawing tool).
I reorganized most of my VisiData addons into [VisiData Plus](https://github.com/visidata/vdplus).

Here's what the usage graph looks like now:

  ![graph of usage from 2016-10-29 2021-10-29, y=0-500](/blog/assets/vd-usage-5y.png)

In the last 3.5 years (since getting usage data), usage has grown ~10x (from 30-300+ users), which is about double each year.

This [usage data](https://visidata.org/usage.tsv) gives us some good information about the [open source contributor funnel](https://mikemcquaid.com/2018/08/14/the-open-source-contributor-funnel-why-people-dont-contribute-to-your-open-source-project/).  In VisiData's case, it breaks down this way:

- ~3000 monthly users
- ~300 daily users
- ~30 community members
- ~3 regular contributors

## tl;dr: the present

In short, VisiData now has some ~15k lines of code, some thousands of regular users, and is frequently mentioned wherever people talk about tabular data tools and/or the terminal.
Its architecture for working with row/column data is powerful, and the interface is remarkably flexible and ergonomic for experienced users.
Users regularly call VisiData "delightful", ["amazing"](https://www.reddit.com/r/vim/comments/kf4wgb/visidata_a_cool_vimlike_tool_for_examining_and/), and say they ["love"](https://twitter.com/AlexNetoGeo/status/1451327794860941319) it.  My favorite response (as for most of my work) is ["holy shit"](https://twitter.com/hillelogram/status/1252827658745860096).

# The Future of VisiData

## Usage Growth

As per Conway's Law, things are likely to last about as long as they've already lasted.
So now that we celebrate 5 years, we can look forward and plan for another 5 years.

  ![graph of usage from 2016-10-29 2026-10-29, y=0-2000](/blog/assets/vd-usage-10y-2000.png)

What will VisiData usage look like in 5 years?   If it continues to double every year, then in 5 years that would be 32x; possibly exceeding 10,000 daily users!  That seems a little excessive.  But there are millions of terminal users and millions of Python users and millions of data professionals who could benefit from a quick dive into a new dataset and whip it into what they need, so it's not impossible.

Also, even though it seems unlikely looking at the graph above (whose axes would show only a 4x growth over 5 years), consider this graph, which is the view from 2019, at 2.5 years, looking ahead 2.5 years, with the axes extrapolated 4x out to today:

  ![graph of usage from 2016-10-29 2019-04-29, y=0-500](/blog/assets/vd-usage-2.5y-500.png)

Its growth to today would have seemed as unlikely then, and yet here we are.

## More Usability and Teachability

## Bigger Data

VisiData is great for dealing with a few million rows of data.  But more than that, and it starts to buckle.  Modern hardware and databases can readily work with 100 million rows on a single machine if they are stored and accessed correctly.  In the next few years, VisiData will be able to access these larger datasets without having to load everything into memory.  Imagine being able to browse a BigQuery table using Shift+F for a Frequency Sheet and Enter to dive into a subset, and then copying the resulting SQL into a notebook!

## Bonkers Plugins

Like Emacs is to text, VisiData is to tables.  If my wildest ambitions were fulfilled, VisiData would be the solution in the following analogy:

    Emacs : text : Lisp :: VisiData : tables : Python

and with that in mind, there's lots of room to grow!

## Absurd Amounts of Polish

As always, what makes VisiData so great to use, are the absurd amount of polish and attention to detail.  One by one, we find the frictions and try to remove them.  The minor inconsistencies.  The edge cases.  The little things that are deemed "not worth it" in most software.

# How can I contribute?

If you're a fan of VisiData and related tools, there are many ways you can help get VisiData to the next level.
In order from least to most amount of effort/investment:

## Give me money

I haven't yet paid myself an income from the money I get from Patreon.  It all goes into a separate Pwanson & Pwanson account, and I use that money to hire contractors (like [Luke Plant](https://luke.work) for the recent [visidata.org redesign](https://www.visidata.org/blog/2021/redesign-2021/), and to fund experiments (like a prototype "web version" from [Tom Buckley-Houston](https://tombh.co.uk) of [brow.sh](https://brow.sh) fame.

So if you want to contribute in a simple way, you can [subscribe to my Patreon](https://patreon.com/saulpw).
If you are using VisiData daily in your paid work, I suggest $20/month (less than a dollar per workday).
If every daily VisiData user subscribed at this level, then it would be a sustainable part-time income.
Not exactly striking it rich, but VisiData could go some pretty interesting directions if I could focus on it
without stressing about money or working a full-time software job.

If you are part of a corporation with a marketing budget, you could lobby them to become a [corporate sponsor](https://github.com/sponsors/saulpw).

And of course a big thanks to our current corporate sponsors [October Swimmer](https://www.octoberswimmer.com/) and [General UI](https://genui.com)!

## Join the Community

### Report bugs and discuss use cases


If you find something that seems amiss, [file an issue](https://github.com/saulpw/visidata/issues).
If you have a use case but can't figure out how to do it, [start a discussion](https://github.com/saulpw/visidata/discussions).
If you found the documentation lacking or misleading, [propose a better way to say it]().
If you want to chat more casually with us and other VisiData users, join [Discord](https://visidata.org/chat) or [IRC](https://libera.chat/#visidata),

This is how we get that absurd amount of polish!

## Talk it up

Money is great, but even more useful is growing the userbase.  More users means a larger community which means more direct (and indirect) contributors.

My goal is to see if we can get VisiData to 10x usage over the next 5 years.
This is ambitious, as very few terminal tools have tens of thousands of users, but I think VisiData is useful enough to be in the "canon" of everyday software tools.
If it reaches this level, chances are much greater that it will continue to exist even if I myself stop working on it entirely.
The community should take on a life of its own (this is already starting to some extent, but still requires my input).
And once VisiData has been around and stable for 10 years and has a healthy self-sustaining community, [maybe Julia Evans will make a zine about it](https://twitter.com/b0rk/status/1229860328139296768).

So what can you do specifically?

### Say nice things on the internet (Twitter, Reddit, Hacker News, etc).

I love seeing people talking about VisiData, especially their own specific use cases and experiences.  You can mention @VisiData on Twitter, or visidata.org anywhere.

### Mention VisiData as a way for people to solve specific data problems.

Post or comment on StackOverflow, reddit, and other forums where people ask about how to accomplish some data goal.
If other people describe solutions with tools like Excel or Pandas, you can mention a quick hack with VisiData that might be easier.  This is especially effective when a 10-line Python script can be distilled into a handful of keystrokes.

Bonus points if it's on a forum for another data tool.  Double bonus points if it's a commercial data tool.  (But please abide by the VisiData [Code of Conduct](https://github.com/saulpw/visidata/blob/stable/CODE_OF_CONDUCT.md).)

### Write a thoughtful post about VisiData's philosophy, design, or whatever unexpected detail delighted you today.

I love hearing about these and reading these.  The more I think about VisiData myself, the harder of a time I have saying what VisiData really *is*, and so usually I just fall back on describing commands or use cases and forget to talk about the bigger picture.  I've seen my own descriptions ad nauseum, so to read other peoples' descriptions of VisiData in their own words is always a treat and often inspiring.

Like:

- [Jeremy Singer-Vine's Introduction to VisiData](https://jsvine.github.io/intro-to-visidata/) (English tutorial)
- [Andrea Borruso's Guida VisiData](https://github.com/ondata/guidaVisiData/tree/master/testo) (Italian tutorial)
- [Luke Plant's Everything is an X](https://lukeplant.me.uk/blog/posts/everything-is-an-x-pattern/) (blog post)

### Make a video that includes your day-to-day workflow using VisiData.

People like searchable documentation when they want to do something specific, but what non-users don't know is what all they can do with it in the first place.  So many potential users say things like "why wouldn't I just use grep|awk|whatever"?  You can spend all day describing what makes VisiData useful, but if you show them directly, it's often self-evident.

I've made some [Video Use Cases](https://www.youtube.com/watch?v=2zQFUzhoAm8&list=PLxu7QdBkC7drrAGfYzatPGVHIpv4Et46W&index=2) as examples (they're functional but I'm sure they could be done a lot better).

### Create a new VisiData Plugin

As mentioned above, VisiData is not just a table explorer, but an actual platform for making tools around tabular data.

If you love using VisiData and wish you could use it for another use case, you're in luck!  VisiData is meant to be extended using Python, and can readily advantage of the existing and rich ecosystem of Python libraries.  It only takes a little bit of work to make a plugin for yourself, and only a bit more to maintain it.

For example:
- ajkerrigan created a [vds3]() plugin which allows access to s3;
- jsvine wrote the [dedupe]() plugin to add some commands for deduplicating data;
- Paul McCann maintains a [CoNLL data loader]() for linguistic data;
- I wrote (with the [Devottys](https://github.com/devottys/)) [DarkDraw](https://github.com/devottys/darkdraw), a Unicode drawing tool (check out [some of the neat art]() that's been made with it!)

### Adopt and maintain an existing plugin

Believe it or not, adopting an existing plugin would be even *more* valuable than creating a new plugin!

I've created a bunch of VisiData-adjacent tools that I've used at various times, but that aren't fully baked or ready for mass consumption.  I've put most of these into [VisiData Plus](https://github.com/visidata/vdplus) for my convenience, but several of them have the potential to become tools in their own right.  These all require maintenance and attention (if only to make sure that they stay up-to-date with core VisiData releases), and if someone can really own one of these, that frees up my time and attention for core VisiData features.

So here are some existing plugins that you might consider diving into:

- [vgit](https://github.com/visidata/vdplus/tree/develop/git)

A data-oriented interface to git could supercharge a git workflow.  Want to retcon your repo to scrub some word from your commit messages?  I'm sure it's possible with some `git --filter-follow-x --rererere` command but with vgit it could be as easy as two VisiData commands (`setcol-subst` and then `commit-sheet`).

- [galcon](https://github.com/visidata/vdplus/tree/develop/galcon)

A remake of the classic [Galactic Conquest](https://www.myabandonware.com/game/galactic-conquest-7rf) with a Python server and VisiData plugin for the client.  That's right, there's an actual *game* that uses VisiData as its primary interface, and it actually kind of works!  I wrote it during a weekend Game Jam at the [Recurse Center](https://recurse.com).  As they say, 90% of a game is polish, so if you were to dive into this game and polish it to an unreasonable degree, I would be really chuffed!

## Conclusion
