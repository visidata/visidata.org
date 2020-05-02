# 10 Ways to Use VisiData

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

    >>> visidata.view_pandas(df)

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

[written by Saul Pwanson 2020-05-01]
