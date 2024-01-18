---
title: Introducing Guides
date: 2024-01-08
tags:
    - docs
---

VisiData is an incredibly powerful tool, often hailed as [world-class and the gold standard for data exploration](https://news.ycombinator.com/item?id=38894276).

However, these accolades usually come with a caveat: it has [a steep learning curve](https://news.ycombinator.com/item?id=38893850).

Over the years, as we've invested in ease of use, we've amassed a wide range of documentation sources [^1]:

- Command helpstrings (seen on the Help Sheet with `z Ctrl+H`).
- Option helpstrings (see on the Options Sheet with `Shift+O`).
- Python docstrings for [API docs](https://visidata.org/docs/api).
- [General documentation at /docs](https://visidata.org/docs).
- [UNIX manpage](https://visidata.org/man).
- [Blog posts here on visidata.org](https://visidata.org/blog).
- Github [Issues](https://github.com/saulpw/visidata/issues) and [Discussions](https://github.com/saulpw/visidata/discussions) on the [main repository](https://github.com/saulpw/visidata/).
- [Saul's YouTube channel](https://youtube.com/saulpw).
- External resources like [Andrea Borruso's tutorial](https://ondata.github.io/guidaVisiData/) and [Jeremy Singer-Vine's cheatsheet](https://jsvine.github.io/visidata-cheat-sheet/en/).
- [Development team documentation at /dev](https://github.com/saulpw/visidata/develop/dev).

We also have some non-documentation sources, like:

- [Mastodon](https://fosstodon.org/@saulpw) for bonus tips and trivia and related projects.
- [Patreon](https://patreon.com/saulpw) for updates and data games and text art, with various support tiers.
- [Saulville](https://visidata.org/chat) (Discord server) and Saul's occasional office hours, for community interaction.

## Whew, that's a lot!

And we know that quantity sometimes makes it harder to know where to look to find what's relevant to you right now.  So we've been steadily shifting our approach to usability, to make it easier to find what you need within VisiData itself.  For example:

- (added in 2.6) a [menu system](https://youtu.be/QixtGeSbSLU?si=2Cd5TuZUiIGEfTwO) if you're comfortable browsing for a command
- (added in 3.0) a [command palette](https://github.com/saulpw/visidata/pull/2059) so you can fuzzy search for commands
- (added in 3.0) [sidebar help](https://github.com/saulpw/visidata/discussions/1733) so you can get more context-aware information about the current sheet or input.

Finally, building on the sidebar context-sensitive help that's been added in 3.0, we're starting to add **Guides**.

## Guides are Organized Explanations of Features

Each guide is a highlight of a particular feature, giving a basic synoposis and including 5-15 related commands and options. Like the manpage, they are viewable from within VisiData itself. You should not have to leave terminal to learn how to use VisiData.

A few of these guides have already been written! To explore the existing guides, open the Guide Index with `Space open-guide-index` (within VisiData) or `vd -P open-guide-index` (from the CLI).

![vd3.0-ToC.png](/blog/assets/vd3.0-ToC.png)

White text indicates a written guide; press `Enter` on them to take a look! Gray guides haven't been written, yet. Particularly exciting is that Saul implemented [support for basic markdown and designed VisiData's own display attribute syntax](https://www.visidata.org/docs/api/guides#some-stylings-of-note), which is how the colour in the guides were added. We can even add links!

![vd3.0-guideExample.png](/blog/assets/vd3.0-guideExample.png)

We think that most of VisiData's 300+ commands and 150 options can be represented in ~30 guides. So not only will the guides cover a breadth of features in more depth, they will also act as a structured command reference. These guides will eventually supplant the existing web content and existing manpage--both should be composable from the guides.

## Stay tuned for something

For v3.1, we are planning to host a doc-drive, encouraging contributions from the community. If you are interesting in helping out, explore which topics you would like to write guides for, and keep an eye out for a future blogpost. For now, you can check out this [tutorial on adding a guide](https://www.visidata.org/docs/api/guides).

[^1]: There are also several 'nonsources', including the GitHub wiki, Twitter @VisiData, r/visidata subreddit, StackOverflow, and an ancient fork on readthedocs.
    These are deprecated, neither maintained nor monitored, and will be removed if possible once any content has been preserved in a more active documentation form.
