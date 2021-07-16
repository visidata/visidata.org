#!/usr/bin/env python3

# Usage: $0 <foo.md> <out-foo.frontmatter> <out-foo-rest.md>

import sys

infn, outfront, outrest = sys.argv[1:4]

lines = open(infn).readlines()
assert lines[0].strip() == '---'
with open(outfront, 'w') as fpfront:
  with open(outrest, 'w') as fprest:
    outfp = fpfront
    print('---', file=fpfront)
    for line in lines[1:]:
        line = line.strip('\n')
        print(line, file=outfp)
        if line == '---': outfp = fprest


