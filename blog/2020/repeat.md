# New Features: repeat-last and repeat-input

On the `develop` branch, we have shipped two new commands: `repeat-last` and `repeat-input`.

These commands had been originally requested on the #visidata IRC channel. The design spec was then transcribed onto [issue #441](https://github.com/saulpw/visidata/issues/441).

The aim was to have something spiritually similar vim's `.` (dot) command.

`repeat-input` runs the previous command, along with any previous input to that command. `repeat-last` runs the most recent command with an empty, queried input.

For the moment, they are unbound. To use any command with its longname, press `SPACE` followed by the *longname*. For example: `SPACE` *repeat-last*.

To bind the commands to your preferential keystroke (these examples use `.`), add to your ~/.visidatarc`:

~~~
Sheet.bindkey('.', 'repeat-input')
Sheet.bindkey('z.', 'repeat-last')
~~~

As always, the features on `develop` are experimental. If you do use them, please let us know how you feel about them! [Post an issue on Github](https://github.com/saulpw/visidata/issues/new), [share a tweet](https://twitter.com/VisiData), or stop by for a [chat in freenode #visidata](https://webchat.freenode.net/).

##
