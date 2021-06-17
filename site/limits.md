--- 
title: VisiData's Limits to Growth
layout: page
---

## Organically Discovered Consequences of the Design

This is a collection of bugs which are definitely not ideal, but are not worth fixing in the current implementation.

* **Columns added with add-column contain cells which are not copy-paste-able**
    * Bug was described in [issue #413](https://github.com/saulpw/visidata/issues/413).
    * Columns added with add-column are column-major. They store data in themselves "about" rows. Most things will work pretty well, but efficient copy-pasting happens to rely on a [row-major architecture](/blog/2020/row-major).
* **Selecting negative values includes errors and nulls**
    * Bug was described in [issue #402](https://github.com/saulpw/visidata/issues/402).
    * Errors (and nulls) need to exist somewhere specific on the number line so that sorting is stable. Artbitrarily, negative infinity was chosen, so that when a user sorts ascending, the errors would come first. Changing this would fix the selection bug, but then sorting would be unstable. This is undesirable.
