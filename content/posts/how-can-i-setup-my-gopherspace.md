---
title: "How Can I Setup My Gopherspace"
date: 2018-09-21T21:01:08-04:00
---

Original published by **SDF** at _gopher://sdf.org:70/1/sdf/faq/GOPHER_

The article in this content is specific to setting up a gopher hole
on SDF (The Super Dimensional Fortress) Public Access Unix System.
Visit [sdf.org][] for more information on how to create an account.

- - - - -

# HOW CAN I SETUP MY GOPHERSPACE?

This document was written with 'mkgopher' in mind.  You may be
managing your space from the UNIX shell, but since 'mkgopher'
uses common UNIX commands, this should still be helpful.

## SETUP

This will create the directory for the top level of your GOPHERSPACE.
Your URL will be "gopher://sdf.lonestar.org/1/users/username" (or
"gopher://sdf-eu.org/1/users/username") where 'username' is your UNIX
user id.  During your 'mkgopher' session, this directory will be
present.  If you don't create anyfiles or directories, the space
will be removed to keep our site clean.

NOTE: Unfortunately, most web browsers do not render gopher pages
properly, let alone grok Gopher URLs.

## TITLE

Your GOPHER URL is gopher://sdf.lonestar.org/1/users/login (or
gopher://sdf-eu.org/1/users/login) where 'login' is the UNIX user id
you use to login to SDF.  Your SITE name is your 'login'.  Since that
is limited to 8 characters, you can use TITLE to set a 50 character
or less title for your site.

## DESCRIBE

For each directory you create in your GOPHERSPACE you can use the
DESCRIBE command to create a detailed description.  This entry is
limited to 9 lines of roughly 50 characters per line.

## MKDIR

Create a subdirectory within your GOPHERSPACE.

## RMDIR

Remove a subdirectory within your GOPHERSPACE.

## PICO

Edit and publish a document.  You can also use this as a way to
cut and paste text from your computer terminal to SDF.  ASCII upload
mode can also be used, just start sending text once you open the
editing buffer.

## UPLOAD

This should be used for large text files or binary data that cannot
be transmitted via an ASCII transfer.  UPLOAD uses the ZMODEM file
transfer protocol which some terminal emulators support (TeraTerm ..)


  [sdf.org]: https://sdf.org
