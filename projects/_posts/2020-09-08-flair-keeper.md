---
layout: post
title: "Flair Keeper"
date: 2020-09-08 14:30:00 -0800
---
I've spent my last few weekends working on a new side project.  Similar to [Steampunk Spider](https://wescook.ca/projects/steampunk-spider/), this tool was written for the Dark Souls network of subreddits to aid in repetitive tasks.

The Souls subreddits offer a unique system of displaying trophies next to user's names.  Each game has a trophy, and the trophies indicate that a user has completed all achievements in that respective title.  It's a small boast of skill which shows an appreciation for the series.

The technical implementation of these trophies is a little messy.  They are built on the reddit flair system and controlled by a unique flair code.  Due to limitations of the platform, a spritesheet must be used which lists the trophies.  Every permutation of trophy needs to be programmed in for the flair code to function.

Previously these codes were entered by hand.  It required memorizing the ID for each game, then stringing them together in release order.  Along with case-sensitivity and variations on new reddit, this introduced a lot of potential for human error.

Additionally, adding a new game to the system required significant work.  Every new permutation needed to be manually coded in, and the spritesheet had to be freshly created.  It was not an enviable task.

So when building Flair Keeper, I had two goals in mind:

1. Allow for a faster way to update a user's flair (no entering codes manually).
2. Come up with a way to generate these spritesheets automatically.

![Flair Keeper Home Screenshot](/img/flair-keeper-home.png)

I'm pleased to say that both goals have been accomplished.

A simple UI allows a moderator to select which trophies they wish to enable.  This produces the flair code for easy copying.  It also allows for automatic importing and exporting of a user's trophies.  The games are specified in a JSON config file, which makes adding new titles a breeze.

The spritesheet functionality ended up being a fair bit more complicated.

Initially, calculating the permutations wasn't that difficult.  There's plenty of code examples for generating the [power set](https://en.wikipedia.org/wiki/Power_set) of an array using a recursive function.  I adapted the code for JavaScript and it worked without a hitch.

However, during discussions of the project we soon came up with the idea to offer trophy "upgrades" for completing more difficult feats.  This required a new variant system, where each trophy could have 1 of n available variations.  This complicated the math, and increased the number of permutations exponentially.

I couldn't find any research online on generating permutations with exclusive pairs as this required.  And unfortunately, my own math skills were not up to the task.  Thankfully I got some brilliant help from a friend who was able to crack the code.  The solution required generating a new recursive branch for each variant during every iteration (including the "base" variant).

The total number of permutations are `((x + 1) ^ y) - 1`, where `x` is the number of variants and `y` is the number of game entries.  Thus you can only maintain a small number of games and variants before the numbers become too large to work with.

In our case, the total was only 728 permutations (6 games, 2 variants).

Once the permutations are calculated, the generator uses a JS canvas to draw the icons in a matching pattern.  An image is generated from that canvas, and the CSS is printed alongside it.

![Flair Keeper Spritesheet Screenshot](/img/flair-keeper-spritesheet.png)

This was the first proper ES6 project I've written from scratch.  I was already a big fan of arrow functions and the `.map` features in ES6, but now I was able to work with some features I'd only touched on before.  Specifically, async and modules.

This project required a lot of network functionality, so it was a perfect time to learn async techniques.  While I have worked with promises before, I didn't have a great mental model for how they worked under the hood.  Being able to implement functions using both promises and async/await gave me a better insight into how they were really just two sides of the same coin.

I was also very glad to work with modules.  In the past I've ended up just writing massive .js files, so I wanted to focus on splitting up functions and writing more portable code.  Modules were perfect for that.  It encouraged writing functions that were pure and idempotent; essentially little libraries.

One technology that was new to me was OAuth.  I have used wrappers for OAuth in the past, but I've never needed to implement the details myself.  It gave me a better understanding into how the authorization protocol worked.  It was important to understand scope, state, and grant types.

My first attempt involved generating a refresh token manually and saving it to the config file.  This approach was quick and easy to implement.  However, as I had the intention to host this on the public web it presented too big of a security risk to send that information over the wire.

I went back to the drawing board and implemented the code grant flow on the client-side.  In addition to being the more secure option, this also had the advantage of offering more control to the end-user.  To allow use with multiple subreddits, I added the option to select which subreddits to import from and export to.

![Flair Keeper Spritesheet Screenshot](/img/flair-keeper-settings.png)

This was a very fun project.  The scope grew as it always does, but the end result is better for it.  I'm still pleased with the quality of the code, and I'm happy I was able to learn some new technologies along the way.

Flair Keeper is open-source, and licensed as MIT.  You can [find it at the usual place](https://github.com/WesCook/FlairKeeper).
