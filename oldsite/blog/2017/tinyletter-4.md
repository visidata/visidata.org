[originally published as TinyLetter #4]

# VisiData v0.98 has been released!

Hello all,

Tonight Anja and I released VisiData v0.98, which can be installed as usual via pip3.  In addition to the graphs I demo'ed a few weeks ago, VisiData now also displays maps, sourced from .shp or (vector) .mbtiles.  Both graphs and maps are available with the '.' (dot) command (instead of 'm' as mentioned in the preview video).  dot == plot.

It also finally has mouse support, which is useful on a canvas to select a cursor region with left click-drag, to scroll around with right click-drag, and to zoom in/out with the scrollwheel.  This has not been tested on MacOS, so maybe there is a better binding for e.g. scrolling.  If anyone has an opinion on this feel free to weigh in.  On a tabular sheet, mouse support is limited to setting the row cursor with left-click and scrolling rows with the scrollwheel.

There are several command and option changes.   A few that might affect you:

- the 'headerlines' and 'skiplines' options are now called 'header' and 'skip'.
- 'P' is now "paste before" (like vim).  'R' is now "get a random population sample".
- '^Z' now suspends the program.  '^O' ("open") launches the external $EDITOR (from the builtin editor).

You can see a longer list of the additions and changes in the release notes (https://github.com/saulpw/visidata/releases/tag/v0.98).

Happy Visidating,
Saul
