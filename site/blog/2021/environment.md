# Approaches to most frequent environment problems

TODO: I am writing this VisiData specific, should I broaden it to a general Python application audience?

At some point when trying to help a user debug an issue, it becomes clear that there is likely a Nebulous Environment Problem. Without direct access to someone's system, I usually feel limited in my ability to help them. However, if someone is using a package manager, with its default out-of-the-box configuration, we can do a bit better than, "Sorry, can't help". We can at least provide some guidance on the Most Likely Way to clean things up.

This article covers the following scenarios. If you do not see your scenario listed, [file an issue]() detailing it, and I will endevour to add it!

* Which version of VisiData is running?
* How to find all of the places where I might have VisiData installed?
* How to install an additional dependency to use a [VisiData loader](https://visidata.org/formats)?

## Which version of VisiData is running?

The basic answer is run `Ctrl+V` within VisiData, or `vd --version` on the commandline.

If you have VisiData's development branch installed, the version will have the suffix `dev` (for example, the version could be '2.6dev'). At the moment, there is no way to confirm which is the most recent commit hash for the in-development VisiData that is running.

## How to find all of the places where I might have VisiData installed?

Often folks are trying to update VisiData, to resolve a bugfix, and find themselves continuing to see the bug. Sometimes, it is because we missed an edge case, but often it is because there is an older version of VisiData still somewhere on their system.

The most likely way that folks run into this problem, is that they used multiple different package managers to install VisiData. Sometimes, it happens because python3-pip can have different environments where it is installing libraries (global vs user, python version specific, virtual environments, etc).

To help with debugging this, I will cover the package managers I am familiar with, and some strategies to find where they have installed VisiData.



### pip

- `pip list -v | grep visidata`
    - This command will probably be sufficient to find a pip-installed VisiData, if you have a default python setup.
    - `pip list` will list installed packages. The flag `-v` signifies verbosity, and will list the precise installation locations.
    -`| grep visidata` will filter the output of `pip list` for only the lines that reference `visidata`. It is optional,

- `(head -1 $(which vd) | sed -e 's/#!//') -m pip show visidata`
    - Additional help for folks who have a more complicated set-up. They have vd binary in one spot, but who knows which pip binary they used and which virtualenv they targeted.
    - This command will check the [shebang]() in the vd binary, filter it for the exact executable used to run VisiData, It will then use that executable to run `pip`.
    - `pip list` will display the location for One of the installations for VisiData. This commandline magic will track down the location for the specific VisiData library that `vd` is calling,
    - h/t ajkerrigan

### homebrew

Common homebrew installation locations are `/usr/local/Cellar` with symlinks shown by `brew --prefix` (seems to usually be `/usr/local/opt` or `/usr/local/bin`.

- `brew --prefix visidata`
    - tells you the symlink location
- `brew --cellar visidata`
    - the actual cellar location for VisiData
- `brew info visidata`
    - gives more detailed location information

If you want to upgrade VisiData within the Homebrew provided virtual environment (instead of removing the old virtual environment):
- use `head -n 1 $(which vd)` to find the python executable running VisiData (e.g. `#!/usr/local/Cellar/visidata/1.5.2/libexec/bin/python3.8`)
- reference the pip that is in the same folder to upgrade VisiData
    - e.g. `/usr/local/Cellar/visidata/1.5.2/libexec/bin/pip install -U visidata`
- h/t [simonw](https://til.simonwillison.net/homebrew/upgrading-python-homebrew-packages)

### apt
        - dpkg -L visidata
            - shows all the files copied to various locations 
            - talk about every single one, and what it means
        - what is the most likely location visidata is installed?

## You want to install the dependency for an additional loader
### pip
### homebrew
- https://til.simonwillison.net/homebrew/upgrading-python-homebrew-packages
### apt


#### To do All of this for Windows? 
#### To do Control keys
* The keystrokes you are using are not having the expected behaviour, and you would like to understand why.
