# Supported Sources


These are the currently supported sources:

- **tsv** (tab-separated value)
    - Plain and simple. VisiData writes tsv format by default.
    - See the `--tsv-delimiter` option.

- **csv** (comma-separated value)
    - .csv files are a scourge upon the earth, and still regrettably common.
    - See the `--csv-dialect`, `--csv-delimiter`, `--csv-quotechar`, and `--csv-skipinitialspace` options.
    - Accepted dialects are *excel-tab*, *unix*, and *excel*.

- **fixed** (fixed width text)
    - Columns are autodetected from the first 1000 rows (adjustable with `--fixed-rows`).

- **json** (single object) and **jsonl** (one object per line)
    - Cells containing lists (e.g. `[3]`) or dicts (e.g. `{3}`) can be expanded into new columns with `(` and unexpanded with `)`.

- **yaml**/**yml** (requires `PyYAML`)

- **xml** (requires `lxml`)
    - `v` show only columns in current row attributes
    - `za` add column for xml attributes

- **npy** (requires `numpy`)
    - For NumPy explorers that are working in the terminal and yearn for visibility into their data.

- **pcap** (requires `xpkt`, `dnslib`)
    - View and investigate captured network traffic in a tabular format.

The following URL schemes are supported:

- **http**/**https** (requires `requests`)
    - can be used as transport for another filetype.

- **postgres** (requires `psycopg2`)
    - `vd postgres://`*username*`:`*password*`@`*hostname*`:`*port*`/`*database* opens a connection to the given postgres database.

The following sources may include multiple tables. The initial sheet is the table directory; `Enter` loads the entire table into memory.

- **sqlite**/**sqlite3**
    - supports saving for CREATE/INSERT (not wholesale updates)
    - `^S` to commit any `add-row`/`edit-cell`/`delete-row`

- **xls**/**xlsx**/**xlsb** (requires `openpyxl`)

- **hdf5** (requires `h5py`)

- **htm**/**html** (requires `lxml`)
    - load all `<table>`s in a web page as VisiData sheets.

- **xpt** (SAS; requires `sas7bdat`)

- **sav** (SPSS; requires `savReaderWriter`)

- **dta** (Stata; requires `pandas`)

Formats can be edited in raw data form. Images can be plotted with `.` (dot).

- **shp** (requires `pyshp`)

- **mbtiles** (requires `mapbox-vector-tile`)

- **png** (requires `pypng`)

- **ttf**/**otf** (requires `fonttools`)

In addition, **.zip**, **.gz**, **.bz2**, and **xz** files are decompressed on the fly.

## Loading file formats which are supported by pandas

VisiData has an adapter for **pandas**. To load a file format which is supported by **pandas**, pass `-f pandas data.foo`. This will call `pandas.read_foo()`.

For example:

~~~
vd -f pandas data.parquet
~~~

loads a parquet file. When using the **pandas** loader, the `.fileformat` file extension is mandatory.

# [Supported Output Formats](#output) {#output}

These are the supported savers:

- **tsv** (tab-separated value)
- **csv** (comma-separated value)
- **json** (one object with all rows)
    - All expanded subcolumns must be closed (with `)`) to retain the same structure.
    - **.shp** files can be saved as **geoJSON**.
- **txt**
- **md** (markdown table)
- **htm**/**html** (requires `lxml`)
- **png** (requires `pypng`)
- **xml** (requires `lxml`)
- **npy** (requires `numpy`)
- **vd**
    - Command history log format for a VisiData session.
    - `^D` to save the current session's CommandLog.

Multisave is supported by **html**, **md**, and **txt**; `g^S` will save all sheets into a single output file.
