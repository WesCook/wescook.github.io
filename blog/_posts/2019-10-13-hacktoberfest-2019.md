---
layout: post
title: "Hacktoberfest 2019"
date: 2019-10-13 10:00:00 -0700
---
This year I learned about an annual event named Hacktoberfest.  Hosted by Digital Ocean, it encourages programmers to contribute to various open source projects.

You can sign up at the [Hacktoberfest page](https://hacktoberfest.digitalocean.com/).  Participation requires submitting four valid push request during the month of October.  The PRs don't have to be accepted, but they should be more substantial than simple typo or formatting fixes.

It sounded like fun, so I decided to try my hand at it.

I spent the first hour or so searching through the list of projects that Digital Ocean suggested.  I found that I wasn't familiar with most of them, and that many had sizable codebases.  As I'm not very comfortable making code changes without first knowing a product, I decided to search out some projects I was more familiar with instead.

Ultimately I decided that although Java is not my strongest language, I have played with enough Minecraft mods to make useful contributions to that ecosystem.  I began searching Github by the tag `minecraft-mod`.

I decided on four mods: [AgriCraft](https://www.curseforge.com/minecraft/mc-mods/agricraft), [Cooking for Blockheads](https://www.curseforge.com/minecraft/mc-mods/cooking-for-blockheads), [Waystones](https://www.curseforge.com/minecraft/mc-mods/waystones), and [Rustic](https://www.curseforge.com/minecraft/mc-mods/rustic).  Each a medium-sized mod that I've used before.

I scanned their respective issues lists and found a feature request or bugfix from each that I thought I could do.  This ensured that my PR would actually be welcome.  With four issues picked out, I set off to work.

One thing that is never fun in Minecraft mod development is setting up the dev environment.  Getting IntelliJ, Gradle, Minecraft, Forge, and the various dependency mods to play nicely can be like herding cats.  This took some hours.

Once I got down to implementing the feature or bug though, it was actually a lot of fun.  The problems became strictly logical at that point and could be worked through with enough perseverance.  If something's not working, it's possible to trace it through the code to understand why.

I won't go into detail of every PR, but these were my four:

* <https://github.com/AgriCraft/AgriCraft/pull/1244>
* <https://github.com/blay09/CookingForBlockheads/pull/402>
* <https://github.com/blay09/Waystones/pull/183>
* <https://github.com/the-realest-stu/Rustic/pull/273>

In the case of the last one, I was happy to add a new feature while reducing the total lines of code by eliminating a loop.

All in all, it was a very dense three days of coding.  Two of my PRs have been merged in already, and I'll have to wait and see on the other two.

Hacktoberfest seems like a really fine idea to me.  It's encouraging people to get out and code, and to do so in a way that gets them comfortable contributing to open source.

I might participate again next year, and maybe get a little more adventurous in trying out some new projects or languages.

<br>

![Hacktoberfest 2019](/img/hacktoberfest-2019.png)
