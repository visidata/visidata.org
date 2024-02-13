---
title: Help improve VisiData documentation!
author: Saul Pwanson and Anja Kefala
date: 2024-02-12
tags:
    - docs
---

# Join the Documentation Drive

Welcome to the great VisiData Documentation Consolidation of 2024! As we mentioned in [our previous blog post](/blog/2024/introducing-guides), we want to combine the contents from the existing [manpage](https://github.com/saulpw/visidata/tree/38a2b32d5bcd07d19ae9c45c01649ec246a6194b/visidata/man) and [/docs](https://github.com/saulpw/visidata/tree/38a2b32d5bcd07d19ae9c45c01649ec246a6194b/docs) into [guides](https://github.com/saulpw/visidata/tree/38a2b32d5bcd07d19ae9c45c01649ec246a6194b/visidata/guides). All of the command/option helpstrings included in the guides will be [pulled from docstrings](/docs/api/style#color-markup-standards). Through this consolidation, we will create a single place inside the main repo where the documentation needs to be updated.

But, what are [guides](/blog/2024/introducing-guides/)? Briefly, a guide is an explanation of a particular feature, giving a basic synoposis and including 5-15 related commands and options. Like the manpage, they are viewable from within VisiData itself.

We don't just want to create these guides without a larger strategy. Good docs are hard to write and have to be maintained, and we want to make sure people are benefiting from them. This process will have two overlapping stages: the big push and ongoing maintenance.

## The Big Push

1. This [github issue](https://github.com/saulpw/visidata/issues/2313) will track the available documentation tasks, who is committed to which task, and which tasks are completed.
Write a comment on the issue if you intend to write a guide. PRs for guides should then all reference this issue.

2. Write the guide! Here are links to the [style guide](/docs/api/style) + [guide writing process](/docs/api/guides).  Basically, write a short overview (a couple of sentences, and then figure out which commands and options should be referenced, and how they should be organized.  A little goes a long way!

3. Open a PR, linked to the [issue](https://github.com/saulpw/visidata/issues/2313). For now, do not include images in the guides
Anyone is welcome to open PRs for minor edits.

4. All doc contributors are viewed as real contributors: after a few substantive PRs, we'll send you some VisiData stickers (including a holographic contributor sticker) and a thank you notecard.

5. To deputize yourself as a doc writer, all you have to do is ask!  Feel free to ask any questions in [Github Discussion](https://github.com/saulpw/visidata/discussions/new/choose) or [our chat](https://bluebird.sh/chat).


## Ongoing Maintenance

We need to integrate lightweight doc progress into our everyday development workflow, so that the documentation stays up-to-date and can be improved more incrementally, instead of requiring big pushes.

a. When someone implements a feature, they will create an issue describing how it works, and tag it #documentation.
b. When a wishlist item gets implemented, we'll still label it "wish granted", we add the label #documentation, and it will stay open until docs are written.
c. Any deputy doc is welcome to pick up any wishlist+doc issue.

## Ideas for Contribution

The best way to figure out what to contribute, is to fix little inconsistencies you notice while using VisiData. If you find some command or option helpstring a little confusing or ambiguous, spend a few minutes thinking about how it could be clearer, and submit a PR. Or if you can't find a command or option, and then find it later using different terms, add your original search keywords into the helpstring.

If you know how to use one of the features that doesn't have a guide yet, spend a few minutes collecting your throughts into a small .md with the relevant commands or options, and submit a PR.

If you don't think you know enough about VisiData to speak authoritatively, you can dissect an existing file in docs/.md and merge the information into an appropriate guide (replacing the original with the inlined guide).

If a guide makes something click for you, you can make a video about it.  People are eager for video content showing how features work, and the best time to show a feature is when you first understand it.

## Conclusion

The VisiData Documentation Consolidation of 2024 aims to capture all of our breadth of documentation into a single source, guides. Your assistance will help ensure this process results in clear, comprehensive docs lickety-split. Thanks to everyone who drops by to help out!
