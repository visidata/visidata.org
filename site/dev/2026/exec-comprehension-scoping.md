---
title: "TIL: List comprehensions can't see exec() locals in Python < 3.12"
date: 2026-03-06
author: Saul Pwanson
tags:
    - til
    - python
---

*[Written by Claude Opus 4.6; reviewed and approved by [Saul](https://saul.pw)]*

Today we discovered why a VisiData command worked on Python 3.12 but crashed with `NameError` on Python 3.9.

## The command

```python
FreqTableSheet.addCommand('zEnter', 'dive-except',
    'vd.push(openRows([r for r in rows if r is not cursorRow]))',
    'open source sheet excluding current bin')
```

VisiData commands are strings that get `exec()`'d, with the sheet's attributes available as locals via a custom mapping.
Both `rows` and `cursorRow` are properties on the sheet.

On Python 3.12+, this works fine.
On Python 3.9, it raises `NameError: name 'cursorRow' is not defined`.

## Why

In Python < 3.12, list comprehensions create their own scope — they compile to an implicit nested function.
The `exec()` locals dict is **not** a real closure scope, so the comprehension's inner function can't see it.

Here's the minimal reproduction:

```python
d = {'items': [1, 2, 3], 'target': 2}
exec('[x for x in items if x != target]', {}, d)
# Python 3.9:  NameError: name 'target' is not defined
# Python 3.12: [1, 3]
```

The subtle part: `items` works because the iterable expression in `for x in items` is evaluated in the **outer** scope (the exec context).
But `target` in the `if` clause runs **inside** the comprehension's implicit function, where exec locals are invisible.

[PEP 709](https://peps.python.org/pep-0709/) (Python 3.12) inlined comprehensions, eliminating the nested scope entirely. So on 3.12+, everything in a comprehension shares the enclosing scope, and the problem disappears.

## The fix

Extract the comprehension into a real method, where normal Python scoping rules apply:

```python
@Sheet.api
def exceptRows(sheet, exceptrows):
    if not isinstance(exceptrows, list):
        exceptrows = [exceptrows]
    return [r for r in sheet.rows if r not in exceptrows]

FreqTableSheet.addCommand('zEnter', 'dive-except',
    'vd.push(openRows(exceptRows(cursorRow)))',
    'open source sheet excluding current bin')
```

Now `cursorRow` is evaluated in the exec scope (where it's visible), and the comprehension runs inside a normal method with normal scoping.

## The lesson

If you use `exec()` with a locals dict and need to support Python < 3.12: **never reference locals inside a comprehension filter or body**.
The iterable (`for x in thing`) is safe; everything else is not.
