# New Features: repeat-last and repeat-input

On the `develop`, we have shipped two new commands: `repeat-last` and `repeat-input`.

These commands were requested originally on the #visidata IRC channel, and the design spec transcribed onto [issue #441](https://github.com/saulpw/visidata/issues/441).

The aim was to have something spiritually similar vim's `.` (dot) command.

`repeat-input` runs the previous command, with any previous input. `repeat-last` runs the last command with an empty, queried input.

For the moment, they are unbound. To use any command with its longname, type `Space` followed by the *longname*. For example: `Space` *repeat-last*.

To bind the commands to your preferential keystroke (this example uses `m`), add `Sheet.bindkey('m', 'repeat-input')` to your `~/.visidatarc`.

As always, the features on `develop` are experimental. If you do use them, please let us know how you feel about them! [Post an issue on GIthub](https://github.com/saulpw/visidata/issues/new), [share a tweet](https://twitter.com/VisiData), or stop by for a [chat in freenode #visidata](https://webchat.freenode.net/).

##
