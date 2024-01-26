#!/usr/bin/env python3

# Usage: $0 <foo.md> <out-foo.frontmatter> <out-foo-processed.md>

import sys
import re
from visidata import vd, AttrDict, Sheet

# copied from visidata/guide.py
class OptionHelpGetter:
    'For easy and consistent formatting in sidebars and helpstrings, use {help.options.opt_name}.'
    def __getattr__(self, optname):
        opt = vd.options._get(optname, 'default')
        return f'<a href="/man#options-{optname}">`{optname}`</a>: {opt.helpstr} (default: {opt.value})'


class CommandHelpGetter:
    'For easy and consistent formatting in sidebars and helpstrings, use {help.commands.long_name}.'
    def __init__(self, cls):
        self.cls = cls
        self.helpsheet = vd.HelpSheet()
        self.helpsheet.ensureLoaded()

    def __getattr__(self, k):
        return self.__getitem__(k)

    def __getitem__(self, k):
        longname = k.replace('_', '-')
        binding = self.helpsheet.revbinds.get(longname, [None])[0]
        # cmddict has a SheetClass associated with each command
        # go through all the parents of the Sheet type, to look for the command
        for cls in self.cls.superclasses():
            cmd = self.helpsheet.cmddict.get((cls.__name__, longname), None)
            if cmd:
                break
        if not cmd:
            return ''
        if 'input' in cmd.execstr.lower():
            inputtype = 'input'
            m = re.search(r'type="(\w*)"', cmd.execstr, re.IGNORECASE)
            if not m:
                m = re.search(r'input(\w*)\("', cmd.execstr, re.IGNORECASE)
            if m:
                inputtype = m.groups()[0].lower()
                binding += f'[:45] {inputtype}[/]'

        helpstr = cmd.helpstr
        return f'`{binding}` (`{longname}`) to {helpstr}'

infn, outfront, outrest = sys.argv[1:4]

lines = open(infn).readlines()
assert lines[0].strip() == '---'
with open(outfront, 'w') as fpfront:
  with open(outrest, 'w') as fprest:
    outfp = fpfront
    print('---', file=fpfront)
    for line in lines[1:]:
        line = line.strip('\n')

        m = re.match(r'\[\[GUIDE (.*)\]\]', line)
        if m:
            vs = vd.getGuide(m.group(1))
            guide = ''
            for line in vs.guide_text.splitlines():
                line = line.strip()
                if line.startswith('#'):
                    guide += '##'
                guide += line + '\n'
            helper = AttrDict(commands=CommandHelpGetter(Sheet), options=OptionHelpGetter())
            line = guide.format(help=helper)

        print(line, file=outfp)
        if line == '---': outfp = fprest


