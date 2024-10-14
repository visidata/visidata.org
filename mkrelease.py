#!/usr/bin/env python3
import sys
import time
from pathlib import Path

ver = sys.argv[1]

blog_tmpl = open('blog-release-tmpl.md').read()
post = blog_tmpl.format(date=time.strftime('%Y-%m-%d'),
                 version=ver)

year = time.strftime('%Y')
blogpath = Path(f'site/blog/{year}/v{ver}.md')
fp = sys.stdout
if not blogpath.exists():
    fp = blogpath.open(mode='w')
print(post, file=fp)
