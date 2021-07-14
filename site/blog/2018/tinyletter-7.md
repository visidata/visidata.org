---
title: "VisiData 1.1 released: menus and more"
date: 2018-03-06
tags:
    - blog
---
[originally written as TinyLetter #7]

Hello fellow textpunks,

We got a bunch of new subscribers over the weekend, as the lightning talk VisiData video was submitted to HackerNews, and it proceeded to climb onto the front page where it stayed the whole day.  This generated a bunch of traffic and a lot of positive response!  It seems like people are starting to understand VisiData as more than just a way to view csv files in the terminal.

This was a bit of unfortunate timing, though, since the newcomers all saw v1.0, and we were just about to release v1.1, which has several new features and many improvements.  But that's how these things go, and we just kept on our path and released VisiData v1.1 last night as scheduled anyway.  The full release notes are on Github (and we'll update the website tonight or tomorrow), but here are the highlights:

- The Spacebar now invokes an experimental command menu system. Hopefully this can both let people know what functionality is available, and help them learn the command keys as they explore.

- The new `(` and `)` commands expand and unexpand list/dict columns.  This should be very useful with e.g. nested json data.

- Data can now be copied directly to the system clipboard.  Jeremy Singer-Vine asked for this feature a few months ago, and I can see it being very handy for e.g. pasting a short summary into an email.

- Speaking of, Jeremy has been putting together a tutorial for VisiData, which is looking really great!  Many people have asked for something like this, and he's done a much better job than I could ever hope to do.  Check it out and get some ideas of how to use VisiData to its fullest.

- Finally, VisiData has been accepted into Debian!  Currently in the unstable repository, it will move into stable for the next Debian release.

I've been thinking a lot lately about the community of terminal users.  There are a lot of great tools out there: the old standards like vim, the recent replacements like tmux, modern themes like ohmyzsh; and I hope that someday VisiData will be considered part of that pantheon.  Maybe I should convert textpunks.com (which has been sitting idle for a long time) into a lifestyle site for all of us terminal fanatics.  Would there be any interest in something like that?

As usual, feedback and suggestions are very welcome; send me an email at vd@saul.pw and say hello!
