---
layout: post
title: "Tildes Focus"
date: 2019-06-08 8:00:00 -0800
---
I've recently taken a liking to [Tildes.net](https://tildes.net/).  It's still a small community, but it feels much more comfortable than the wild west of other social networking sites.

One issue I've noticed with large threads however is that it can be difficult to find new comments since your last visit.  New comments are distinguished visually but are still easy to miss when there's a very active thread.

To remedy this, I wrote a Greasemonkey script to navigate to the next new comment automatically.  It's called [Tildes Focus](https://github.com/WesCook/TildesFocus) as it helps you focus on what's new.

I implemented this in Greasemonkey to help keep the complexity down.  When loading a thread, the script makes a list of all new comments to walk through them.  Keyboard shortcuts are used for navigation, and once you reach the end of the list it wraps back to the beginning.  A subtle background shading is used to highlight the selected comment and works nicely in all themes.

When working on this script I discovered that JavaScript's <code>scrollIntoView()</code> function accepts options both for smooth scrolling, as well as vertical positioning (eg. center on element).  This allowed for a very clean implementation without leaning on jQuery or other libraries.

Tildes Focus is [available on Github](https://github.com/WesCook/TildesFocus), and licensed under MIT.
