# save_ext()

[This post affects VisiData v2.-3dev.]

Great news! The api behind savers for file formats has been refined to have a consistent structure.

Now, the declaration for all `save_foo()` will take the form of:

```
def save_ext(p, *sheets())
```

Where `p` is a `visidata.Path()` object representing the file being written to, and `*sheets` will be the 1 sheet or more that are going to be saved.

Not so good news...all VisiData devs will have to update their savers to cohere with this.

This decision was not approached with lightly because VisiData core has at least 16. Since it is a change that breaks backwards compatibility we did want to breakdown how and why savers were defined previously, why we wanted to change the definition, other options we considered, and why we settled on this one.

The previous structure for savers looked like:

```
def save_ext(sheet, p)
```

This was in-line with the standard model of *source* then *dest* found in many commandline tools.

It worked really well up until when Saul wanted to add multisave, a spell for saving multiple sheets with a single incantation.

The existing `save_()` api was very much designed with a single sheet in mind. Python has does have [args and kwargs magic variables](https://pythontips.com/2013/08/04/args-and-kwargs-in-python-explained/), but only for variables declared at the very end. `sheets` could have been modified to be a list, but that would mean adding Is This a List checkers to every `save_`.

This led to him creating a separate `multisave_ext()` that would be called with `g^S`. Most of them looked like this:

```
def multisave_ext(p, *sheets)
```

This inconsistency between `save_ext()` and `multisave_ext()` had some side-effects. VisiData automatically detects which of these functions to call based on the ext provided. 

One bit of the code looked liked this

```
for vs in vsheets:
    savefunc = getattr(vs, 'save_' + filetype, None
    if not savefunc:
        savefunc = lambda p,vs=vs,f=globalsavefunc: f(p, vs)
```

Except this assumes a structure of `save_ext(p, sheet)`, which is not the case for a lot of savers.

This was the breaking point that lead to the decision to create a singular `save_ext()` api (OAFA!) which can handle single sheets and multiple sheets.

Saul mulled over some options for the new api. The other top contender was:

```
Foosheet.save_foo(vs, p, *other_sheets)
```

where `vs` is the `FooSheet` which is calling `save_foo()`. This one was really, really tempting because it would be backwards compatible with existing savers that Saul and other folks have wrriten. But...it did not make sense to arbitrarily prioritise one sheet over the others being saved.

[Written by Anja Kefala 2020-02-13]
