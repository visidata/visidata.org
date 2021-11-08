# Approaches to most frequent environment problems

TODO: I am writing this in a personal tone, is the best voice for this piece?
TODO: I am writing this VisiData specific, should I broaden it to a general Python application audience?

At some point when trying to help a user debug an issue, it becomes clear that there is likely a NEBULOUS ENVIRONMENT PROBLEM. Without direct access to someone's system, I am limited in my ability to help them with all of the range of unique environmental setups. However, if someone is using a package manager, with its default out-of-the-box configuration, I can at least provide some guidance on the Most Likely Way to clean things up.

This article covers the following scenarios. If you do not see your scenario listed, file an issue with your advice, and I will endevour to add it!

* You are trying to upgrade VisiData to benefit from a bugfix. You continue to see the bug, and you suspect you are still using the older version.
* You would like to install an additional dependency to use a [VisiData loader](https://visidata.org/formats).

## An older version exists somewhere on your system

- TODO how can you tell which version of VisiData you are running?

The most likely way that folks run into this problem, is that they used multiple different package managers to install VisiData. This is a very normal thing to happen; I have been bitten by this a handful of times. Sometimes it is because not all package managers have the most recent cutting edge. Sometimes it is because you genuinely forgot the method you used to install it for the first time.

To help with debugging this, I will outline where the most common package managers are likely installing VisiData. This will help with finding all the possible places it can be lingering, so you can remove older versions.

https://til.simonwillison.net/homebrew/upgrading-python-homebrew-packages


### pip
    - pip list -v | grep visidata
    - $(head -1 $(which vd) | sed -e 's/#!//') -m pip show visidata
        - sometimes folks have a vd binary in one spot, but who knows what the heck pip binary they used and what virtualenv they targeted
    - common pip installation locations (user and system level, virtualenvs, python version)
        - Mac
        - Linux
### homebrew
        - brew --prefix visidata
            - tells you the installation path for that Homebrew package
        - brew --cellar visidata
            - the actual cellar location
        - brew info visidata
            - gives more detailed location information
        - common installation location
        - /usr/local/Cellar/
            - with symlinks in /usr/local/opt/ or /usr/local/bin?
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
