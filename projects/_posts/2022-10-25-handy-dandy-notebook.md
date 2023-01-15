---
layout: post
title: "Handy Dandy Notebook"
date: 2022-10-25 8:00:00 -0800
---
[Melvor Idle](https://melvoridle.com/) is an idle (or "incremental") game based around the RuneScape IP.  I started playing this one during a period where I was put out by renovations and had no office space.  It kept me busy and paired well with audiobooks, another hobby of mine.

## Mod Support

Melvor released an expansion last week, and with it came an official mod manager.  Now writing scripts for idle games is not uncommon (for many that becomes the game itself), but official mod support for a web-based game is something I've never seen before.  I was impressed and wanted to take a look.

I spent the first three days of the expansion tinkering with the new API and mod manager.  The API is great, and offers useful hooks, storage features and lifecycle events.  That's everything you need to write a mod.  The development experience however left much to be desired.

At least at the time of writing, you're required to zip up your working folder, upload it to a third-party website, and then download the files through the game.  This added significant development time compared to testing locally.  The hosting provider also seemed to experience frequent caching issues, which means you're never sure if your changes have synced or not.  I admire the developers for integrating mod support at all, but this is a major hurdle right now.

## First Mod

The first mod I wanted to write is a notepad widget for keeping track of goals and other information.  Inspired by one of my favourite cartoons as a lad, I named it [Handy Dandy Notebook](https://mod.io/g/melvoridle/m/handy-dandy-notebook).

Melvor makes heavy use of a library for creating modals called SweetAlert2.  To maintain visual consistency I opted to use the same, which turned out to be a major decision.  SweetAlert takes care of all the visual design and accessibility features which let me focus on the content, so I was pleased with how quickly it let me get an MVP up.  I did however start to run into design considerations that did not include my use case.  I was worried I'd have to rewrite the modal functionality myself, but eventually all problems were resolved or worked around.

As modding for this game is still at its infancy, a lot of things have yet to be standardized.  One question I had was "where to place the notebook button"?  After consideration I decided it'd be best to just let the user decide, so that's been exposed as a user setting.  I added a second setting to disable animations for low-powered devices such as older Android phones.

One of the biggest concerns I had going in was how to handle storage limits.  Each mod can store a maximum of 8KB per character.  If I went over that limit, the game would simply refuse to save and people would lose their notes.  I built in a couple levels of safeties to prevent this from happening.

First, the game calculates the byte length of the input string.  It issues a visual warning at 7,300 bytes, and physically prevents further typing at 7,800.  This allows some headroom for the JSON encoding and future additions.  While it's less accurate, I also used the `maxlength` attribute as a secondary failsafe.

If you're curious, 8KB is about 14 paragraphs of Lorem Ipsum.

## Release

The reception has been very warm.  A number of commenters have shared that it solves a real problem for them of needing to keep text documents or real notepads.  I often keep a todo.txt file handy for the same reason, so that was definitely a main motivation for me in writing the mod.

On the very next day after release, I realized I could have squeezed another 40% out of the available storage space by gzipping the note data before saving it.  I regret not considering this before.  I wrote up methods to encode, decode, and test for gzipped data, but at this point I'm too hesitant to risk other people's notes from a bug.  For now, I think I'll sit on the code and see if the existing storage limits prove to be a problem.

## Conclusion

Although the development experience currently leaves much to be desired, I'm still thrilled to see official mod support in an online game like Melvor.  I already have ideas for other mods, but may give it a little time to mature before starting another project.

Handy Dandy Notebook is available for Melvor on the web, Steam, or mobile.  It can be subscribed to directly from the [mod.io page](https://mod.io/g/melvoridle/m/handy-dandy-notebook) or using the in-game mod manager.  The source code is [available on GitHub](https://github.com/WesCook/HandyDandyNotebook) under an MIT license.
