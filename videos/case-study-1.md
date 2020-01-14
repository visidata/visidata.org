# VisiData Case Study #1: Summing Donation Data From a Webpage
This case study was originally a [video](https://www.youtube.com/watch?v=yhunJc8Nu4g). It was transcribed by E / @cel10e on 2019-12-11.

This walkthrough uses VisiData to take a paragraph of donation information from a website ([beginners.re](https://web.archive.org/web/20180307091111/https://beginners.re/)), and getting it into a form that can be easily summed.

In the process, we will cover the following commands/features

* piping stdin into VisiData
* `Ctrl+O` in any edit field to open it with own **$EDITOR**
* `:` to split columns
* `Shift+M` to melt (un-pivot)
* `;` to match by regex capture group
* `$` to type columns as "currency" (a dirty float)
* `z+` to apply an aggregator statistic to the current column and show the result
* adding custom functions to `~/.visidatarc`
* `~` to type a column as a string
* `=` to create a new column by Python expression

Since the donations are all in different currencies, Saul made a plugin called [USD](https://raw.githubusercontent.com/saulpw/visidata/develop/plugins/usd.py) that he uses at a later point of the video. It takes a number and a currency code or currency symbol, and converts it into US dollars based on the current day's currency rates. If you want to follow along with the full tutorial, to the final calculation at the very end, you will need to add it to your `~/.visidatarc` or [install it as a plugin](https://github.com/saulpw/visidata/blob/develop/docs/plugins.md). Then its functions will be added to your session's scope. This is *completely optional*, and only comes to play at the end.

Since the video's creation, [fixer.io](https://fixer.io/) has also added a user api key requirement. To take advantage of the usd plugin, you will also need to create an account, grab an api key, and then set  `options.fixer_key` in your `~/.visidatarc`.

~/.visidatarc
```
options.fixer_key = 'insert_here'
```

## Transcript start

I came across a book called "Reverse Engineering for Beginners," written by Dennis Yurichev. It seems like it's a pretty good book; he's got a bunch information about it, and he also lists the donors who have supported him. I actually really appreciate his transparency here, that he will share all this information on his website. It made me curious as to how much money had been donated to him overall.

![beginners.re](/videos/assets/case-study-1-01.png)

So you'll notice that this information here is in a single line. It's actually not that bad, but it's not in a form that we could easily do something with. So we're going to use VisiData to pick it apart, and try to do a sum of how much money was donated to him.

First we are going to cut and paste this text into our terminal window, and pipe into VisiData directly.

```
echo '2 * Oleg Vygovsky (50+100 UAH), Daniel Bilar ($50), James Truscott ($4.5), Luis Rocha ($63), Joris van de Vis ($127), Richard S Shultz ($20), Jang Minchang ($20), Shade Atlas (5 AUD), Yao Xiao ($10), Pawel Szczur (40 CHF), Justin Simms ($20), Shawn the R0ck ($27), Ki Chan Ahn ($50), Triop AB (100 SEK), Ange Albertini (€10+50), Sergey Lukianov (300 RUR), Ludvig Gislason (200 SEK), Gérard Labadie (€40), Sergey Volchkov (10 AUD), Vankayala Vigneswararao ($50), Philippe Teuwen ($4), Martin Haeberli ($10), Victor Cazacov (€5), Tobias Sturzenegger (10 CHF), Sonny Thai ($15), Bayna AlZaabi ($75), Redfive B.V. (€25), Joona Oskari Heikkilä (€5), Marshall Bishop ($50), Nicolas Werner (€12), Jeremy Brown ($100), Alexandre Borges ($25), Vladimir Dikovski (€50), Jiarui Hong (100.00 SEK), Jim Di (500 RUR), Tan Vincent ($30), Sri Harsha Kandrakota (10 AUD), Pillay Harish (10 SGD), Timur Valiev (230 RUR), Carlos Garcia Prado (€10), Salikov Alexander (500 RUR), Oliver Whitehouse (30 GBP), Katy Moe ($14), Maxim Dyakonov ($3), Sebastian Aguilera (€20), Hans-Martin Münch (€15), Jarle Thorsen (100 NOK), Vitaly Osipov ($100), Yuri Romanov (1000 RUR), Aliaksandr Autayeu (€10), Tudor Azoitei ($40), Z0vsky (€10), Yu Dai ($10), Anonymous ($15), Vladislav Chelnokov ($25), Nenad Noveljic ($50), Ryan Smith ($25), Andreas Schommer (€5). ' | vd
```

![pipe](/videos/assets/case-study-1-02.png)

Now VisiData has that as one of its rows.

![opening](/videos/assets/case-study-1-03.png)

If we reduce this column to just a few characters here, you can see it's actually quite a long field. If you wanted to view the field and see all the contents of it, you can edit it (with `e`), and you can scroll across the whole thing.

![edit](/videos/assets/case-study-1-04.png)

You can also press Ctrl+O to open a single editing cell. This works on any input line. It will open the contents of the cell in your own editor: in this case it's vim, in the terminal. With this, you can see the entire contents. You can also make edits and save them off; they'll be reflected back in the cell. For now, we are just going to quit out of this and cancel the edit.

![editor](/videos/assets/case-study-1-05.png)

What we want to do, is split up that single line according to the individual donations. Each donation is separated by a comma, so we're going to use the split command (`:`). The split command allows you to split the text in any column into two or more columns, based on a provided regex. In this case, the split regex is just a comma (`,`). That will create columns for every individual donation.

![split-input](/videos/assets/case-study-1-06.png)

![split-enter](/videos/assets/case-study-1-07.png)

Now, we're going to hide this first column (`-`), and now we've got every donation in its own cell, which is a great start. This is a horizontal form of the data, but we want the data to be in a vertical form, because that's what VisiData expects. VisiData does statistical operations within columns.

So we're going to use a command in VisiData called 'melt': it's like an un-pivot. It takes data from a horizontal form and swings it down into a vertical form. Now you can see the column names on the left, and the cell values on the right. Now we're ready to go.

![melt](/videos/assets/case-study-1-08.png)

We can move our cursor to the **Value** column, and we're going to use another command. The `;` key extracts part of a column according to regex. We're going to pull out the donation amount from within the parentheses, by constructing a regex. This is the standard regex for extract everything from inside the parentheses: `\((.*)\)`. The inner set of parentheses `(.*)` is the capture group. Everything included in the capture group is going to be pulled into a new column.

![capture](/videos/assets/case-study-1-09.png)

If we wanted to, we could just sum up this set of numbers. It wouldn't be very meaningful, because they're all in different currency units, but we could do it.

There is a type, assigned to keystroke `$`, which I call a currency type. It's really just a dirty float: it takes the initial non-numeric characters and converst them into a float. The trailing non-numeric characters are stripped off. The cells that have a symbol in the middle can't converted, so they will show up as errors. We will ignore those for now. And so now we can approach this as just a column of numbers.

![currency](/videos/assets/case-study-1-10.png)

`+` is used to put an aggregator on a column, which then shows up in future sheets.
Here, we're going to use the `z+` command, which applies an aggregator to the current column and shows the result immediately. And so if we want to sum up the current column, we type `z+` *sum* and there we go. 

![sum](/videos/assets/case-study-1-11.png)

This is about 4,300 units of currency. Again, it's not very meaningful, because they're all in different currencies. Since they are in different currencies, here is where the [USD plugin](https://raw.githubusercontent.com/saulpw/visidata/develop/plugins/usd.py) comes into play. It takes a number and a currency code or currency symbol, and converts it into US dollars based on the current day's currency rates.

To use it, let's convert our currencies back to strings. This will involve using the `~` command. It was so-chosen because it looks like a string to me. Pressing it will type the current column back to a string, like it originally was.

![string](/videos/assets/case-study-1-13.png)

Now, we are going to use `=` to create a new column based on an input Python expression. With that, we are going to use the **USD** function on this **Value_re0** column.

![sum](/videos/assets/case-study-1-14.png)

I'm then going to convert this USD output into a float type. Now we can see that, for instance, this €50 is actually $61 in US money. Others that were already in US money just remain the same.

![float](/videos/assets/case-study-1-15.png)

Now, we can do the same `z+` *sum* as we did before, and see the value in US dollars as of today's rates. That is about $1,470 worth of value: that's the total donations he got from people for his book. It's not quite the full total, because we're missing the ones with errors and such. We could do some more things to make that better, but this is a rough general calculation.

![final sum](/videos/assets/case-study-1-16.png)

Thanks very much for using VisiData, and I will see you next time!
