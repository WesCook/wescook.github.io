---
layout: post
title: "Contributing Code to Tildes"
date: 2019-09-08 10:00:00 -0700
---
A [few months ago](/projects/tildes-focus/) I released a userscript called Tildes Focus.  I've since refined the project and submitted it upstream, and I'm pleased to say it's now been merged into the site.

## New Feature

The feature works by expanding new comments on topic pages.  Rather than using a keyboard input like my previous project, this version adds a button named "Collapse read" to the page.  As you might guess, it collapses all previously-read comments to focus on what's new.

The idea is simple enough, although the logic ended up being more complex than I was expecting.

## The Logic

Tildes comments can be collapsed and expanded, which might lead you to believe that comments have two states.  However in actual fact comments have three states.  They are: expanded, collapsed, and collapsed-individual.

The first two are self-explanatory.  Collapsed-individual is a special case where the comment is still collapsed with a brief preview of its contents, but its daughter comments remain visible.

The logic went through a few iterations.  The first version collapsed all comments by default, then walked upwards from new comments to expand their parents.  Nice and simple.

This almost worked, but created an inconsistency with the site's server-side implementation.  It seems only one "layer" of comments should be collapsed, where expanding the shallowest comment in a branch would expand all within.

After thinking about the problem for a while I decided to invert the logic.  All comments would start expanded.  We'd then find the shallowest comment within each branch and collapse it (solved by checking for an ancestor that's collapsed, and a descendant that's new).  Finally, we'd walk up from all new comments and expand as appropriate.

This was an interesting project for a number of reasons.  It gave me a chance to learn some new technologies.  GitLab was a new platform for me, and while it has many similarities to GitHub there was still a slight learning curve.

Vagrant was the biggest technology to learn.  In some ways it keeps things simpler by reducing dependencies, but it does so by adding a new layer of abstraction.  If things go wrong there's one more layer you need to unpeel to understand what's really going on.  And as it turns out, things did go wrong.

## Troubleshooting

I was on Windows at the time which made me the guinea pig for setting up a Windows 10 workspace.  This ended up exposing two significant bugs in the development process.

The first was a dependency on symbolic links.  Apparently symlinks have been locked behind a security policy in Windows 10.  This makes security sense as symlinks are a major attack vector, but led to folder sync issues between Vagrant and npm.

After some research, I fixed this by toggling the relevant security policy in secpol.msc.  A more permanent fix was [later implemented](https://gitlab.com/tildes/tildes/commit/ac4e8e9b5444a3a9ac8d9a956c24ed0dedde79d7) by Tildes to bypass symlink creation altogether and run the tools manually.

The second problem was that of line endings; the age-old Windows/Unix issue that just won't die.  The linter was looking for LF line endings, but git will by default checkout using your platform's native line endings (which on Windows are CRLF).  As a result the pre-commit hooks would consistently fail.

This was solved by configuring git to avoid converting line endings and triggering a fresh checkout, then manually converting the files I'd modified locally.  The linter was then happy and let me push my changes.

The more permanent fix was to [specify this behaviour](https://gitlab.com/tildes/tildes/commit/541505382771c43a552aeb063fcedd68c250ce67) in the project's .gitattributes file.

With those problems solved, I was able to finally submit the new merge request.  After a few rounds of discussion and tweaks, the project was [rebased onto master](https://gitlab.com/tildes/tildes/commit/4af861d44a9ecb4e8fcdf798e9f97eac495aac98) and made live on the site.

## In Closing

I was really glad to work on this one.  It gave me a chance to play with some new technologies (Vagrant), and refresh my memory of some older ones (jQuery).

It's also really rewarding to see a feature you built show up in a site that you use every day.  I admit that might be a little vain, but it's a nice bit of validation.

I also have to give credit to the cleanliness of Tilde's codebase.  The files were well-explained and organized.  Class names were logical and easy to work with.  It's about as clean a foundation as you can have in a large project, so big credit to Deimos and the other contributors for doing a swell job.
