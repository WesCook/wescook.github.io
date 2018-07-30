---
layout: post
title: "Life's Swell"
date: 2018-07-30 3:25:00 -0800
---
A couple days ago I had an idea for a new puzzle game.  The mechanic would be based on size, where the player must grow or shrink to navigate the level.  They do this by collecting various powerups, and must collect them all to complete the level.

I wasn't sure if the mechanic would actually be fun, so I decided to prototype it and find out.

![Level 3](/img/lifes-swell-level-3.png)

Creating a game from scratch is no easy task, and often requires building out low-level systems before work can begin on higher-level mechanics.  In this case I was only interested in prototyping an idea, so I decided to dust off an old friend and give [GameMaker](https://www.yoyogames.com/gamemaker) a try.

The last time I'd used GameMaker was version 7, and as expected much had changed.  GameMaker Studio 2 (the latest version) is a step up in a lot of ways, and offers a more streamlined IDE and modern debugging features.  There's also many language and system changes that took some time to acclimate to, however.

I sketched out my idea and implemented some basic features.  Players could move on a grid, walls blocked their path.  The powerups - originally just dots - acted to embiggen the player and change their hitbox.

I designed a few puzzles around this mechanic, and very quickly found there wasn't enough variety offered by the mechanic to create compelling puzzles.  The list of choices boiled down to the order you used the powerups in, which offered little depth.

The natural progression of this idea was to then introduce a shrinking mechanic.

At risk of using programmer art forever, I sketched up rough sprites for strawberries and blueberries which acted as the grow and shrink powerups, respectively.

I tested the new mechanic and found that growing and shrinking opened up the problem space considerably.  This meant that more options were now available in designing interesting puzzles.

By this point I suspected the game could be fun with polish.  I ironed out some of the bugs, added a hint mechanic, and started working again on creating puzzles.

However, before too long I realized that something was still missing.  Map sections could easily lock out a player for being too large, but not for being too small.  How might that be solved in a geometric game?

I decided to add a final mechanic: holes.  The idea with holes is that you must be the correct size to cross them, by straddling the edges on both sides.  If you're too small you'll fall right in.  Combined with walls this allows greater control over player movement.

![Level 4](/img/lifes-swell-level-4.png)
<small>Player can cross at size 1 or 3, but not 2.</small>

By this point I found I was quickly running into limitation of the GameMaker trial.  They offer a max of five rooms, which is a pretty big restriction for a puzzle game.  Hitting this limit so early meant I could only introduce the tutorial stages, which was honestly disappointing.  But I'm still happy with my progress, and had reached my goal of proving the mechanic worked.

I spent the rest of my time polishing up the game: bright colors, silly sound effects, and of course googly eyes for the player.

The light-hearted feel I ended with is where the name of the game comes from.  "Life's Swell" also has the double meaning of referencing the growing (swelling) mechanic of the player.

It felt really good to release this game, even if it is only five levels long.  It's been a long time since I've created a game from scratch like this.  It reminded me of when I was first learning to program by creating small games in GameMaker, and how joyful it could be.

Like all my work, the source code for Life's Swell is [available on Github](https://github.com/WesCook/LifesSwell).  I would have liked to release an executable as well, but sadly that's another limitation of the GameMaker trial.
