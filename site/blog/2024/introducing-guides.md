---
title: Introducing Guides in VisiData 3.0
date: 2024-01-08
tags:
    - docs
---

# Introducing Guides in VisiData 3.0

VisiData is an incredibly powerful tool for data exploration, often hailed as 'world-class' and 'the gold standard'.

However, these accolades usually come with a caveat: it has "a steep learning curve".

Investing in ease of use, over the years we've accumulated a range of documentation sources [^1]:

- Command and option helpstrings (available respectively on the Help Sheet with `z Ctrl+H` and the Options Sheet with `Shift+O`)
- Python docstrings for [API docs](https://visidata.org/docs/api).
- [General documentation at /docs](https://visidata.org/docs).
- [UNIX manpage](https://visidata.org/man).
- [Blog posts here on visidata.org](https://visidata.org/blog).
- Github [Issues](https://github.com/saulpw/visidata/issues) and [Discussions](https://github.com/saulpw/visidata/discussions) on the [main repository](https://github.com/saulpw/visidata/).
- [Saul's YouTube channel](https://youtube.com/saulpw).
- External resources like [Andrea Borruso's tutorial](https://ondata.github.io/guidaVisiData/) and [Jeremy Singer-Vine's cheatsheet](https://jsvine.github.io/visidata-cheat-sheet/en/).
- [Development team documentation at /dev](https://github.com/saulpw/visidata/develop/dev).

Non-documentation sources include:

- [Mastodon](https://fosstodon.org/@saulpw) for bonus tips and trivia and related projects.
- [Patreon](https://patreon.com/saulpw) for updates and data games and text art, with various support tiers.
- [Saulville](https://visidata.org/chat) (Discord server) and Saul's occasional office hours, for community interaction.

But, they are just the beginning. To really address usability, we've overhauled our approach to documentation, ensuring users can easily find and use the resources they need within VisiData itself.

- (added in 2.6) a [menu system](https://youtu.be/QixtGeSbSLU?si=2Cd5TuZUiIGEfTwO) if you're comfortable browsing for a command
- (added in 3.0) a [command palette](https://github.com/saulpw/visidata/pull/2059) so you can fuzzy search for commands
- (added in 3.0) [sidebar help](https://github.com/saulpw/visidata/discussions/1733) so you can get more context-aware information about the current sheet or input.

And now, building on the sidebar context-sensitive help, we've started adding **Guides**.

![2024-vd3.0.png](/blog/assets/2024-vd3.0.png)

## Guides are Explanations

Each guide is a highlight of a particular feature, giving a basic synoposis and including 5-15 related commands and options. Like the manpage, they are viewable from within VisiData itself. Our goal is for TUI-lovers to not need to leave the terminal to learn how to use VisiData.

We think that most of VisiData's 300+ commands and 150 options can be represented in ~30 guides. So not only will the guides cover a breadth of features in more depth, they will also act as a structured command reference. The dream is for the guides to both supplant the existing web content, and to be concatenated into a manpage.

A few have already been written! To start exploring the existing guides and the Table of Contents, open the Guide Index with `Space open-guide-index` within VisiData or `vd -P open-guide-index` from the CLI.

![vd3.0-ToC.png](/blog/assets/vd3.0-ToC.png)

White text indicates a written guide; press `Enter` on them to take a look! Gray guides haven't been written, yet. Particularly exciting is that Saul implemented [support for basic markdown and designed VisiData's own display attribute syntax](https://www.visidata.org/docs/api/guides#some-stylings-of-note), which is how the colour in the guides were added. We can even add links!

![vd3.0-guideExample.png](/blog/assets/vd3.0-guideExample.png)

For v3.1, we are planning to host a doc-drive, encouraging contributions from the community. If you are interesting in helping out, explore which topics you would like to write guides for, and keep an eye out for a future blogpost. For now, you can check out this [tutorial on adding a guide](https://www.visidata.org/docs/api/guides).

[^1]: There are also several 'nonsources', including the GitHub wiki, Twitter @VisiData, r/visidata subreddit, StackOverflow, and an ancient fork on readthedocs.
    These are deprecated, neither maintained nor monitored, and will be removed if possible once any content has been preserved in a more active documentation form.
