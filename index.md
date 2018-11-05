# A Swiss Army Chainsaw for Data

VisiData is an [open source](https://github.com/saulpw/visidata) supertool for exploring and manipulating data.
It combines the clarity of a spreadsheet, the efficiency of the terminal, and the power of Python, into a lightweight utility which can handle millions of rows with ease.

## Some uses for VisiData

1. [an interactive replacement for `grep|awk|sed|cut|sort|uniq`](/docs/rows)
2. [convert data from any supported format to a different format](/docs/loading#convert)
3. [get a first look at downloaded data](/docs/navigate)
4. [scrape HTML table data from a webpage](https://youtu.be/0iJ9F4uTkz8?t=28)
5. [see a diff of two sheets]()
6. [filter/transform/reshape data for consumption by some other program](https://jsvine.github.io/intro-to-visidata/basics/understanding-rows/)
7. [take a random sample from a large .csv]()
8. [explore a Python module]()
9. [create an adhoc data pipeline]()
10. [rename files en masse without fear](https://www.youtube.com/watch?v=l2Bpmm0yAGw)

## Any format

VisiData loads data from [many different sources](), including json, csv, sqlite, shp, and html.

## Any terminal

VisiData works on Linux and MacOS systems, and performs well over ssh and within tmux.  It can be used on Windows with WSL.

    $ cd data    # if you have some data
    $ ll         # and you're not sure what to do with that data
    $ vd .       # it's time to VisiData

Remember, **if you can `cd`, you can `vd`.**

## Become a data wizard

VisiData is like a magic wand.  The more you learn about the tool, the more power you will wield.

* Read [An Introduction to VisiData](https://jsvine.github.io/intro-to-visidata/index.html), an awesome tutorial by [Jeremy Singer-Vine](https://www.jsvine.com/).
* [Install VisiData](/install).
* [Browse the manpage](/man).
* [Refer to the VisiData documentation](/docs).

## About the Author

My name is [Saul Pwanson](http://saul.pw) and I'm a [software architect]() and [armchair data journalist](https://fivethirtyeight.com/features/a-plagiarism-scandal-is-unfolding-in-the-crossword-world/).  I live in Seattle but the terminal is my home.

I am building an ecosystem of textpunk tools.  [You can support me on Patreon.](https://www.patreon.com/saulpw)
