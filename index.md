# Data science without the drudgery

VisiData is an interactive multitool for tabular data.  It combines the clarity of a spreadsheet, the efficiency of the terminal, and the power of Python, into a lightweight utility which can handle millions of rows with ease.

# [Install Now](/install)

#### Latest Version: [1.5.2](/releases) (2019-01-12)

<table>
<tr>

<td>
<a class="" href="/formats">
Any data format!
<div class="screenshot">
<img src="/basic-screenshot.png" alt="screenshot of VisiData in action"/>
</div>
Open 1m+ rows in the blink of an eye!
</a>
</td>

<td>
<a class="" href="/docs/freqtbl">
Instant histogram with Shift+F!
<div class="screenshot">
<a href="/freq-move-row.gif"><img src="/freq-move-row.gif" alt="Frequency Table loading, with cursor movement"/></a>
</div>
Press Enter to dive in!
</td>
</tr>

<tr>
<td>
<a href="https://www.youtube.com/watch?v=N1CBDTgGtOU&t=134">
Scatterplots in the terminal!
<div class="screenshot">
<img src="/map-colours.png" alt="Plotting a map with colours"/>
</div>
8-color maps!
</a>
</td>

<td>
<a href="/docs/save-restore">
Save sessions for replay later!
<div class="screenshot">
<a href="/scatterplot-usage.png"><img src="/scatterplot-usage.png" alt=""/></a>
</div>
Adhoc data pipelines in batch mode!
<!--pre>vd --batch input.csv -o output.json</pre-->
</a>
</td>
</tr>

<!--tr>
<td>
Search, sort, filter with regex!
<div class="screenshot">
<a href=""><img src="" alt=""/></a>
</div>
Bulk transform with Python!
</td>

<td>
Includes pandas DataFrame adapter!
<pre>vd.view_pandas(obj)</pre>
<div class="screenshot">
<a href=""><img src="" alt=""/></a>
</div>
Extensible with Python!
</td>
</tr-->

</table>

## Become a VisiData Wizard
* read [An Introduction to VisiData](https://jsvine.github.io/intro-to-visidata/index.html), a tutorial by [Jeremy Singer-Vine](https://www.jsvine.com/).
* leggendo [VisiData: il coltellino svizzero per i dati, che probabilmente non conosci](https://github.com/ondata/guidaVisiData/tree/master/testo), a tutorial in Italian by [Andrea Borruso](https://medium.com/@aborruso) (onData association).
* browse [the quick reference manual](/man) (also available with `man vd` or with `Ctrl+H` from inside VisiData).
* refer to [the VisiData documentation](/docs).
* watch [the video case studies](https://www.youtube.com/playlist?list=PLxu7QdBkC7drrAGfYzatPGVHIpv4Et46W)
* follow [`@VisiData`](https://twitter.com/visidata) on Twitter.

---


## 10 Ways to Use VisiData

### 1. explore datasets effortlessly, no matter the format

    $ vd albums.json dropbox/*.xls* agents.sqlite

Use the arrow keys to move around and `q` to quit.

VisiData loads data from [many different sources and formats](/formats), including [anything pandas can load](https://pandas.pydata.org/pandas-docs/stable/reference/io.html)!

New loaders are included in every release, and [you can create one yourself easily](/docs/loaders).

### 2. convert from any input format into any output format

Within VisiData, press `Ctrl+S` to save the file in the format specified by the extension.

Convert directly from the command-line with:

    $ vd -b input.csv -o output.json

### 3. as an interactive replacement for grep, awk, sed, cut, sort, uniq

    $ netstat -an | vd -f fixed -o used-ports.txt

Press `Ctrl+Q` to exit VisiData and save to the given output file.

### 4. scrape HTML table data from a webpage:

    $ vd https://en.wikipedia.org/wiki/List_of_largest_cities

### 5. see a visual diff of two sheets with the same structure

    $ vd --diff foo1.csv foo2.csv

### 6. explore an object from the Python REPL

    >>> visidata.view(obj)

### 7. explore any pandas DataFrame

    >>> vd.view_pandas(df)

### 8. create an adhoc data pipeline

VisiData can also be used in batch mode with [scripts](/docs/save-restore/) without requiring any interaction.

Save the cmdlog to a .vd file with `Ctrl+D foo.vd`, then replay the saved .vd file:

    $ vd -b -p foo.vd

### 9. rename a bunch of files

1. Launch `vd` in the directory with the files
2. Edit the filenames [(documentation on editing commands)](/docs/edit)
3. `Ctrl+S` to commit (see [this video showing how to use the directory browser](https://www.youtube.com/watch?v=l2Bpmm0yAGw))

### 10. see all the available options and commands

There are many other ways to use VisiData!  To learn more, press `Ctrl+H` to see the [manpage](/man), or `z Ctrl+H` to see the full list of commands available on the current sheet.

---

## About the Author

My name is [Saul Pwanson](http://saul.pw) and I'm a [software architect](https://cionic.com/) and [amateur data sleuth](https://www.youtube.com/watch?v=9aHfK8EUIzg).  I live in Seattle but the terminal is my home.

I am building an ecosystem of textpunk powertools. If you love the design of VisiData, [send me an email](mailto:vd@saul.pw); or you can [support me on Patreon](https://www.patreon.com/saulpw) directly.

Share and enjoy!

