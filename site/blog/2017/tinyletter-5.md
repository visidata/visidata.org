---
title: "VisiData v0.99 released; last stop before 1.0"
date: 2017-12-26
tags:
    - blog
---
[originally published as TinyLetter #5]


Hello fellow VisiDataists,

We pushed v0.99 to PyPi last week.  This release includes:

   - tab completion for filenames and expressions;
   - an html loader;
   - a json saver;
   - and several tweaks; see the Changelog for the full list of changes

The only remaining goal for 1.0 is to be installable via a single command on most systems, even if they don't have Python and pip3 already installed.

So we are in the process of undergoing review for inclusion in the Debian package repository and homebrew-core, and hopefully getting close.  (The process is more elaborate than it might seem.) Anja has been doing a great job preparing the packages, perfecting the install process, and tying up the all the technical loose ends so that our pull requests won't be rejected.  But it is the holidays and these things just take time.

Here's hoping they accept VisiData in the next week or two.  But even if they don't, we have our own brew/apt repositories set up, and even now, you should be able to install on MacOS with the single command:

    brew install saulpw/vd/visidata

which isn't too bad.  But I'd still love to release the formal 1.0 in the official standard repositories.

In the meantime, I would love it if you would test the bejeesus out of v0.99, and file any issues on github.  The goal is to have a stable 1.0 that is a reliable workhorse of a tool, that can be useful to myself and others for years to come without any need for major bugfixes or updates.

That is not to say that I'm done with VisiData; in fact, I can't wait to start working on the next version, which will include a more discoverable menu system and some major internal refactoring.  But I realize that I've been putting off these refactors for months now because 1.0 seemed closer than it was.  So actually getting out a 1.0 stable release would go a long way to ease my mind, before everything gets shuffled around (which might take awhile to become seamless again).

As usual, I would love to hear how you use VisiData.  Keep an eye out for the 1.0 release in early January!

Happy holidays,
Saul
