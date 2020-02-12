# Split window

Hey VisiDaters, check it out!

In the bleeding-edge `develop` branch, VisiData can now show TWO sheets at the same time:

![gif or screenshot](/blog/assets/2020-splitwin-screenshot.gif)

The ability to see two sheets on the screen at the same time has been on the v2.0 roadmap for a long time.
I've even caught myself lamenting a few times that, if we had split-screen, the design for some feature would be straightforward.
Deep down I also think it might open up a whole new dimension of user interface, where movement on the active window instantly updates the inactive window.

So I've given it a few tries already; it's not that technically challenging to do, but the interface for it remained elusive
After talking with [@tsibley](https://github.com/tsibley) and [@anjakefala](https://github.com/anjakefala) and sitting with it for long enough, last week I finally put together a working prototype.
It's serviceable but not perfect, so hopefully it can serve as a launching pad for discussion about the finer points of split-screen workflow.

## `options.disp_splitwin_pct`

The main option is `disp_splitwin_pct`, which specifies the height of the top window as a percent of the full screen height.
Currently, a positive number puts the top sheet in the top window, whereas a negative number keeps the same layout, but puts the top sheet in the bottom window.

## Commands

- `Shift+Z` splits the screen in half so that the second-most-recently accessed sheet is visible
- `g Shift+Z` sets the active sheet to the whole screen (effectively disable splitwin)
- `z Shift+Z` specifies `options.disp_splitwin_pct` exactly

- `Ctrl+^` (which already jumps to the previous sheet) naturally swaps the layout without changing the active panel

- `TAB` swaps the active panel, without changing the layout.  (note that this means the replay-advance command is currently disabled; I'm still not sure how all this is going to work.)

Its full implementation could solve several issues (choosing jointype/aggregators, [popup command help](https://github.com/saulpw/visidata/issues/293)) and would make a two panel [orthodox file manager](https://github.com/saulpw/visidata/issues/309) all but inevitable.

## Theme options

- `color_top_status` is applied to the "top window status bar" -- which is in the middle of the screen.  Set by default to `underline` to divide the screen visually.
- `color_inactive_status` is applied to the status bar of the inactive window.
- `color_active_status` is applied to the status bar of the active window.

## Limitations

- only 2 sheets at the same time; from one to two sheets is a quantum leap by itself and a reasonable constraint (at least to start with).
- only top/bottom split is supported; this implementation could be extended to include `options.disp_splitwin` which might specify e.g. `top` or `left` to indicate the panel of the top sheet.
- it can't be specified as a CLI option (no `disp_` or `color_` option can).
- canvas/graph sheets aren't reset and may have errors that require `Ctrl+L` to resize properly.

This is still quite experimental so if you use this feature, let me know how you feel about it!  [Post an issue on Github](https://github.com/saulpw/visidata/issues/new), [share a tweet](https://twitter.com/VisiData) , or stop by for a [chat in freenode #visidata](https://webchat.freenode.net/).

[written by Saul Pwanson 2020-02-02]
