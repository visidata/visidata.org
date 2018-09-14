# VisiData
## the fastest way to think about your data
## the swiss army chainsaw for data
## data superconductor (zero resistance)
## data lube

# Uses for VisiData

After you've written enough code, thank god there's VisiData.

1. more interactive way to do command line pipes like `grep|awk|sed|cut|sort|uniq`
2. convert data from any format to any format
3. see diffs between two versions of a csv
4. get a first look at downloaded data
5. scrape <table> data from a webpage and save as .tsv
6. take a random sample from a large .csv and save selected columns
7. filter/transform/reshape data for consumption by some other program
8. explore a new Python module
9. get answer to client's question while on the phone with them
10. create an adhoc data pipeline

### 
## 1. Philosophy
  a. The unreasonable effectiveness of properly-structured data
  b. Rows are objects, columns are functions
  c. Everything is tabular data, including internals
  d. commands are short, precise, and repeatable;


## works in any MacOS or Linux terminal, and with ssh/mosh/tmux

VisiData isn't one massive improvement over any one thing.
It's a framework that makes it very easy to add small 1% improvements to a lot of common data tasks.
100 1% improvements is a 270% improvement overall.

$ cd data    # if you have some data
$ ll         # and you're not sure what to do with that data
$ vd *       # it's time to VisiData

VisiData will load a lot of different data formats, including json, csv, sqlite, shp, html.

It's easy to open even large datasets, and start playing with them even before they have finished loading.

## F is for Frequency Sheet:

You can do a [F]requency analysis on any column to see the distribution of its contents.

###

The original impetus behind VisiData was to provide more efficient workflows for terminal users like myself.

As a veteran data worker, I wanted quick access to data at all stages of the pipeline, with support for all kinds of storage systems and formats.
I wanted to be able to focus on the task at hand, without having to spend energy installing or configuring specialized tools just to get a glimpse of the underlying data.

Often I would manage to get what I needed through a combination of UNIX utilities and ad-hoc Python scripts.
But this is like trying to make a microscope from a series of magnifying glasses.

I longed for something more powerful and more efficient.

If you are like me, you work in the trenches of tech, suffering through impedance mismatches, undesigned interfaces, and a glut of libraries and tools of varying quality.
I want to help you focus on [your] actual work, and not all of the distracting nonsense that has become a huge part of [our] daily working lives.

[VisiData](/)|v1.0|Free!|the original multitool, for investigative journalists, data scientists, terminal diehards, and anyone else who has ever done `grep|cut|sort -k` on a csv file

# Design Goals

## For Data Engineers and Hackers

* Pragmatic behavior and defaults.
* Expose internals, like error messages and types.
* Optimize for fewest keystrokes.

## Universal Interface

* One interface is sufficient for basic exploration of any kind of tabular data.
* Internals can be viewed with the same interface.

## Lightweight

* Few dependencies, minimal install steps, and no configuration required.
* Launches with minimal delay, all commands feel snappy.
* Easily integratable into existing workflows.
* Workflow substantially faster and smoother than with existing tools.

## Easy workflow customization, experimentation, and prototyping

* Extensible with user-defined commands and views.
* Entire new standalone applications can be created with minimal code.


# Open Source License

VisiData is an open-source tool that can be installed and used for free (under the terms of GPL3).

[Other licenses are available; please contact vd@saul.pw for information]

The core VisiData utility and rendering library will always be free as in both beer and speech.

If you have questions, issues, or suggestions, please [create an issue on Github](https://github.com/saulpw/visidata/issues).

Or email:
- [Saul Pwanson](mailto:vd@saul.pw) (author)
- [Anja Kefala](mailto:anja.kefala@gmail.com) (package maintainer)

# Contributing

See [CONTRIBUTING.md]().
