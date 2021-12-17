---
title: Ways you can contribute to VisiData
date: 2021-10-29
tags:
    - history
    - contributing
---

If you're a fan of VisiData and related tools, there are many ways you can help take VisiData to the next level.
Here's a list, from least amount of effort to greatest amount of investment:

## Give money.

If you want to contribute a little but don't have any time or energy, you can [subscribe to my Patreon](https://patreon.com/saulpw).
For people who are using VisiData daily in your paid work, I suggest $20/month (less than a dollar per workday).
If every daily VisiData user subscribed at this level, then it could be a sustainable part-time income.
Not exactly striking it rich, but VisiData could go some pretty interesting directions if I could focus on it without stressing about money or working a full-time software job.

If you are part of a corporation with a marketing budget, you could lobby them to become a [corporate sponsor](https://github.com/sponsors/saulpw).  For $500/mo, your corporation can get its logo on every page of visidata.org, and also get premium support for VisiData.

Please note that I haven't yet paid myself any income from the money I get from Patreon and sponsorships.  It all goes into a separate Pwanson & Pwanson account, and I put that money back into improving these projects.  For instance, it paid for the recent [visidata.org redesign](https://www.visidata.org/blog/2021/redesign-2021/) by [Luke Harris](https://luke.work), and for a prototype "web version" from [Tom Buckley-Houston](https://tombh.co.uk).

## Join the Community.

Money is great, but even more useful is a large and healthy community.  More users means a larger community which means more direct (and indirect) contributors.

My goal is to see if we can get VisiData to 10x usage over the next 5 years.
This is ambitious, as very few terminal tools have tens of thousands of users, but I think VisiData is useful enough to be in the "canon" of everyday software tools.
If it reaches this level, chances are much greater that it will continue to exist even if I myself stop working on it entirely.
The community should take on a life of its own (this is already starting to some extent, but still requires my input).
And once VisiData has been around and stable for 10 years and has a healthy self-sustaining community, [maybe Julia Evans will make a zine about it](https://twitter.com/b0rk/status/1229860328139296768).

### Mention VisiData as a way to solve a specific data problem.

I love seeing people talking about VisiData, especially their own specific use cases and experiences.  Other people respond more positively to this too; much moreso than general hyperbolic exclamations (even if they're true).

Here are some good examples of mentions I've seen on [Twitter](https://twitter.com/trs/status/1447672576021467140), [Reddit](https://www.reddit.com/r/commandline/comments/mc30z5/using_a_keylogger_and_visidata_to_show_most_used/), and [Hacker News](https://news.ycombinator.com/item?id=24819600).  Practical, plain-spoken, a finger pointing toward the moon.

### Participate in project development.

- If you experience something that doesn't work, bombs out, feels uncomfortable, or loses data (especially this!), [file an issue](https://github.com/saulpw/visidata/issues).
- If you have a use case you can't figure how to do, [start a discussion](https://github.com/saulpw/visidata/discussions).
- If you found the documentation lacking or misleading, [propose a better way to say it]().
- If you want to chat more casually with us and other VisiData users about the VisiData experience, join us on [Discord](https://visidata.org/chat) or [IRC](https://libera.chat/#visidata),

This is how we get that absurd amount of polish!

### Write a thoughtful post about VisiData's philosophy, design, or whatever unexpected detail delighted you today.

I love hearing about these and reading these.  The more I think about VisiData myself, the harder of a time I have saying what VisiData really *is*, and so usually I just fall back on describing commands or use cases and forget to talk about the bigger picture.  I've seen my own descriptions ad nauseum, so to read other peoples' descriptions of VisiData in their own words is always a treat and often inspiring.

Some good examples:

- [Jeremy Singer-Vine's Introduction to VisiData](https://jsvine.github.io/intro-to-visidata/) (English tutorial)
- [Andrea Borruso's Guida VisiData](https://github.com/ondata/guidaVisiData/tree/master/testo) (Italian tutorial)
- [Luke Plant's Everything is an X](https://lukeplant.me.uk/blog/posts/everything-is-an-x-pattern/) (blog post)

### Make a video that includes your day-to-day workflow using VisiData.

People like searchable documentation when they want to do something specific, but what non-users don't know is what all they can do with it in the first place.  So many potential users say things like "why wouldn't I just use grep|awk|whatever"?  You can spend all day describing what makes VisiData useful, but if you show them directly, it's often self-evident.

- Waylon Walker gently includes VisiData in his [workflow demonstrations](https://www.youtube.com/watch?v=8m5ipBuopPU&t=250).
- I've made some [Video Use Cases](https://www.youtube.com/watch?v=2zQFUzhoAm8&list=PLxu7QdBkC7drrAGfYzatPGVHIpv4Et46W&index=2) as examples (they're functional but I'm sure they could be done a lot better).

### Create a new VisiData Plugin.

As mentioned above, VisiData is not just a table explorer, but a whole platform for making tools around tabular data.

If you love using VisiData and wish you could use it for another use case, you're in luck!  VisiData is meant to be extended using Python, and can readily advantage of the existing and rich ecosystem of Python libraries.  It only takes a little bit of work to make a plugin for yourself, and only a bit more to maintain it.

Here are some good examples of plugins people have written:

- ajkerrigan wrote the [vds3]() plugin which allows access to s3;
- jsvine wrote the [dedupe]() plugin to add some commands for deduplicating data;
- Paul McCann wrote a [CoNLL data loader]() for linguistic data;
- I wrote (with the [Devottys](https://github.com/devottys/)) [DarkDraw](https://github.com/devottys/darkdraw), a Unicode drawing tool (check out [some of the neat art]() that [Dwimmer]() has made with it!)

### Adopt and maintain an existing plugin.

Believe it or not, adopting an existing plugin could be even *more* valuable than creating a new plugin!

I've created a bunch of VisiData-adjacent tools that I've used at various times, but that aren't fully baked or ready for mass consumption.  I've put most of these into [VisiData Plus](https://github.com/visidata/vdplus) for my convenience, but several of them have the potential to become tools in their own right.  These all require maintenance and attention (if only to make sure that they stay up-to-date with core VisiData releases), and if someone can really own one of these, that frees up my time and attention for core VisiData features.

To be honest, several of these "plugins" are more like Emacs [major modes](https://www.gnu.org/software/emacs/manual/html_node/emacs/Major-Modes.html).  They take advantage of the VisiData framework, but are actually apps in their own right.

If someone started polishing and maintaining one of these plugins, I would love them forever.  The way to my heart is apparently VisiData plugins.

Here are some of my favorite "plugins" that I would love if someone to dive into:

- [vgit](https://github.com/visidata/vdplus/tree/develop/git)

A data-oriented interface to git could supercharge a git workflow.  Want to retcon your repo to scrub some word from your commit messages?  I'm sure it's possible with `git --filter-follow --rererere` or something but with vgit it could be as easy as two VisiData commands (`setcol-subst` and then `commit-sheet`)--the same ones used for sqlite and many other formats.

- [galcon](https://github.com/visidata/vdplus/tree/develop/galcon)

A remake of the classic [Galactic Conquest](https://www.myabandonware.com/game/galactic-conquest-7rf) with a Python server and VisiData plugin for the client.  That's right, there's an actual *game* that uses VisiData as its primary interface, and it actually kind of works!  I wrote it during a weekend Game Jam at the [Recurse Center](https://recurse.com).

If these projects or any others you see laying around interest you, get in touch!

### Anything you want to do!

[Come chat with us](https://visidata.org/chat) and bring your own ideas, we'd love to hear them!  Often it will be less work than you think--maybe only an hour or two.  Sometimes only a few minutes--it might just be a one-liner in your .visidatarc!
