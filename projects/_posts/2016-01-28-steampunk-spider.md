---
layout: post
title: "Steampunk Spider"
date: 2016-01-28 14:10:00 -0800
---
[Steampunk Spider](https://github.com/WesCook/steampunk-spider) is a tool I wrote for the [/r/GameDeals community](https://www.reddit.com/r/GameDeals/) to make it easier to generate tables for large Steam sales.  It was my first big Javascript project and my first foray into open source.

It works by first taking a list of URLs into its text area.  These are parsed line by line looking for a regex pattern of application type and an ID.  For instance, `app/245490` or `sub/75498`.  This simple detection method means most Steam URLs work, including community links and those with query strings.

[<img src="/img/steampunk-spider-thumb.png" width="300" height="157" alt="Steampunk Spider Screenshot" class="float-right">](/img/steampunk-spider.png)

The script will build a list of games to search and initially mark them as "unfetched".  When ready, the thread manager process begins making network requests to Steam's API.  These aren't real threads of course as Javascript is single-threaded, however we can fake it by using asynchonous requests and keeping a tally of how many requests are being made.  A heartbeat function makes sure we never fire too many, and the heartbeat slows if the script detects Steam is throttling the connection.  In this way the script will always finish even if the connection is interrupted.

Whenever a request finishes, the game is marked as "fetched" and the downloaded information stored.  This then triggers a new function to build a markdown table with the current information.  The asynchronous requests already significantly speed things up, but seeing the table building in real time also makes it *feel* faster.

The script knows it's completed when all games have been marked "fetched", and it indicates to the user that the process is finished.

As simple as a concept as this project was, it ended up being far more complicated than I first anticipated.  I had to work around problems such as multiple regional currencies, each of which required an HTTP request; getting around same-origin policy, which meant writing a companion PHP script to curl the requests; and writing a thread manager to keep track of asynchronous HTTP requests.  Writing thread-safe code was a completely new idea to me, and it took a complete change in thinking to get my head around the idea.

This was a seminal project for me.  I learned a lot about Javascript and just how powerful a language it can be.  I was most impressed with how useful the tooling was - Chrome's developer tools especially.  Being able to pause the script mid-execution, investigate the call stack and interact directly in the console made finding bugs incredibly easy.

This was also my first real contribution to open source.  It's something I've wanted to do for a long time, and I plan to do so again whenever possible.

Check out [Steampunk Spider on Github](https://github.com/WesCook/steampunk-spider) and feel free to set up an instance yourself.
