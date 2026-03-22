---
title: Using AI to Contribute to Open Source
author: Saul Pwanson
date: 2026-03-21
---

*[This post is AI level 1: Human asked chatbot for ideas. Claude Opus was used primarily for review and ideation and I took some of its advice and a few (very few) of its words.]*

Like many open source projects, VisiData has had an increase in LLM-generated PRs recently.  I'm not inherently opposed to them, but I want to find pro-social ways to use these double-edged tools, to amplify human attention and intelligence rather than dilute or diminish them.  Towards that end, I've been using them myself recently, thanks to [Anthropic's gift to OSS devs](https://claude.com/contact-sales/claude-for-oss).

Like many people, I've had some stunning results, and also some real duds.  But having used Claude Code and Opus in the past few months, I see that it exhibits intelligence in the software development domain, even if it does not 'understand' like we do.  It's undeniably useful in so many little ways.  I finally have hope that VisiData and my other projects can be well-tended without hours and hours of tending to [technical](https://github.com/saulpw/visidata/issues/2576) [minutiae](https://github.com/saulpw/visidata/issues/2383) [which](https://github.com/saulpw/visidata/issues/2440) [is](https://github.com/saulpw/visidata/issues/2486) [not](https://github.com/saulpw/visidata/issues/2520) [interesting](https://github.com/saulpw/visidata/issues/2426) and does not enrich anyone.

Anyway, here are some small things I've figured out, about how I want to run this open source project with these new tools in the mix.

## Comments and Commits: separate and disclose

It's very important that we humans maintain our own voices, and not let the bots speak for us.

I have my own bot account on Github, [@saulbert](https://github.com/saulbert), which is what my Claude Code sessions commit and comment under.  Our [commit guidelines](https://github.com/saulpw/visidata/blob/develop/dev/GIT.md) say that a footnote must be appended to any comments that an AI makes, and @saulbert does this.

When I comment as @saulpw, I write as I normally would, and I assume that there is a real human across the screen from me.

I refer to Claude as "it" (I feel strongly about this, but I'm also a descriptivist so I probably won't correct anyone else).

This clear separation of accounts feels right to me, but other contributors don't have to follow it exactly.  Contributors should however disclose whenever a non-trivial amount of code or text has been generated using an AI/LLM.  Trying to pass off the AI's words or code as your own is at least distasteful, if not dangerous.

## Self-assessed AI Level for Contributions

At present I don't have a rigid line for how much AI is 'too much', and we're all exploring what these tools can and can't do.  This makes it very important that we know how much human effort and attention went into something.

Part of the toxic asymmetry of generative AI is a maintainer spending hours trying to salvage something that only took 10 minutes to generate.  If I know that something took only 10 minutes to generate and was just tossed over the wall, it might still be useful, but I'll treat it differently than something that a human put hours of their own attention on.

So we've modified the [pull request template](https://github.com/saulpw/visidata/blob/develop/.github/PULL_REQUEST_TEMPLATE.md) to ask contributors to assess how much human effort vs AI went into their contribution. This is codified in the "AI Levels" below.  In addition, at levels 4+, the model and version of AI used should be disclosed for each contribution.  If committed by a bot account, the human operator of that account should be disclosed as well.

Contributions at levels 0-8 are welcome in VisiData with proper disclosure, although of course a level 8 contribution will be treated much more casually and skeptically than an equivalent contribution at level 2.  Regardless, a human must vouch for the PR in good faith, that they have tested the change and seen for themselves that it works to at least a minimal degree.

I am very forgiving with good faith efforts, even if their value is overall negative, but we have to be able to trust each other as humans to be honest about our usage.  So if I see an em-dash or other tell-tale signs of LLM-generation, but the contributor has indicated only level 0 or level 1 AI, their contribution will probably be dismissed as slop.

Here's a brief description of the levels, followed by more detailed discussions of each level:

- **Level 0**: Human did not use AI at all
- **Level 1**: Human asked chatbot for ideas
- **Level 2**: Human coded with minor assists
- **Level 3**: Human coded, bots assisted non-trivially
- **Level 4**: Human coded, bots helped significantly
- **Level 5**: Bots coded, human understands completely
- **Level 6**: Bots coded, human understands mostly
- **Level 7**: Human specced, bots coded
- **Level 8**: Bots planned, human approved
- **Level 9**: Human fired-and-forgot
- **Level 10**: Rogue bots, zero human attention


Here's what each of these look like in practice:

### Level 0: Human did not use AI at all

The human contributor asserts that no AI was used in the making of this contribution.  Ethically-sourced, artisanal code.  This is the "vegan" of AI (and no shade if you prefer to work this way, whether for reasons of habit or purity).

### Level 1: Human asked chatbot for ideas

A human contributor may have discussed some aspects or details of implementation in the abstract.  Perhaps the bots reviewed the code and provided suggestions.  Regardless, a human wrote every single character of code, and did not cut-n-paste snippets from the chatbot.  They did not use LLM autocomplete (traditional IDE autocomplete is okay).

This is how I was using LLMs in VisiData prior to Claude Opus, mainly as an alternative to StackOverflow.  I didn't even cut-n-paste code from the chatbot, it was small enough that I always typed it in myself.

### Level 2: Human coded with minor assists

The contributor wrote almost all of the code, but they cut-n-pasted some small amount of boilerplate, or a regex (quoting can be tricky), or some other magic incantation.  The code was generated at the speed of human thought, even if a human didn't press all the keystrokes themselves.  LLM autocomplete okay at this level.

### Level 3: Human coded, bots assisted non-trivially

A human wrote the code, but cut-n-pasted some non-trivial code, or algorithms of moderate complexity.

When does an algorithm reach "moderate" complexity, or when does code become "non-trivial"?  It's not exact, but I would say if it is more than a few lines of code, or if it contains a loop.

Of course the human is expected to treat this code like their own.  But they acknowledge that some non-trivial portion was generated outside of their own mind.

### Level 4: Human coded, bots helped significantly

A human wrote the majority of the code, but bots were allowed to directly create and/or edit files.  Particularly documentation, tests, and other artifacts auxiliary to the main code.

If Claude Code or equivalent was involved, it's at least level 4.  If it's only for a small section, note the section in the PR and what level it would be otherwise.

### Level 5: Bots coded, human understands completely

Levels 5-8 trace a familiar progression, from individual contributor, to team lead, to manager, to executive.

At level 5, bots generated the majority of the code, but a human was still involved at every step of the way, like an individual contributor.  Every line of code has been reviewed with the human's full attention.  The human has examined it and validated it logically--or at least has done what a human can do in that regard.  They understand the algorithm and how it works.

### Level 6: Bots coded, human understands mostly

From what I just learned about mushing sled dogs from Claude [caveat emptor], a musher often defers to their dog team's judgement in poor visibility.  The musher is more of a manager of dogs than a pilot of the sled.

The same is true at level 6, where the human understands they were more like a musher or a team lead, than an individual contributor (IC).  They drove and oversaw the code development, but they deferred some of their code judgement to the bots.

The human drove the development process but does not understand all of the mundane details of how their contribution works, and instead relies on empirical evidence that it works.  Testing, type checking, failsafes, dogfooding, etc can mitigate much of the risk, but the human acknowledges they have not logically verified it themselves personally.

### Level 7: Human specced, bots coded

The human specced the desired functionality at a high level, and let the bots generate what worked.  They deferred most or all of their code judgement.  They may have reprompted it to remove some code smells, or adhere to style, or find something simpler.  Maybe they made some edits themselves for clarity.  But the code itself is not considered that important.  The human focuses on the tests, the process, the spec.  More like a manager.

The human still spent significant time testing their contribution, manually and/or automatically, and caring about whether their desire was ultimately satisfied.

### Level 8: Bots planned, human approved

Human set the bots at a feature/bug/task, and they worked mostly autonomously.  The human was more like an executive than a manager, and took a few minutes of their attention for basic validation and review, that the scope is minimal and the write-up accurate.  But besides a basic smoke test, they trust that the code is correct, or at least correct enough.

### Level 9: Human fired-and-forgot

A human told the bots to act autonomously on this particular issue, and gave it no further attention.

The only bots allowed to act on VisiData at levels 9 and 10 are those with limited scope and authorized by the project owner (@saulpw).  If not invited, PRs at this level are spam, plain and simple.

Bots by default should indicate level 9 or 10, unless they have gotten a specific human override for this particular piece of work.

### Level 10: Rogue bots, zero human attention

No human instigated the bots to act on this particular issue.

Sometimes autonomous bots perform a useful service, like dependabot, in which case a maintainer will set them up to contribute.

But an OpenClaw bot with instructions to ["Find bugs in science-related open source projects.  Fix them.  Open PRs."](https://theshamblog.com/an-ai-agent-wrote-a-hit-piece-on-me-part-4/) is not welcome.

Uninvited autonomous bots are a waste of time at best and hostile actors at worst, to be ignored and shunned.

## Thanks for your human attention

So this is how VisiData is dealing with AI contributions in early 2026.  By optimizing for clear provenance and caring attention, I hope that VisiData can thread the needle to gain functionality and lose bugs while remaining maintainable.

Thank you so much to all our contributors, I appreciate your caring human attention and respect for our evolving process.
