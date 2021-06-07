# The Most Important Line Of Code in VisiData

When I peer into the soul of VisiData, this is what I see as the 'essence'.
What brings together the design, the architecture, and the interface into one cohesive whole.
It represents the foundation that VisiData is built on.

Any port or reboot would almost certainly include a single line of code much like it.

In `ColumnSheet.reload()`:

        self.rows = self.source.columns

This is where it all comes together.  Since `rows` is a list of arbitrary objects, and `columns` is a list of `Column`, we can create a meta-sheet, with the rows of the `ColumnsSheet` being the columns of the `source` sheet.

Then with a few Column attributes and a simple command--we can summon a Columns Sheet, which makes it easy to edit Column attributes.  All of the power, with only the essential development effort.
