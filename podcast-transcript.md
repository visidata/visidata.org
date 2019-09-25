# Exploratory Data Analysis Made Easy at the Command Line

This is a lightly edited transcript of an interview about VisiData in this [episode of Python.__init__](https://www.pythonpodcast.com/visidata-exploratory-data-analysis-episode-230/).

<iframe title="Podlove Web Player: The Python Podcast.__init__ - Exploratory Data Analysis Made Easy At The Command Line" width="768" height="290" align="centre" src="https://cdn.podlove.org/web-player/share.html?episode=https%3A%2F%2Fwww.pythonpodcast.com%2F%3Fpodlove_player4%3D588" frameborder="0" scrolling="no" tabindex="0"></iframe>



Some of the things discussed:

- VisiData's history.
- Where we are headed with 2.0.
- Some of the bonkers ways user's have played with it.

Enjoy!

Tobias Macey
0:00:14
Hello, and welcome to podcast, the podcast about Python and the people who make it great. When you're ready to launch your next app or want to try a project you hear about on the show, you need somewhere to deploy it. So take a look at our friends over at winnowed. With 200 gigabit private networking, scalable shared block storage, node balancers, and a 40 gigabit public network all controlled by a brand new API, you get everything you need to scale up. And for your tasks that need fast computation, such as training machine learning models and running your continuous integration, they just launched dedicated CPU instances, go to Python podcast.com slash the node that's LINODE. Today to get a $20 credit and launch a new server and under a minute, and don't forget to thank them for their continued support of this show. And you listen to this show to learn and stay up to date with the ways that Python is being used, including the latest in machine learning and data analysis. For even more opportunities to meet listen and learn from your peers you don't want to miss out on this year's conference season. We have partnered with organizations such as O'Reilly Media Day diversity Caribbean global Intelligence Center data Council. Upcoming events include the O'Reilly AI conference, the strata data conference, the combined events of the data architecture, summit and graph forum and data Council in Barcelona. Go to Python podcast.com slash conferences today to learn more about these and other events and take advantage of our partner discounts when you register your host as usual as Tobias Macey and today I'm interviewing Saul Pwanson about VisiData, a terminal oriented interactive multi-tool for tabular data. So can you start by introducing yourself?

Saul Pwanson
0:01:47
Yeah, I'm [Saul](http://www.saul.pw/) and I've been working in the software industry for a while in Seattle.

Tobias Macey
0:01:55
And do you remember how you first got introduced to Python?

Saul Pwanson
0:01:57
Yeah, it was for work back in 2000. For, so I thought two years, I was at a startup and they were using it for their apps. And I picked it up because that's what you do, right.

Tobias Macey
0:02:06
And so at some point, you decided that you needed to start building your own multi tool for working with data, particularly in tabular formats. And I'm wondering if you could just start by describing a bit about the tool that you built in the form of VisiData and some of the backstory of how it got started?

Saul Pwanson
0:02:24
Yeah. So I was
0:02:26
working at a company called [f5 networks](https://www.f5.com/) in 2011, I think and I built up early prototype VisiData for them, basically, I didn't know it at the time, it was just the configuration and, kind of, exploration tool for their own networking hardware. But as I got to using it, I, it was funny, the concept was very flexible, and I kept adding more and more stuff to it. And then after I left f5, I found myself missing it, I kept wanting to use it to just look at like HDF5 files or just random tabular that I had. And so when I was at another company in 2016, and that company was winding down, I was turning 40. And I look back over my career of almost 20 years and realized that I didn't have very much to show for it. And I was like, well, I've been wanting this tool just kind of around about so let me just start that, again, I couldn't use the code that I had written at f5, obviously. So I was like, Well, if I rewrite it, let me do it. Again, from scratch. I'll do it right once and for all, like
0:03:19
tool that I want to use.

Tobias Macey
0:03:20
So that's the genesis of it. There are a couple interesting things in there. One, the fact that you had to try and rewrite this tool from scratch largely from memory without copying the exact code that you had written. And then also, you mentioned HDF5 files. And I'm curious, have you experimented with [PyTables](https://www.pytables.org/) at all or any of the other libraries for that particular data format, and what you found lacking that you wanted to have present in VisiData?

Saul Pwanson
0:03:44
Yeah, so I hadn't used PyTables. But I've used a lot of other Python tools for using HDFS files. And just like with any complicated format, you can do anything you want to with Python, Python is really great for that. But it's still kind of a hassle, you still have to write code to do it. And often, what I would want to do is just open an hdf5 file and do a quick check and see if that the differences isn't all zeros or has tables that I want in there. And the tools that I had, there was one that was written in Java. And so of course, you started off and it would take like three seconds to start. And then it actually had a bug in it so that it would modify the data, if there was anything afterwards, it was kind of truncated, I was read only. And so just every kind of tool for just quick exploration didn't really work for that purpose. I was really missing that really rapid just show me the data. I want to see it from my own eyes, and then pop back out.

Tobias Macey
0:04:32
And then for the sake of you rewriting this tool from scratch, I'm curious if there was any functionality in the original tool that you either consciously left out because it didn't suit your particular needs of the time, or any functionality that you tried to replicate but weren't quite able to match because you didn't have the necessary context that you would had at the time when you were working at f5?

Saul Pwanson
0:04:53
Yeah, that's a really great question. I don't, I really mean, I've been working on this tool now, for a lot longer than I worked on the original prototype that I had made. But because it was a networking company, one of the things that was in the original version that I still haven't added, and maybe someday I can add, it won't be that big of a deal, but was the ability to add like a derivative column because it was live updated from actual data on the device, what you want, if you see like the bytes transport, for instance, then you could add another column, that would be the derivative of bytes transfer bytes per second. And you can kind of do that for any column you wanted to. And that was a super handy feature. But I am finding that this is used more for static data now than it was than the original tool, was at f5, and so that feature hasn't been added. I do remember that that prototype had pop up like little, you know, if you want to change a field between 10 values and enumeration, there's a little modal pop up, that would show up and you could scroll down and pick the right option that was always kind of a neat little feature made things a little easier to use. Like right now if you have to add an aggregator you look at on the on the bottom line for the list of them, which I still don't quite like but I decided to not add modal dialogues to visiData and that if you want to see something, you have to go to a fresh sheet, if you're going to go to a fresh thing, or the modal modality is just in the bottom status line. That was a conscious design decision. It looks like flash to have the pop ups. But as I'm doing more design work, I see that modal dialogues kind of get in the way, you know,

Tobias Macey
0:06:21
you mentioned that the common use case for VisiData now is for static data, wondering if it does have any capacity for being able to process continuously updating information such as the Top command in Linux or the network streams that you are build the original tool for.

Saul Pwanson
0:06:38
Yeah, absolutely. And in fact, one of the things I would love to have more of are adapters or plugins or loaders for other things like Top. Tops a great example. And I've got some prototypes of [vgit](https://github.com/saulpw/visidata/tree/develop/vgit) but that is still kind of more static data. I do have a vping, which goes out as kind of a combination trace route and paying its kind of live updates as it's finding the various hops and their latencies and stuff like that. But then it turns out that every one of these applications is a pile of work. And I've been devoting so much to the VisiData core application that I found myself not having a lot of time to polish the other ones that to the degree that I want to. So I wish that I had that that time where I find somebody that wanted to work on that with me. But I've been focusing on the other end.

Tobias Macey
0:07:22
I'm curious what the main use cases are for VisiData that you have found both personally and within the community, and in particular, which tools it has replaced in your toolbox for things like systems administration, or data analysis that you might reach for otherwise, but VisiData is just more convenient to use.

Saul Pwanson
0:07:43
Mm hmm. So it seems like one of the main use cases is to get a first look at downloaded data. I know that [Jeremy Singer-Vine](https://www.jsvine.com/), who is the data editor at BuzzFeed, uses it all the time, for example, this purpose, you know, because you find data all the time online is public data, or even if it's not. And you don't know if useful even and you don't want to spend a lot of time investing in it, putting it into a database, for instance, or getting it into some form. We just want to see right now just show me like the first, the columns and the first you know how many rows and I know, quick search or however you do, and be able to get to that instantly, as opposed to doing any amount of coding or work is one of the huge benefits of it. And so I would say that that is the main thing that it's super useful for as an exploratory tool. And then the other thing that I find it super useful for is basically just getting data from one format and structure into another format and structure. So you know, if you just need this one-off thing, it's like you've got this pile of data here, whether it's an Excel spreadsheet, or even just piped in from another command, and you want to remove those four columns and add another computer column and just save that off and pass it off, you can get that done in like 30 seconds, whereas using another tool is going to take you at least minutes to get those tools put together and write the code wherever you're going to do and probably more like a half an hour. So it's one of those one-off scripts that I think has replaced for me.

Tobias Macey
0:09:03
Yeah, there are definitely utilities both in the general user space libraries, particularly for Linux, but also in Python that can do direct conversion between formats. But the workflow you were describing of being able to manipulate the information before you committed to the other format is definitely something that would typically require a lot more effort and exploration to make sure that you're getting things right. And then once you do get it working, you're likely to use it repeatedly. But it's going to be much more static and brittle than if you were to use VisiData in a more exploratory fashion. And I know that it also supports being able to build pipelines for that repeatable use case as well. So I'm wondering if you can just talk through an overall typical workflow for data exploration and analysis, and also the sort of conversion workflow that you might use VisiData with?

Saul Pwanson
0:09:52
Yeah, okay. So a typical workflow, for instance, might like download some data from the internet, like, for instance, data dot Boston, everybody's got their own public datasets, right. And so you open it with VisiData poke around, see what's there, I like to see the scope of the data. And the precision basically, you know, how Why does it get and how much individual pieces do you get, how clean it is, and how useful it is, for our purposes. And then as I'm browsing around, I find that oh, this column seems interesting. I wonder what's in here. And because there might be, you know, a million rows in here, it's hard to see that enough. And it's sorted by a certain in a certain form. And so I do a frequency analysis very often Shift+F is, I think, one of my favorite things about it. And so, you know, you just Shift+F on any column, and within, maybe instantly, or at least a couple of seconds, you can see the top value in that column and the number of number of rows in that column total. And I think it's really great for finding if there's any anomalies or outliers in the data. So you can kind of use it as a quick sanity check as like, Oh, I see, there's really no data in that field, or seldom as a day of that field, or that's interesting, why are there half a fields completely empty, etc. So that's one workflow. And what happens is, once I find something that I've gotten into a state that I want it, then it's pretty easy to revisit the command log, and, you know, call it down to get all of the stuff that I really want, and then save it off. And then I can do that repeatedly, if it's something that that data might be updated, or I want to share that with somebody else. In fact, one of the things that's been interesting is how useful the command log has been for debugging for when people say, this is what I've literally had to do or been doing with this. And this is the input that I have, and here's the command log that are running over it. And it's interesting how I will look at the command log, and it's like, oh, I wouldn't have known that you press that you did that exact command here or on that row. And that changes everything that is the way that I can figure out what's going wrong in it. So it's a really useful at the back again to the replay,

Tobias Macey
0:11:48
I'm going to give you a good and talk a bit more about the command log, because as you said, it's definitely frequent that you might be running through an exploratory cycle. And you finally get to a good state, but you don't necessarily remember are all the steps that you've run through. And you may have deleted code or added new code, so you don't know exactly what the flow was. Whereas by using a more keyboard oriented tool, you can keep that history and see what the overall workflow was. I'm curious if you can just discuss the command log and how it manifests in VisiData and some of the benefits and drawbacks that it might provide.

Saul Pwanson
0:12:21
Yeah, so the command log is one of those. So as far as I'm concerned, VisiData, it is a grand experiment. Like I mentioned, I made it as just a browsing tool, like a CSV browser, as I used to call it. And then it turns out that it's very broadly useful. Like it turns out that spreadsheets and tables are a very universal construct. And so I just kind of like I was at the [Recurse Center](https://www.recurse.com). In early 2017, I was just playing around, I was like, I wonder if I can record all actions into a table itself. And I just did that and didn't work at first, and I was recording all the motions and everything else. I was like, Oh, that's a mess. But then once I took those ones out, it didn't blow me analog, how it actually works remarkably well. And I think it's actually super handy. It's not as good. Obviously, as a Python script, like you can only have one input field like it's very have a rigid structure. But given the limited amount of data that's on the thing on the command log, it's remarkably flexible, and powerful. I'm very surprised about that. There is one thing that I do wish that I could solve. And I'm sure that you know, it is solvable, but I haven't had to solve it yet. And that's that the command log reports every action that you take, including all the dead ends that you wind up finding yourself in. And so those are sometimes handy to have on so you can see what you did and what you didn't want to keep around. But when you're getting to the end, and you're like I want to do this, again, you want to call all those dead ends out right, and just get to the place that you currently are. And so to have some kind of graph or tree that would get you from where you currently are and only show the commands that you took to get there. That's what I really want to add to it. And I just haven't gotten to that point yet.

Tobias Macey
0:13:56
And another thing that you mentioned. And then I also noted in the documentation is the case where you have a file, which might have millions of lines, which would typically be either difficult or impossible to open in a more traditional terminal oriented editor, such as BM or Emacs or the less pager. And I'm curious what types of performance strategies and techniques you've used to be able to handle files like that, and particularly being able to manipulate them without just exploding your memory usage.

Saul Pwanson
0:14:30
So one thing is that actually does explode memory usage doesn't say it doesn't explode as much as some other things, but in my mind, XES they have a lot of memory. But beyond that, though, the one thing that really I think there's a couple things that matter here. One is that I there's an [asyncthread](https://github.com/saulpw/visidata/blob/develop/visidata/vdobj.py#L16) decorator that you can add to any function in VisiData. And that means that when you call that function, it just spawns a thread and goes off and does it asynchronously. And there's always one main interface thread that keeps active that is constantly updating with the status of that. And then within that thread, you can add a little progress meter. And those are pretty easy to do. But the main thing is because that is so easy to spawn additional threads, I do that all the time, whenever I'm doing anything that might take a while. And I know that any kind of linear operation on data, because you might have millions of rows might actually take a while. So I want to make that spin off its own thread. And that keeps me conscious of how much time things are taking for one thing.
0:15:22
But I want to say that I actually don't think VisiData is
0:15:25
fast. In itself. It's just responsive. and responsiveness matters more than speed, it turns out, I would rather spend 10 seconds, seeing a progress meter update and making to the end, than five minutes with no progress and not knowing how long it's going to take it all the one is kind of soothing, I can take a break for 10 seconds. And the other one is very frustrating and makes me almost on edge just like do I need to do something here in order to kill it or before it takes over my entire computer. And then the other thing that's I've been, I think that it is important is that tools like Excel are available. Often they want to own the data, they want to import it into their own structure and format. And that's what causes the thing to really blow up because now you've got, you know, stuff has every cell has to be stored separately and its own custom thing. Whereas the key I think architecture thing that has it has that is super makes it so flexible, is that it stores the rows natively. And so whenever I get from whatever Python library or whatever that's just becomes the row, every item is just that object. And then columns are basically lenses into those rows. And so it basically is taking the computing the cells every time it doesn't grab the cells and put them in there, it just goes ahead and computer whenever you want to see it. And it's adding a column trivially to add a column in constant time. And that also means that saving for instance is comparatively slow, because it means has to do the evaluation of all those columns for every single cell when it saving. But it turns out, you don't actually have to save everything. Usually, you're not actually looking at everything, only looking at that, that the first hundred rows or these columns or whatever. So I feel like those between the threading and the row column rows as objects and columns, functions architecture, that's what really helps it stay focused on the user experience like that,

Tobias Macey
0:17:12
can you dig a bit more into the architecture and implementation of VisiData itself and some of the ways that it has evolved since you first started working on it. And I know that you've also got an upcoming 2.O release. So maybe talk a bit about some of the evolution that's coming there. And then any libraries or language features that you have leaned particularly heavy on and found most useful in your work.

Saul Pwanson
0:17:34
So probably the
0:17:36
biggest evolution is that when I first was doing it, it actually started out as a single, a single file script, I kind of put everything into a single vdtui.py. And the idea was that it was a drop in thing, you could kind of copy it over to a server over SSH, and then you start using it and you wouldn't need anything but the base Python license that is MIT. And then as I started adding more kind of modules are putting against like internal plugins to it, I listened to those as GPL. Three, I was trying to keep this like great clean separation, because the idea was that you could use them the speedy vdtui, which was very similar to the thing I had f5 for making all kinds of other apps. But then nobody really took me up on that. And it's kind of hard to use somebody single file emulate that. nessa so super tight little library. And so I kind of gave up on that. And and now heading more towards kind of more plugin platform architecture revisited. The app is the thing that hosts the individual plugins that you can add, and maybe there'll be a plug in for may even wind up having a vgit application that you can use. But it'll be it's kind of turning on its head as opposed to incorporating vdtui some particular version of your thing, you're actually using the data library.
0:18:46
And so then beyond that,
0:18:49
it's now just a bigger open source project. It's got a whole packaging release cycle. And I'm working with [Anja](http://anja.kefala.info), who has been very instrumental in some of the packaging and tech and documentation stuff that we've been doing. And it's just kind of taken off and behind and gain more traction in that sense. And you asked about the libraries that I liked, and stuff, I'm actually one of the things I want to doing also to keep performance good is I think very few dependencies, I feel like layers is how things get messy. And so the fewer layers that you have, the better off, it'll be if you can wind up coating everything in between there. So the libraries that I use, obviously, curses is essential. But that's built into the Python standard library. Now Python standard library is really fantastic. And, and everything's included, which is super, super bonus. But then also the PyPI ecosystem in general is so broad that any format that I come across html5 or Excel or whatever, they have a library already for it. And it's a library, you can just use in Python and like you read a page of code and you've got the stuff in there. And then all the loaders really are just importing those libraries, and then putting the rows of the return in there and having some columns around nice, pretty simple concept. One thing you mentioned. Other, you want to know other ways that keep this in a fast, I've been very focused on making sure that starts up very quickly. Like I think I feel like if it gets to be a half second of startup time, it just gets in the way it feels like a certain kind of friction. And so one thing that I do a lot of is lazy importing. So all these libraries, I have no idea how long they're going to take to load or sharp themselves. And I know that there are some pretty heavy ones, even in VisiData the physical use sometimes, but I don't use those unless I need to. And so when you open up an Excel file, for instance, that's where it's an import the XLS library. And if you don't ever load an Excel file, didn't have to and have to spend the time doing that. So that's a other one of those tricks. And before we move on, I wanted to mention the Python dateutil library is one of those, like, I don't take many dependencies, but that's one that I've been very happy to take. Because it parses any date format that you can throw at it like if you can, if it can be parsed, I feel like it will parse it. And so it is it's amazing. It's the best in class detection and parsing parsing tool. And also, other feature that I have used a lot is Python decorators. I'm not sure. I mean, I think that's pretty standard thing. But I use them as just a way of tagging functions. For instance, I mentioned to a single thread decorator taking a pretty advanced concept sometimes and just making it just the essence of it so that I don't have to think or work hard to have those concepts work for me.

Tobias Macey
0:21:31
Yeah, the decorator capabilities and the syntax that allow for it definitely makes it a lot easier to organize code and concepts when you can just drop it on top of a function definition without having to try and maybe incorporate it into the body of the function and remember, what are the return types? Where are the inputs? You just say it wraps this function and then it handles that I don't have to think about it anymore. And you can just keep it all in like a utility's library, for instance.

Saul Pwanson
0:21:57
Yeah, exactly. Totally. Oh, I will say that one of the things that I wish the decorators did support was be able to put the function like the def function name and signature on the same line as the decorator. And it's a minor point, but I use a lot of grep type tools. When I'm I would like to be able to know that function that I'm looking at is a single thread or have a dedicated decorator. Now I see that when I'm searching for functions, for instance,

Tobias Macey
0:22:25
well, one tip there is that if you add the grep -v one that it'll show you the line that you want, as well as the line just before it.

Saul Pwanson
0:22:34
So that's a great tip. Yeah, thank you.

Tobias Macey
0:22:36
And another thing that it stands out with VisiData, particularly is the fact that it is entirely terminal oriented, whereas a lot of data exploration tools will be more focused on graphical interface or trying to embed into a Jupiter notebook for providing some sort of visualization. And I'm wondering what your motivation was for focusing so closely on that terminal interface and making it a command line client?

Saul Pwanson
0:23:02
Yeah, I feel like the terminal is my home. Like I've been using terminal since the 80s. And so I'm very comfortable in that environment with those kinds of restrictions. And I'm much more comfortable with the keyboard than a mouse. But then as I getting older, it's becoming harder to just type for both lean. So I'm really, I want to individual keystrokes to do things, I couldn't figure out how to do that. And, for instance, Jupiter notebook. The other thing is that a terminal is actually a very universal because it's so old, and mature, let's say it's a universal interface, like any platform has an SSH client and a terminal. And the only other way that you can get that level of universal universality is with a web browser and like, for instance, an electron client. And that's way too heavy. So I feel like the choices between a terminal which is very light and electron which is very heavy, that choice for me is obvious, I don't want it to be a very quick in and out thing. And I don't know how I would do the same kinds of things as quickly as, as you can, in the web, or even a native app, if you have to reach for the mouse. You can do it with a with a given native app for sure. But you have to make a native app for Mac for Windows for Linux, etc. And I just didn't want to do that. And so really, you know, this is about only about 10,000 lines of code all total, which is actually quite a bit. But it's not that much when you compare it to comparable tools, like open refine or whatever like that. And I think testament to being on the command line, like I can do kind of the minimum necessary to get the job done. And don't have to worry about all the, you know, pixel width and stuff. It's like, No, you choose your own font, you choose your own font size and ways to interact with the thing, I'm just
here to get out of the way.

Tobias Macey
0:24:37
It also has the benefit that as you were describing originally of being able to just copy it over by SSH or now pip install it on a remote machine. You don't have to go through the hoops of trying to set up a way to have a graphical interface to that remote box, you can just copy it over. And it brought the reach and capabilities and use cases for the tool where the only access you have is by terminal, which is he said, despite its age is still fairly a fairly common experience for people who are working in technology.

Saul Pwanson
0:25:15
Yeah, absolutely. And you know, I work remotely now. And we do have screen sharing apps. But they don't always work that great. And you have to sometimes install some other plugin or whatever. And the app that I love most, I'm not actually sure if I should call it an app even, then it's called tmate, it's a tmux wrapper, I guess. And you just type, you install a new type tmate and you get an instant a shell into your machine and us gives me an SSH link. And they can do that. And people are usually amazed. It's like, well doing that and VisiData. And now we have an instant data exploration platform we can share and just with a little bit of, you know, a chat client or whatever. That's That's it. And I find that to be so much more accessible than modern video chat things that we haven't even asked at the start of our session here, head technology difficulties. It's just the shell is very reliable.

Tobias Macey
0:26:05
By comparison, I think by the fact that you are targeting the terminal environment, what are some of the constraints that that brings with it in terms of your capabilities that you can bring into VisiData, and just some of the most challenging aspects of trying to build a user interface for data exploration and analysis within this environment that is so graphically constrained, particularly given the fact that you have incorporated some visualization capabilities, and just some of the ways that that manifests?

Saul Pwanson
0:26:36
Yeah, I have to say that I've been
0:26:37
pleasantly surprised that it hasn't, I haven't felt as constraints, I thought I would like once I discovered that I could use Braille characters, for instance, to the graphing, it kind of just works. And I'm, you know, it's not perfect. But if you want more perfect things, you should be using other tools. And in fact, that's one of the things I think that is important with this, it is not meant to be a be all and end all it's kind of a glue. Technology, right? It's an adapter. And so once you figure out what you want to do, then you should go to the fancier tool and do it right. But there's no reason to do everything super right from the get go. You just want a quick glance at it us about the most challenging aspects of building a terminal UI. And I have to say that the thing that's been most challenging for me is knowing that if we're on the web, who probably worth a lot of money, and doing it in the terminal means that I've kind of sure i have like no one really pays for terminal tools, I shouldn't say no one. I actually have several Patreon subscribers, and I'm really appreciative of them. But you know, if you think about how VisiCalc back in the day was like a fancy program that sold for hundreds of dollars, like I can't, I can't imagine doing that with VisiData, right. That's just not how the world works. Although if it was a native app, that might be actually what it was possible to, to sell it for. For instance, the other thing that is more challenging than you might think is you mentioned PIP installing something. And that's really great for people who already have Python and already know about how to use pip. But if I want to get this into the hands, I think she think VisiData, it is a pretty decent tool to use for anybody who's willing to use the keyboard anyway. And yet, it's tricky that I think installation is one of the trickier parts, right? Like, if I wanted my partner to go and install it on her computer, she has I have to like tell her to install this, click here download this, it's like if people just want a single thing they can download, they can double click on and then go right. And that's just not how the terminal world generally works. So I feel like installation is one of those. It's one of those weird things where there's a larger barrier to entry, and it should be and yet I can't find a super easy way around that. So that's just how it has to be.

Tobias Macey
0:28:35
I'm also wondering which terminal environments that supports because Windows is generally one that's left out of the support matrix for command line tool, but because of the fact that Python does have the curses interface built in or if you are relying on the prompts tool kit library, I know that there is the possibility of being able to support the windows command lines, I'm just curious what the overall support matrix is for VisiData.

Saul Pwanson
0:29:00
Yeah, you know, I started off doing I mixes, that's what I run and then it of course, it turns out, it works on a Mac terminal just fine. And I didn't have access even to a Windows machine. And so I was like, well, Windows isn't fully supported. And it just turned out that people were just running it under Windows subsystem.
0:29:15
When a subsystem for [Linux WSL](https://github.com/saulpw/visidata/issues/192), like this, what's called
0:29:17
and it just basically just worked there. And then somebody submitted [a small patch](https://github.com/saulpw/visidata/pull/288). And it wasn't really that big. And it works, I think even without WSL now on a more recent version of Windows. And so I actually have never used it on Windows. But I know we've got quite a few people, some some Italian open beta users like [Andrea Borruso](https://github.com/saulpw/visidata/issues?q=is%3Aissue+author%3Aaborruso) loves using it and Windows, and that's it works fine. So as far as I'm concerned, it works under Mac, Windows and Linux and seems to be fine and all of those. So that's that's what I wouldn't say it's what we support, necessarily. But if it works, I'm not gonna say we don't support it either, right?

Tobias Macey
0:29:54
Another peculiarity of building a command line oriented client is that it is heavily keyboard driven, as you mentioned. And that means that you need to create the set of key bindings that will do whatever it is that you wanted to do. So I'm wondering how you've approached the overall design and selection of those key bindings to ensure that there is a set of internal consistencies and that the key bindings make semantic sense, but also so that you don't run out of key bindings in the event that you have some new capability that you want to run into, because it is a limited space, even when you do incorporate modifier keys.

Saul Pwanson
0:30:35
Yeah, totally.
It's, I mean, we're right up against that. Now there are a few keys left, in some sense, at least few keys that people want to use. So the main thing is, I have to use mnemonics to make sure that things stick in my own memory, I actually have a pretty bad memory myself, and so they don't fit my mental model. I can't remember them for one month and next. So I've made sure that they at least make sense to me. And because I've been using terminal stuff for so long, I'm kind of like tuned into the the existing text culture that is around. So a lot of the key bindings are borrowed from like them, of course, like you know, D for delete, and A for add and stuff like that. Actually, when I showed it to a guy on ingy.net, he chastised me for that, that Ctrl+Z didn't suspend in VisiData, and I was like, Oh, you are totally right, that needs to be fixed right away. And I did fix it right away, because you want to make sure that the things that people who are using the text client are used to will still work. And so Ctrl+C will just work. And the other thing I think that's really important is there's like layers of mnemonics. So we have a couple of modifier keys, I wanted to keep those very simple, like, I think that vim is great. But it's it's kind of feels daunting when you see all the different possible combinations. And so I hope that when you see VisiData, it has exactly two prefixed keys, that it's okay, and maybe we can have our hands around this. And then those are just modifier is on existing other commands, right. And so there's kinda like layers. So other piece of this is that column modifiers, for instance, are all on the symbol keys. And in fact, all the types are all on a single row, on my keyboard anyway, right. And so you've got the date is an @ and the converting into int is the # sign, those are all just adjacent to each other on the top row of the keyboard, and then other column things are also symbols. And so you don't get confused thinking well, Isn't an int `i`? No, it's one of those ones up there. Which one is it? Oh, I think it might be the one that looks like that, that helps me anyway. And the fact that the sheets at going to a new sheet are all on shift key. And you know, for me, it's like shift and sheet, I was a rhyme or something like that, right. So Shift F goes to the frequency sheet, stuff like that. And then finally, is symmetry, I think that's really important. So I reserved all of the pair. So for instance, open paren, close paren, open brace, close brace, those, were all reserved from the get go for things that have both the front and the back. So sorting is, you know, the square brackets. And one way goes ascending and descending and scrolling down to the next item is a greater than sign versus previous items left inside. And I feel like that symmetry on those things is very useful, but then also more largely symmetry between commands. So you know, the G prefix goes bigger, and the Z prefix is more perfect and more precise. And so when you're saying I want to change all of these, I wanted to be all zeroes I got selected. That's, you know, GD I want to on select all rosaries, like that's GU and I could just kind of, to me in a feels like what makes sense. Like, you may not know it, before you discover it. Once you discover it, that's sticky. I feel like that's a super important thing. So that doesn't interface isn't made for the first time user names like the third time user.

Tobias Macey
0:33:40
Yeah, there's definitely a lot of peculiarities and sort of culture and history built up around different key bindings. And as you mentioned, vim has its own set. Emacs has a different set of key bindings that people will be familiar with. And then there are any number of command line tools that have created this sort of general pattern of how you would craft these key bindings. So it's definitely interesting to hear some of the history of how you have approached it, because of your particular tool set choices. And like you said, anybody who's been living on the terminal long enough, will find it fairly natural. And I appreciate the care that you've put into considering how you add new key bindings so that it doesn't just end up cluttered and so that it does, so that you can have some sort of mnemonic muscle memory of being able to recreate a certain workflow once you pick it up. Because with any tool, there will be periods where you put it down for a while and don't come back to it. And then when you do come back to it, you want to be able to just get right back to being productive without having to go back to try and remember what were all the key commands and look at the reference manual.

Saul Pwanson
0:34:51
Yeah, totally.
Yeah, we did was last year ago or so instituted longnames. And so there's the key bindings, which are, you know, as they are, and they originally were, that was all we had, it was just, you know, Shift+F means the frequency table, so we could access it. But now there's actually a longname for that it's I think it's open-frequency. And I'm not sure that's exactly right, don't quote me on that, but and then the bind the Shift+F to that and so people can rearrange their keyboard, or they really want to, but also the ability to add commands that aren't bound to any key. And so you know, for instance, if you make your own command and your visidatarc, or whatever, you can make that invent it yourself. Or if we provide a command that's very unused, like for instance, I think, random rows that used to be on shift or whether we made shift R redo the Undo redo pair I felt like that's kind of symmetry of shift U and shift R as opposed to you know, victims lowercase, you control R which doesn't make any sense to me anyway. But anyway, I move the random off of shift R but then now there's no real good place for the random selection of rows to go, I feel like selecting random rows is an infrequent enough operation, that I put it on a long name, and then you can just press the spacebar and enter in a long name. And when that enterprise goes ahead and does it, I feel like that's a other tactic is to start moving things off of the default key bindings into more like a huge list of possible commands he could use.

Tobias Macey
0:36:10
Yeah, that's another thing that's got a long tradition, both in vim and Emacs and other tools of being able to have a way of opening a prompt that you can then start typing, as you said, a long name command or being able to start typing it and then maybe tap through to cycle through what the commands are, so that you don't have to necessarily remember all those off the top of your head as well.

Saul Pwanson
0:36:30
Totally. And we do have cap completion. And then so
0:36:34
works anywhere that we have open prompt, including the long name thing.

Tobias Macey
0:36:37
And then in terms of the types of analysis that VIsiData can do out of the box. I know that you mentioned frequency analysis or histograms. But I'm curious, what are some of the other capabilities that come natively in VisiData and any of the interesting plugins that you are others have contributed for being able to expand the capabilities and utility of VisiData?

Saul Pwanson
0:36:59
You Yeah.
0:37:01
So out of the box, it can do all kinds of interesting stuff, you know, searching and filtering, bulk editing and cleaning, spot checking, finding outliers, I also I use it actually, more often than I would think for file format conversion, the ability to load the format, and then save it to JSON or character separated value or markdown is super handy and gets me from here to there a lot faster than I couldn't otherwise, even the scraping a web page for its tables is basically built in then. Jeremy Singer-Vine, for instance, has written several [plugins](https://github.com/jsvine/visidata-plugins) already for the current version. He wrote one that does roadmap duplication and FEC the Federal Election Commission data set a loader for those and they just, you just download those and import them and you visidatarc, they're ready for action right away.

Tobias Macey
0:37:50
And when I was looking at the documentation, it seems that one of the libraries that you can load into it as pandas, and I'm wondering if that means that you can can expose all of the pandas capabilities as well as you're exploring these data sets. Because I know that that's often the tool people will reach for their first time digging into a data set just to see what's the shape of it. And so I'm curious how that works into the overall sort of use case of visit data as the exploratory tool, and then where the boundaries are, when you might want to jump to pandas, or if you could just incorporate that whole flow together.

Saul Pwanson
0:38:24
Yeah, that's interesting, you know,
0:38:27
I made a very simple adapter for pandas, 20 lines of code at first, to support a lot of different loaders and browse dataframes.
But what's interesting is that Pandas and VisiData don't actually play that well together.  Like sorting, VisiData computes each value and sorts based on that, but you want to use pandas built in sort function or do it more efficiently.
And there's just no good way to do that automatically.
You have write all the commands to be compatible with Pandas for Pandas sheets.
It's totally doable, but it's a fair amount of work, and I haven't done it.
And so somebody [did make a some modifications to make pandas more responsive](https://github.com/saulpw/visidata/pull/267), in certain cases to make things work better.
But it doesn't happen naturally like that.
You probably are better off using it in Jupyter by itself.

Tobias
Then in terms of the overall growth and adoption of VisiData seems that there's a decent community that's grown up around it. And I'm wondering how you approach the project governance and sustainability as a solo developer, and how you are looking to grow the community and incorporate more people into the future of VisiData.

Saul Pwanson
0:40:02
Yeah. Well, as you say I'm a solo developer, but I've got a little bit of help.
Anja has been instrumental in making me not so alone with some of the decisions and discussions.
There's also a #visidata channel on freenode that several of us are hanging out on.

So I'm, of course, the decider on those things.
But I have to be honest, it kind of feels like I'm discovering VisiData more than creating it at this point.
It's like a chunk of marble to a sculptor, it kind of tells me what it wants to become.
And some things I didn't even consider, and then I look at it like, why didn't I think of that already?
Like the the rowtype down in the lower left corner where it shows you, lines or columns or whatever the current data type is.
For the longest time, almost 1.0, that just said, "rows".
And I didn't know why I even put that text there, if it was going to say the same thing every time.
And yet I felt strongly that it should be there.
Once I realized that it should be changed for each sheet, I don't feel like that was my creation.
That's that is just how it has to be.  That makes sense.

You mentioned about project sustainability. The thing is, my energy to code is my most precious resource.
I have a day job, and so I come home at night, and it's madness that I want to screw around with data.
It's hard to have the energy when I don't have a very concrete use case.
I have the most energy when somebody is enthusiastic, and they have a sample data set.
And they're like, I just want to do this thing to it.
How can we do that?
It's a kind of a little puzzle, 
you maybe can put together existing commands to do this, or here's a one-liner that to put in their visidatarc, or does this require like a different core piece of functionality so that not just that case, but 10 other cases can be solved too.
I actually do really enjoy solving those puzzles.
But then sometimes we'll have people who asked for a generic feature.
And it's not very immediate, it's more abstract, and because nobody actually really, really wants it, I'm less motivated, I just kind of do something else.

Tobias Macey
0:42:51
So what are some of the most interesting or unexpected or innovative ways that you've seen VisiData used?

Saul Pwanson
0:42:58

We have a couple of superfans, people who will use it for more than they really should.
One of them is a guy named [Christian Warden](https://www.octoberswimmer.com/salesforce-consulting/), who does a lot of Salesforce consulting.
So he's got buckets of data, and just wants to move through it quickly.
He built a duplicate row finder for some data set with Python expressions and .vd script, and VisiData is not made for internal computation.
Elements that compute within a row, no problem, but if you want to look at the previous row, it's not really meant for that.
But he figured out how to pull it off, it was an amazing piece, and it worked.
It did expose a bug with computation, so it was taking forever to run.
But once we fixed that, it actually was remarkable.
He turned this into yet another Turing complete programming environment.

Also, if you or your listeners have seen the [lightning talk](https://www.youtube.com/watch?v=N1CBDTgGtOU) that I gave a couple years ago.
I had some data that had lat-long coordinates, and I was just curious if I could plot those in my little canvas.
And it turns out the plotting latitude-longitude as x,y coordinates, works pretty well for maps, even if you've got a million points.
You can see the distribution of things, and it was surprising to me that it worked as well as it did to be honest.  Like, I don't think this is built for geographic information at all, but you can kind of pull it off.

Tobias Macey
0:44:33

Yeah, I did see that lightning talk. And that was one of the things that I was kind of blown away by as far as the visualization aspect of VisiData, given that it's a terminal environment. And so it's interesting to hear how you just mapped the lat long to x, y coordinates. And I'm sure that you just figured out what were the maximum bounds of the coordinates that you had to figure out? What were the what the overall plane coordinates needed to be in relation to each other. So that's pretty funny.

Saul Pwanson
0:44:59
Thank you.

Another thing that has been kind of surprising is how meta the thing goes, editing VisiData's internals, using VisiData's own commands.
Just yesterday,
a user asked [how they get another type column on the describe sheet](https://github.com/saulpw/visidata/issues/356).
And I thought about it and I was like,
you know what you can do, is:
you can go to the column sheet,
and you can copy it from there, and then you can paste it into the Columns sheet of the Describe sheet.
And it'll just work.
You couldn't possibly do that with Excel.
Similarly, if you've got 1000 columns, and you want search or select all the ones that begin with a certain thing and remove all those from the set, you can do that in VisiData. And it works just like anything else. 
I have no idea how you do that in almost any other tool.
So the metadata editing aspects have been really surprising for me, that it works as well as it does.

Tobias Macey
0:46:09
And looking forward, what are some of the features or improvements that you have planned for the future of VisiData?

Saul Pwanson
0:46:16

Well, so right now we're working on the 2.0 release, which will be a couple months out [end of 2019], and the goal is to stabilize it.
And the current version 1.5.2 is actually incredibly stable.  I've only seen one outright bug and that was an edge case. 
But the API is kind of all over the place, it's not as coherent as the user interface.
And so one of the things we want to do is make the API stable and produce some more coherent documentation about the internals; we've been calling it the "Book of VisiData".
And the point of that is we can let it rest and work on some other things. But then let other people go wild and share their own creations, plugins or commands or loaders, without destabilizing the core goodness that is there.
So I'm sure there will be v2.1, whatever after that.
But I'm really hoping that with 2.0, development can slow down, and I can move on to some other projects that I have in the queue.
Okay, so one of the things that we've been talking about that's kind of taken a little got a little bit of traction is something I've been calling where in the data is 
Like "Where in the Data is Carmen San Mateo?", which references an old game from the 80s and 90s, which maybe you've heard of called "Where in the World is Carmen San Diego".

Tobias Macey
I used to play it.

Saul Pwanson
Okay, So you're familiar. I want that kind of game, but with data and data sets. Kind of an Escape Room game, or a Choose Your Own Adventure, where you're solving whatever crime, but you get the data sets to look at.
And that's how you get the actual clues and solve the actual puzzles.
And so my next project in the queue. But I don't want to do that until we've got v2.0 locked down and feel like it's a stable place for everybody.

Tobias Macey
0:48:09
Are there any other aspects of VisiData or data exploration or any of the other accompanying projects that you'd like to cover before we close out the show?

Saul Pwanson
0:48:24

I feel like we're in an age of kind of a terminal Renaissance, that we went
through the period of the late 90s, and early 2000s, where it was more graphics
all the time.  And that was the obvious way up and out.  And the terminal has
been with us throughout, and I have never left it.  But I feel like within the
past, maybe 10 years or so with projects like ohmyzsh and tmux/tmate and many
others, that the terminal has been kind of getting a resurgence.  And even now,
when people go to data science boot camps and stuff, they have to learn the
terminal and get involved in there too, because you need to be able to do that
kind of stuff in order to get anywhere serious, to dive deeply into data stuff.

0:49:14

[XXX] And so I feel like this is part of that, you know, if this data is saying
that Wait a second, you don't have to be in the web graphics world and RMB
perfection, in fact, not being in that world makes it a lot easier for you, if
you can just embrace the fact that you're going to be at the terminal and using
a keyboard.

Tobias Macey
0:49:29
Yeah, definitely appreciate the fact that there is a lot more focus being paid to just making things that work in the command line and being able to stitch them together. Because as you said, the graphical interfaces, well, they are appealing, and it's easier to sell something to somebody who isn't as technical, if you're in that environment, they do bring a lot of extra weight and requirement to the development and maintenance of them, as well as in some cases, the use of them because they are definitely much more mouse driven. And it makes it harder to be able to have just a unified flow.

Saul Pwanson
0:50:04
Yeah. And you know, to be honest, the versions of iOS and Windows are going to keep marching forward. And I have no doubt that if I made an app for the current version of either of those, that in the next three or four years, it wouldn't work with the next version. And I am actually pretty confident that if I don't touch VisiData, for the next four years, that you'll be able to use it in the next version of Python on whatever thing, no problem at all. And I find that to be really motivating to do a good job.

Tobias Macey
0:50:34
Anybody who wants to follow along with the work that you're doing or get in touch, I'll have you add your preferred contact information to the show notes. And so with that, I'm going to move us into the picks and this week I'm going to choose a newsletter that I actually found while I was doing some research for this conversation called Data is Plural that it's maintained by Jeremy Singer-Vine mentioned a few times. It's a weekly newsletter with interesting data sets that looks to have some fairly curious discoveries. So if you're looking for something to experiment with VisiData, you might have some interesting finds in there. So with that, I'll pass it to you Saul, do you have any picks this week?

Saul Pwanson
0:51:15
Definitely give tmate a look, if you're a terminal user and want to have a multi-user experience; there are a lot of other tools in that same vein like mosh, the mobile shell for less than perfect network connections.

Tobias Macey
0:51:38
All right, well, thank you very much for taking the time today to join me and share the work that you've been doing with VisiData. It's definitely something that I'm going to be experimenting with because I spend a fair amount of my time on the terminal and have to do a lot of exploration of random data sets, whether it's just CS, Bs or piping things from different batch commands. So thank you for all of your work on that tool. And I hope you enjoy the rest of your day.

Saul Pwanson
0:52:03
Awesome. Thank you very much. I hope you have a great day too.

Tobias Macey
0:52:08
Thank you for listening. Don't forget to check out our other show the data engineering podcast at data engineering podcast com for the latest on modern data management. And visit the site and Python podcasts. com to subscribe to the show, sign up for the mailing list and read the show notes. And if you've learned something or tried out a project from the show, then tell us about it. Email host at podcast in a.com with your story. To help other people find the show please leave a review on iTunes and tell your friends and co workers
