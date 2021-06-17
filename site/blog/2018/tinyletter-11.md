[originally published as TinyLetter #11]

# Version 1.2 released; video #4 describes a major new feature

Hello VisiDaters!

There are a couple of items this time.

First, we have released v1.2!  It is currently up on pypi, and is making its way to all of our other distributions. Here are the highlights (the release notes for v1.2 can be found at https://github.com/saulpw/visidata/releases/tag/v1.2):

* an additional install method: conda, via the conda-forge channel (https://github.com/saulpw/visidata#install-via-conda)

* expanded commands such as:
  * `g^S` (multisave all sheets),
  * `g*` (replace selected row cells with regex transform)
  * `gM` (melt using regex capture groups to transform columns into Variable-Value-Value... rows).

* a prototype for a new macro system. On the CommandLog, z^S will allow you save selected rows to a macro for a given keystroke.  These macros will be saved to the .visidata folder and loaded automatically on startup.  Give it a try, and please let me know what does or does not work for you!

* new loaders for sas7bda, xpt, sav and dta (SAS, Stata, and SPSS formats)

* and last but certainly not least, an expansion of the directory browser.  Users can now modify file metadata, move files around, and delete files, all within the existing VisiData framework.

This last feature is so powerful that we made a video demonstrating it.  Video #4 (https://www.youtube.com/watch?v=l2Bpmm0yAGw) is up on Youtube.

Secondly, I've been so heartwarmed by those of you who have reached out recently to share what you love about VisiData.  It's really inspiring!

In particular, a couple of you were so happy that VisiData does not save anything to disk or use any swap or tmp files, without explictly executing one of a very small set of commands--only ^S ^D ^O (save data, record cmdlog, open external).  This had not been an explicit design decision, but I can definitely see its value, so we will do our best to preserve it.

This feedback was timely, however, as there is now "command history autosave" in v1.2.  One source of frustration I've had with VisiData, is that I sometimes find a great workflow and then quit out entirely mere seconds before realizing I wanted to save the commandlog.  But taking the above design decision into account, it is disabled by default.  If you want to give it a try yourself, you can put this in your .visidatarc:

    options.cmdlog_histfile='~/.visidata/history.vd'

Next week, we will be in Cleveland at PyCon.  If you will be there, send me an email and let me know!  I would love to say hi and chat for a bit.

Au revoir (for at least a couple weeks),
Saul
