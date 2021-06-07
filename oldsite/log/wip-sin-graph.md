# Using `visidata.Canvas`

Example code demonstrating how to use visidata.Canvas to draw on a curses screen object.

The interface to the visidata package may not be fully operational.  It should be improved and tweaked to be a real example.

```
import math
import curses
import visidata


def curses_main(scr):
    visidata.colors.setup()
    c = visidata.Canvas()
    for deg in range(360):
        x = deg*2*math.pi
        c.point(x, math.sin(x), c.plotColor(('sin',)))
        c.point(x, math.cos(x), c.plotColor(('cos',)))
    c.draw(scr)
    visidata.run()

curses.wrapper(curses_main)
```
