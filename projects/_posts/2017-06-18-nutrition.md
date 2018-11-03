---
layout: post
title: "Nutrition"
date: 2017-06-18 5:20:00 -0800
---
I recently finished my second Minecraft mod, titled [Nutrition](https://github.com/WesCook/Nutrition).

Nutrition allows you to create custom health systems in Minecraft by defining nutrient types and effects.  It does this through a [JSON-driven](https://github.com/WesCook/Nutrition/wiki/Configuration) system of Nutrients and Effects, which define unique food groups and programmable status effects.  This customization allows modpack authors to create entirely unique experiences just by editing the config files.

![Nutrition Screenshot](/img/nutrition-gui.png)

## Development

Nutrition took five weeks to develop.  I wrote it initially for a survival modpack I'd been working on titled [Homestead](https://github.com/WesCook/Homestead), but decided to clean it up and release it as a modular system for others as well.

When I wrote my [first mod](/projects/watering-cans/), I had little experience.  I'd never worked with Java or object-oriented languages before, and had to also learn how to use the Minecraft Forge API, my IDE, among other things.

My experience in writing Nutrition was very different.  As I'd already learned the tools and much of the API, I was able to focus on just building the mod.  I felt much more productive as I could spend my time writing new features or refactoring, rather than getting stuck on a problem for days at a time.

Granted, I still needed to learn how to [write GUIs](https://twitter.com/WesCook/status/854989797319819264) and handle network packets, which took up a large part of development.  I also made some initial mistakes in packet handling, as I misjudged how Java treated non-deterministic behavior across different JVM implementations.

## Reception

I'm thrilled to say that Nutrition has been well-received by the community!  In the first couple weeks I've received pull requests, bug reports, and plenty of comments and suggestions.

While bug reports might be seen as a negative, I found it encouraging to know that people were playing with the mod and willing to contribute back to it.  It was a validating experience for me as a developer.

I'm also excited that, at this time, Nutrition has already been localized into 6 different languages: English, German, Dutch, Spanish, Norwegian, and Swedish.  I'm incredibly thankful to those who submitted these localizations.

## In Closing

I have to admit that I'm proud of this one.  While it's not a hugely complex or even technically challenging codebase, it's been the most rewarding project I've worked on yet.  I've been blown away by people's willingness to contribute, and I'm thankful to everyone that has participated with their bug reports, pull requests, translations, and feedback.

As usual, you can find the [code at Github](https://github.com/WesCook/Nutrition).
