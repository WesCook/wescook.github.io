---
layout: post
title: "Raspberry Pi"
date: 2016-02-03 22:39:00 -0800
---
Last month I picked up a Raspberry Pi with a starter kit.  I didn't have an exact use-case in mind, but figured I'd find a project for it pretty quickly.  It didn't take long for one such project to come up.

Due to rising server costs, I was looking to migrate some services off my rented VPS.  This included my website, some webapps I wrote, and most importantly my RSS crawler.  I know, nobody uses RSS anymore.  But old habits die hard.

I've tried about a dozen different RSS clients out there, but I keep coming back to [Tiny Tiny RSS](https://tt-rss.org/).  It's self-hosted which means you won't be left in the lurch if a <span class="note" title="RIP Google Reader">service goes down</span>.  It's also extremely customizable.

Installing TT-RSS is not as simple as setting up a Feedly account.  On a plain Linux install you're going to need to setup a webserver, backend database, PHP, and any other requirements (eg. curl).  My webserver of choice is nginx, and with FastCGI for PHP and MariaDB you're running a very slick web stack with almost no configuration needed.

Once you've got all the prerequisites met, TT-RSS is a cinch to install.  Just throw it in your /www folder and follow the wizard.  You may need to set some file permissions, as you do in Linux-land.

You'll next need to setup a method for [updating feeds](https://git.tt-rss.org/fox/tt-rss/wiki/UpdatingFeeds).  I set up a daemon with systemd, but you can use a crontab or run a process under screen to keep the crawler running.  Once you're done you can install a custom theme or plugins to customize your experience.

There aren't many great mobile apps for TT-RSS, so I like to use the excellent [Fever API plugin](https://github.com/dasmurphy/tinytinyrss-fever-plugin).  This lets you use any Fever-enabled app such as [Press for Android](https://play.google.com/store/apps/details?id=com.twentyfivesquares.press) which is very nice.

This all works great with an always-on Raspberry Pi, and I've had zero interuptions since setting it up last week.
