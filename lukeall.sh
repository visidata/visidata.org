#!/usr/bin/env bash

for fn in visidata/docs/*.md ; do
    ./lukeone.sh $fn
done
