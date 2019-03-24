# Supported Sources

These are the currently supported sources:

- **tsv** (tab-separated value)
    - Plain and simple. VisiData writes tsv format by by default.
    - See the `--delimiter` option.

- **csv** (comma-separated value)
    - .csv files are a scourge upon the earth, and still regrettably common.
    - See the `--csv-dialect`, `--csv-delimiter`, `--csv-quotechar`, and `--csv-skipinitialspace` options.
    - Accepted dialects are *excel-tab*, *unix*, and *excel*.

- **fixed** (fixed width text)
    - Columns are autodetected from the first 1000 rows (adjustable with `--fixed-rows`).

- **json** (single object) and **jsonl** (one object per line)
    - Cells containing lists (e.g. `[3]`) or dicts (e.g. `{3}`) can be expanded into new columns with `(` and unexpanded with `)`.

- **yaml**/**yml** (requires `PyYAML`)

- **pcap** (requires `xpkt`, `dnslib`)
    - View and investigate captured network traffic in a tabular format.

- **png** (requires `pypng`)
    - Pixels can be edited and saved in data form. Images can be plotted with `.` (dot).

The following URL schemes are supported:

- **http** (requires `requests`)
    - can be used as transport for another filetype

- **postgres** (requires `psycopg2`)

The following sources may include multiple tables. The initial sheet is the table directory; `Enter` loads the entire table into memory.

- **sqlite**
- **xlsx** (requires `openpyxl`)
- **hdf5** (requires `h5py`)
- **ttf**/**otf** (requires `fonttools`)
- **mbtiles** (requires `mapbox-vector-tile`)
- **htm**/**html** (requires `lxml`)
- **xml** (requires `lxml`)
    - `v` show only columns in current row attributes
    - `za` add column for xml attributes
- **xpt** (SAS; requires `sas7bdat`)
- **sav** (SPSS; requires `savReaderWriter`)
- **dta** (Stata; requires `pandas`)
- **shp** (requires `pyshp`)

In addition, **.zip**, **.gz**, **.bz2**, and **xz** files are decompressed on the fly.

VisiData has an adapter for **pandas**. To load a file format which is supported by **pandas**, pass `-f pandas data.foo`. This will call `pandas.read_foo()`.

For example, `vd -f pandas data.parquet` loads a parquet file. Note that when using the **pandas** loader, the `.fileformat` file extension is mandatory.

# Supported Output Formats

These are the supported savers:

- **tsv** (tab-separated value)
- **csv** (comma-separated value)
- **json** (one object with all rows)
    - All expanded subcolumns must be closed (with `)`) to retain the same structure.
    - **.shp** files can be saved as **geoJSON**.
- **md** (org-mode compatible markdown table)
- **htm**/**html** (requires `lxml`)
- **png** (requires `pypng`)

Multisave is supported by **html**, **md**, and **txt**; `g^S` will save all sheets into a single output file.
