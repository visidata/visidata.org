# A Swiss Army Chainsaw for Data

VisiData is an [open source](https://github.com/saulpw/visidata) supertool for exploring and manipulating data.
It combines the clarity of a spreadsheet, the efficiency of the terminal, and the power of Python, into a lightweight utility which can handle millions of rows with ease.

#### Latest Version: [1.5.1](/releases) (2018-12-16)

<div class="screenshot">
<a href="/basic-screenshot.png"><img src="/basic-screenshot.png" alt="screenshot of VisiData in action"/></a>
</div>

## 10 Ways to Use VisiData

1. explore new datasets effortlessly, no matter the format: `vd foo.json bar.csv baz.xls`
2. open a Frequency Analysis for any column: move to that column and press `Shift+F`
3. convert from any input format into any output format: `vd -b input.csv output.json`
4. as an interactive replacement for grep, awk, sed, cut, sort, uniq: just pipe into `|vd`
5. scrape HTML table data from a webpage: `vd https://html.com/tables`
6. see a visual diff of two sheets with the same structure: `vd --diff foo1.csv foo2.csv`
7. explore an object from the Python REPL: `import visidata as vd; vd.view(obj)`
8. take a random sample from a large .csv: `Shift+R` and give the sample size
9. create an adhoc data pipeline: `Ctrl+D foo.vd` to save the cmdlog, then `vd -b -p foo.vd`
10. rename files: `vd`, [edit the filenames](/docs/edit), then `Ctrl+S` to commit (see [video #4](https://www.youtube.com/watch?v=l2Bpmm0yAGw))

There are hundreds of other uses for VisiData.  The only limit is your imagination!

## Any Format

VisiData loads data from [many different sources](/man#loaders), including json, csv, sqlite, shp, and html.
New loaders are included in every release, and [other data formats can be supported easily](/docs/loaders).

## Any Terminal

VisiData works on Linux and MacOS systems entirely within a terminal, and continues to work seamlessly over ssh and within tmux.  It supports modern terminal features like wide Unicode characters, 256-colors, and even some mouse commands.  Scatterplots are drawn with the Unicode braille character set.

    $ cd data    # if you have some data
    $ ls         # and you're not sure what to do with that data
    $ vd .       # it's time to VisiData

Remember, **if you can `cd`, you can `vd`.**

## Become a VisiData Wizard

* read [An Introduction to VisiData](https://jsvine.github.io/intro-to-visidata/index.html), a tutorial by [Jeremy Singer-Vine](https://www.jsvine.com/).
* browse [the quick reference manual](/man) (also available with `man vd` or with `Ctrl+H` from inside VisiData).
* refer to [the VisiData documentation](/docs).
* watch [the video case studies](https://www.youtube.com/playlist?list=PLxu7QdBkC7drrAGfYzatPGVHIpv4Et46W)
* follow [`@VisiData_`](https://twitter.com/visidata_) on Twitter.

## About the Author

My name is [Saul Pwanson](http://saul.pw) and I'm a [software architect](https://cionic.com/) and [armchair data journalist](https://fivethirtyeight.com/features/a-plagiarism-scandal-is-unfolding-in-the-crossword-world/).  I live in Seattle but the terminal is my home.

I am building an ecosystem of textpunk powertools, and ideally a community of people to appreciate them.  If you love VisiData, please [send me an email](mailto:vd@saul.pw); or if that's too much work, you can just [support me on Patreon](https://www.patreon.com/saulpw).

Share and enjoy!
