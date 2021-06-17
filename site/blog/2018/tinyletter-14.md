---
title: I'll show you my .visidatarc if you show me yours
date: 2018-07-24
tags:
    - blog
---

[originally published as TinyLetter #14]


Yo VisiDaters,

Do you have a .visidatarc file? It's where you can set options and add your own commands, keybindings, and functions to use in expressions--super handy for fine-tuning your personal experience of VisiData. If you have one, I would love to see it. Please send it to me [vd@saul.pw] and if there's any common trends, it may even inspire changing the defaults.

Additionally, I wanted to demonstrate the cmdlog history, which is toggled by an option. If you add this to your .visidatarc:

     options.cmdlog_histfile = "~/.visidata/history.vd"

it will append each command to the cmdlog also to that file. Then you can press gD to go to the .visidata directory, and ENTER to visit the history. I've used this with zY (syscopy-cell) to copy/paste a complicated regex I had used a session or two before.

Finally, we are considering dropping the menu system. Does anyone use and/or like it? Anja opened up an issue on Github and we'd love your comments: [https://github.com/saulpw/visidata/issues/174](https://github.com/saulpw/visidata/issues/174)

Keep an eye out for v1.3 in August!

Happy VisiDating,
Saul
