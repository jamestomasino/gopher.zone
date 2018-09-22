---
date: 2018-09-21 21:52:20 -0400
title: "Tips for Publishing"
---

Originally published by **bitreich** at
_gopher://bitreich.org/0/tutorials/publishing-guideline.txt_

- - - - -

This document will give you a few hints about publishing through
gopher.

## Line length

The rendering of content is client specific. However most clients
will present the user with a text based interface, so you should be
conservative on the maximum line length in your menus. As clients
will add a couple of characters to mark item types, a line width of
69 characters is recommended.

## The menu

The main entry point and user interface between your readers and your
content is the gopher menu item (item '1' as you may recall).  The
selectors in a menu will define the information hierarchy. Choose a
flat hierarchy if you can so readers will get to the content easily
and without traversing too many menus.

Use helpful item descriptions for your selectors, this will aid both
human and nonhuman readers: indexers will most likely index menu
items only.  Be as specific as possible. If it is a binary item type
hint at its intended format, so your readers will know what to
expect. Using a useful filename scheme for selectors is also helpful.

You may decorate your menus with informational items (item 'i').
Clients will display them as is without additional tags.  Around the
gopherspace a lot of ASCII art is used to create a pleasant
appearance of a gopher site. Some services also include explanations
for the specific menu, and use 'i' items for grouping selectors.

There are clients that do not offer a 'back' button. Be kind to those
users and provide navigational selectors in your menus.  Make the
journey through your gopher space easy!

On your travels through gopher sites, you will encounter gopher sites
that use menu and informational items to mimick a page with embedded
links.  There is an ongoing dispute whether this is good style. We do
not recommend this style as it delutes the meaning of the menu item.
For starters you should stick to single file items to store your
content. Once you gain more experience with publishing content in
gopher you can always change your mind later!

## Selector hierarchy

By design a gopher site should present a hierarchy of content
selectors to the user.  These mimick a file system by intention.
However this does not need to mtch the real hierarchy of your storage
filesystem.  An example:

Alicia has a gopher blog (aka 'phlog'). She writes daily posts.  To
make it easy on her users she has a menu item on the phlog/ selector
that presents the latest 5 posts and a selector to an archive menu
linking to all her posts.  On disk however both the menus and the
articles reside in the same directory. A script creates the
selectors in the menu files and rotates them. The post files however
remain untouched and their selectors will not change over time.  This
means that external links to her post will still be valid later.

## Site generators

The easiest creation of content is done manually. If you would like
to automate some task then there are site generators. Most of these
consists of a collection of shell scripts you can adapt to your
needs. Search veronica for cl-yag or burrow for starters.

<!--  vim: set shiftwidth=4 tabstop=4 expandtab: -->
