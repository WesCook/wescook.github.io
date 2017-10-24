---
layout: post
title: "Dual Booting"
date: 2017-10-25 2:00:00 -0700
---
I recently installed [Solus](https://solus-project.com/) as a dual OS to Windows 10.  While I often use Linux for servers, I hadn't used it as a desktop OS in years.  I hoped to gain experience by using it as my daily driver, with a fallback to Windows for games or specialized software.

After spending a few days collecting my important files and tying up loose ends, I went ahead and formatted both Windows and Solus.  I put them on separate drives to avoid having their bootloaders conflict.

Windows offers a Media Creation Tool to install, while Solus offers an ISO download that can be burnt using [Rufus](https://rufus.akeo.ie/).  I ran with the default settings and everything installed just fine.

The first issue I noticed was that grub seemed unable to detect Windows.  I spent some time trying different grub options and workarounds, but ultimately had no success.

Eventually I made the mistake of writing a bad config to `/etc/grub.d/40_custom`, and ended up losing my valid Solus boot option too.  After a day of working in live CDs and learning much more about partition tables, I finally understand what went wrong.

The problem was this.  When I first burnt the ISO from Rufus, I used the default setting of burning in ISO mode.  This made sense, as it was an ISO file after all.  It turns out however that this format doesn't allow the disk to be booted in UEFI mode, so it fell back to legacy mode instead.

In legacy mode, the Solus installer is smart enough to format your drive using MBR partitions, rather than the newer GPT.  So while the OS worked perfectly, grub wasn't able to see the GPT partition that Windows was installed under.  Despite being on different drives, there was still a conflict.

Eventually I [RTFM](https://solus-project.com/articles/installation/preparing-to-install/en/#usb-4) and learned I needed to burn the Solus ISO in dd mode.  This allowed me to boot properly in UEFI mode and reformat the disk as GPT.

At this point, grub actually loses its usefulness.  The Linux kernel now contains its own boot loader called the EFI Stub Loader, and that means we no longer need grub to act as a bootloader.

A boot *manager* is still needed to select the OS, but this can be done through the motherboard's EFI selector, or using a tool like [rEFInd](http://www.rodsbooks.com/refind/) for a graphical frontend.

It's been a rough start, but admittedly my goal was to gain some new experience.  Let's see where Linux Land takes us next.
