---
layout: post
title: "Rigging Bingo"
date: 2026-03-26 12:00:00 -0700
---
In my last post, I wrote about the [Backlog Bingo project](/projects/backlog-bingo/), which I created for the Tildes community.  Since then, I've added a number of new features and tweaks to improve the app.  One of the more interesting ones is a seeded randomizer.

The general idea is that you enter a text string as a seed when creating a new bingo card.  This makes the randomizer deterministic, always selecting the same categories during generation for a given seed, which allows you to share it so that others can play along.

The difficulty here is that JavaScript is a high-level language.  It doesn't give you control over the random number generator, other than choosing its range.  We can work around this by creating a custom PRNG function, utilizing math operations to create something approximating randomness.

There are several popular algorithms, such as Mulberry32 and xoshiro128, each with different levels of speed, entropy, and range.  I opted for a variant of [SplitMix32](https://github.com/bryc/code/blob/master/jshash/PRNGs.md#splitmix32) with improved constants, which met each of my requirements.

The app uses text-based seeds because they're more human-friendly, but a PRNG requires an integer.  For that, we need to hash the string to get a usable value.  Hashing functions also have trade-offs, this time in speed, distribution, and collision frequency.  Since a full cryptographic hash wasn't necessary here, I chose DJB2a for its [balanced profile](https://softwareengineering.stackexchange.com/a/145633) in all three traits.

When put together, it looks something like this:

```
const hash = DJB2a(seed);
const rng = (seed) ? splitMix32(hash) : Math.random;
```

The reference to `rng` must be held, as recreating it with the same seed would reset its sequence.

I then needed to update any functions that used randomness to accept a custom PRNG.  I didn't need to replace all calls, though; only those that affected the final bingo card layout.  I added an optional parameter to accept an `rng` value, falling back to `Math.random` if none is provided.  For example:

```
shuffleArray(arr, rng = Math.random)
```

I could then plug the custom PRNG into the functions that select categories and dynamic values, ensuring the final bingo card is fully deterministic.
