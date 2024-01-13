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

[^1]: There are also several 'nonsources', including the GitHub wiki, Twitter @VisiData, r/visidata subreddit, StackOverflow, and an ancient fork on readthedocs.
    These are deprecated, neither maintained nor monitored, and will be removed if possible once any content has been preserved in a more active documentation form.

Non-documentation sources include:

    - [Mastodon](https://fosstodon.org/@saulpw) for bonus tips and trivia and related projects.
    - [Patreon](https://patreon.com/saulpw) for updates and data games and text art, with various support tiers.
    - [Saulville](https://visidata.org/chat) (Discord server) and Saul's occasional office hours, for community interaction.

But, they are just the beginning. To really address usability, we've overhauled our approach to documentation, ensuring users can easily find and use the resources they need within VisiData itself.

- (added in 2.6) a [menu system]() if you're comfortable browsing for a command
- (added in 3.0) a [command palette]() so you can fuzzy search for commands
- (added in 3.0) [sidebar help]() so you can get more context-aware information about the current sheet or input.

And on top of all of these, in VisiData 3.0 we've started to add **Guides**.

## Guides are Explanations

They highlight some feature, including 5-15 related commands and options, and explain it in reasonable detail.  Most of VisiData's 300+ commands and 150 options can be represented in ~30 Guides.

They are designed to build comprehension and help users acquire skill, according to the core principles of Explanations within the [Diátaxis framework](https://diataxis.fr/compass).

Guides are also viewable within VisiData itself. Use `vd -P open-guide-index` to explore the current Table of Contents, and to read the Guides that have already been written.
