---
layout: post
title: "Steam Market List"
date: 2021-07-02 14:00:00 -0800
---
For those with large Steam libraries, [trading cards](https://steamcommunity.com/tradingcards/) have been a way of earning store credit in exchange for a little time.  They can be listed on the Steam market where you'll receive a few cents for each card purchased.  With enough cards, this can add up.

I've avoided bothering with this process until now because the time investment really didn't justify the return for me.  But with enough automation, it's not unreasonable to be able to earn a few free games from the setup cost alone.

Tools already existed for [idling cards](https://github.com/JustArchiNET/ArchiSteamFarm) and [listing them on the market](https://github.com/Nuklon/Steam-Economy-Enhancer).  The final step for me was automatically confirming every market transaction.

Valve have added various protections to their market over the years to prevent issues of account theft and scamming.  Market transactions can be verified either through their mobile app, or through email.  I decided to use the email method as it's easier to automate.

Every market transaction generates one email.  That email includes one button to create the listing, and another to cancel it.

![Steam Market Confirmation Email](/img/steam-trading-card.png)

Because I'm generating hundreds of transactions at a time, this would take a lot of manual clicking to complete.  I opted to write a tool to scrape these emails for the confirmation links then exports them into a big list.  Gmail automatically caps each email thread at 100 messages, which is a good number to work with in batches.

My first thought was to write a Greasemonkey script, but the Gmail source was very soupy and difficult to parse.  It is also likely to change frequently.  I decided instead to investigate [Google Apps Script](https://developers.google.com/apps-script).

I'd never used Apps Script, but it's pretty cool.  It exposes an API to perform work on Google services.  I was able to whip up a script to loop through my inbox and generate a list of market confirmation links in about half an hour.

![Steam Market List - Web App](/img/steam-market-list-webapp.png)

The default option was to create a web app, but I also noticed the option to export as a workspace add-on.  Add-ons are those mini apps that sit in the Gmail sidebar.  I decided it might be worth the convenience of having this functionality built into Gmail, so I gave it a look.

It turns out that add-ons require considerably more effort to create.  Rather than running straight on the Apps Script engine, they require you to set up a Google Cloud Platform project.  This then requires defining IAM roles, OAuth scopes, and numerous API integrations.

After setting up the project, I needed to learn the UI toolkit.  The add-on UI system seems to behave similarly to Android, whereby "pages" are cards being pushed to and popped from a stack.  I ported over the logic and wrote a minimal UI for interacting with.

![Steam Market List - Add-on](/img/steam-market-list-addon.png)

With that complete, I was able to generate a list of confirmation links with one button press.  These URLs can then be fed into something like [Postman](https://www.postman.com/) to generate network requests.

To keep it simple I found a [Chrome addon](https://melanto.com/apps/bulk-url-opener/) that opens all links for you, which I then discard.  This saved me from having to extract the Steam login cookies into an external tool.

I decided not to publish the add-on for public use as it's not very polished, and it's an admittedly niche use case.  If there's much interest I can look into that though.

I've [published the source code](https://github.com/WesCook/SteamMarketList) for both the web app and add-on version of Steam Market List on Github.  Basic install instructions are included if you'd like to set it up yourself.
