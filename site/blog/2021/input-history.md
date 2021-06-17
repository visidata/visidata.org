---
title: "New feature: Persistent input history"
date: 2021-01-10
author: Anja Boskovic
tags:
	- blog
---
Like most tools, VisiData keeps a history of your responses to its prompts, so you can scroll through them in subsequent prompts using the Up and Down arrows.

Up until now, these histories would only be available until the end of the VisiData session.
By default this is still the case, but if you set `options.input_history` to any value, the history will persist between sessions.

~~~
options.input_history = 'lastinputs'
~~~

This will put the history in `.visidata/lastinputs.jsonl`.

![input-history](/blog/assets/2021-input-history.gif)

Input histories are separated based on the *type* of the input (e.g., Python expressions, regex search, regex split, filenames),
The Last Inputs Sheet can be opened with the `open-inputs` command, and edited/saved if desired.

Many thanks to AJ Kerrigan who subbed to Saul at the [Workflow Optimist level on Patreon](https://www.patreon.com/saulpw), and requested that [this feature be kept open in our issues list](https://github.com/saulpw/visidata/issues/468).
This feature is currently in the `develop` branch and slated for release in v2.2.

[written by Anja Boskovic 2021-01-10]
[edited by Saul Pwanson 2021-01-10]
