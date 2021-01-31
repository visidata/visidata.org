# Data science without the drudgery

VisiData is an interactive multitool for tabular data.  It combines the clarity of a spreadsheet, the efficiency of the terminal, and the power of Python, into a lightweight utility which can handle millions of rows with ease.

When you have <select id="infmt">
<option value="input.csv" selected="selected">comma-separated values (CSV)</option>
<option value="https://en.wikipedia.org/wiki/2019%E2%80%9320_coronavirus_pandemic">wikipedia table</option>
<option value="input.log">structured log file</option>
<option value="input.tsv">tab-separated values (TSV)</option>
<option value="input.txt -f fixed">fixed width text</option>
<option value="input.xls">Excel 97 file (.xls)</option>
<option value="input.xlsx">Excel 2013 file (.xlsx)</option>
<option value="input.json">JSON</option>
<option value="input.jsonl">newline-delimited JSON</option>
<option value="input.html">HTML</option>
<option value="input.yml">YAML</option>
<option value="input.h5">HDF5</option>
<option value="input.npy">NumPy (.npy/.npz)</option>
<option value="visidata.view_pandas(df)">Pandas DataFrame</option>
<option value="input.xpt">SAS (.xpt/sas7bdat)</option>
<option value="input.sav">SPSS (.sav)</option>
<option value="input.dta">Stata (.dta)</option>
<option value="input.shp">Shapefile (.shp)</option>
<option value="input.pcap">packet capture (.pcap)</option>
<option value="input.db">Sqlite database (.db)</option>
<option value="input.zip">.zip archive</option>
<option value="vgit">git repository</option>
<option value="">any kind of tabular data</option>
</select>
but you need
<select id="outfmt">
<option value="" selected="selected">a delightful terminal interface</option>
<option value="">to explore the data quickly</option>
<option value=" # 'Shift+F' on any column">to get some quick insights</option>
<option value=" # '=' to add a Python column">to compute Python for each row</option>
<option value="-b -o output.tsv">tab-separated values (TSV)</option>
<option value="-b -o output.csv">comma-separated values (CSV)</option>
<option value="-b -o output.txt --save-filetype=fixed">fixed width text</option>
<option value=" 'e' to edit">to clean up the data</option>
<option value="-b -o output.txt">plain text</option>
<option value="-b -o output.json">JSON</option>
<option value="-b -o output.jsonl">JSON (newline-delimited)</option>
<option value="-b -o output.geojson">GeoJSON</option>
<option value="-b -o output.html">HTML &lt;table&gt;</option>
<option value="-b -o output.sqlite">Sqlite database</option>
<option value="-b -o output.md">Markdown</option>
<option value="-b -o output.jira">Markdown (org-mode) </option>
<option value="-b -o output.npy">Numpy (.npy) file</option>
</select>:

<p id="cmdouter">
<code id="cmdline">
    vd -b input.csv
</code>
</p>

<script type="text/javascript">
    function display() {
        var infmt = document.getElementById("infmt").value;
        var outfmt = document.getElementById("outfmt").value;
        document.getElementById("cmdline").innerHTML = "vd " + infmt + " " + outfmt;

    }

    var infmt = document.getElementById("infmt");
    var outfmt = document.getElementById("outfmt");

    infmt.addEventListener('change', display);
    outfmt.addEventListener('change', display);
    display();
</script>

# [Install Now](/install)

#### Latest Version: [2.2](/blog/2021/v2.2/) (2021-01-30)

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
<a class="" href="https://jsvine.github.io/intro-to-visidata/the-big-picture/visidata-in-60-seconds/">
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

## Tutorial: [English](https://jsvine.github.io/intro-to-visidata/index.html) | [Italiano](https://github.com/ondata/guidaVisiData/tree/master/testo)

## [Quick Reference Guide](/man) (`Ctrl+H` from within VisiData)

## [VisiData Documentation](/docs)

## [Video Case studies](https://www.youtube.com/playlist?list=PLxu7QdBkC7drrAGfYzatPGVHIpv4Et46W)

## [Lightning Demo](https://www.youtube.com/watch?v=N1CBDTgGtOU)

## [10 Ways to Use VisiData](/blog/2020/ten)

## Follow [`@VisiData`](https://twitter.com/visidata) on Twitter.

