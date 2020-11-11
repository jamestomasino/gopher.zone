---
date: 2019-03-05 18:46:58 -0500
title: "Running a Gopher Server in 2018"
---

Original published by **Paul Scott** at
_[prgmr.com](https://prgmr.com/blog/gopher/2018/11/09/setting-up-gopherserver.html)_

- - - - -

If you read the History of Gopher then you might want to make your own server.
The process isn’t complicated, thanks to an application called Pygopherd. You
will need a Linux machine or virtual machine (this article uses Ubuntu) with
Python installed (default on most modern distros). There are just a few steps
to follow.

## Step 1: Make sure that pygopherd is in your repositories.

    $ apt-cache search pygopherd

## Step 2: Install pygopherd

    $ sudo apt-get install pygopherd

## Step 3: Configure pygopherd

Open /etc/pygopherd/pygopherd.conf in your favorite editor. The config file is
well-commented and mostly self-explanatory. The most critical change is the
name of your server, which allows a gopher client to find your server. In your
text editor find “servername” and configure:

    servername = <IP or Domain>

Your IP address is available in /etc/network/interfaces.

## Step 4: Set up the server

### Stop, start, and restart your gopher server

Your gopher server is up by default. Start/stop/restart the service using:

    $ sudo /etc/init.d/pygopherd start
    $ sudo /etc/init.d/pygopherd stop
    $ sudo /etc/init.d/pygopherd restart

### Change your default gopher directory

By default, the directory where your gopher-related files are stored is
/var/gopher. To change this directory open up pygopherd.config and edit the
setting root=/var/gopher (located around line 120 in the config file) to your
desired directory. Don’t forget to add a gophermap to the new directory. (For
more about gophermaps, see next.)

## Step 5: Configure the gophermap and Add Content

Your gophermap is an index for each folder in your gopherhole.

Technically, a folder doesn’t need a gophermap. However the gophermap file can
be quite useful. It gives you more control over the structure of your
gopherhole, lets you add links and text to your pages.

With a gophermap your server will appear as a list of files and links, with
comments and other information that you might choose to add. Without the
gophermap your server will appear as a raw list of files and folders, navigable
in a gopher client but with less information for your users.

If you choose NOT to use a gophermap then you must delete the default gophermap
file. A gopher client will look for the gophermap by default and if it’s there
then it will override the other content in your folder. If you do use
a gophermap then you will have to update it every time you add or delete
content from the folder.

### Gophermap file syntax

In a Gopher menu's source code, a one-character code indicates what kind of
content the client should expect. This code may either be a digit or a letter
of the alphabet; letters are case-sensitive.

RFC 1436, the Gopher technical spec, defines 14 item types. Type 3 is an error
code for exception handling. Gopher client authors improvised item types
h (HTML), i (informational message), and s (sound file) after the publication
of RFC 1436.

    Canonical Types
    0   Text File
    1   Gopher submenu or link to another gopher server
    2   CCSO Nameserver
    3   Error code returned by a Gopher server to indicate failure
    4   BinHex-encoded file (primarily for Macintosh computers)
    5   DOS file
    6   uuencoded file
    7   Gopher full-text search
    8   Telnet
    9   Binary file
    +   Mirror or alternate server (for load balancing or in case of primary server downtime)
    g   GIF file
    I   Image file
    T   Telnet 3270
    Non-Canonical Types
    h   HTML file
    i   Informational message
    s   Sound file

To set up a very basic gopherhole, you need only three item types:
i (informational message), 1 (link or subdirectory), and 0 (text file). Edit
the gophermap file at

    /var/gopher/gophermap

A gophermap is formatted as a set of lines, one for each item, using
tab-delimited fields with the following syntax:

    Tlabel<tab>path<tab>host<tab>port

    Where:
    T      The item type code (e.g. 1, 0, i)
    label  A human-readable label for this item (e.g. Books, Movies)
    path   The relative path to the target file
    host   The hostname of the target gopher server
    port   The port that the gopher server is listening on (usually 70)
           A literal tab character (ASCII character 9)

Note that there is no space or tab between the item type and the label.

You can omit the host and port fields if your items are on the same server as
the gophermap. You can omit everything but the item type and label for
informational items.

So suppose you use the default setup of /var/gopher as your home folder for
content and your main gophermap. In that folder you have the gophermap; an
“AboutMe” file and three subfolders for a blog, movie reviews and vacation
photos.

The main gophermap might look like this, with informational items to explain
each folder.

    iWelcome to my Gopherhole!
    i
    0A little bit about me.<tab>about.txt
    i
    iHere's my Blog, "The Technical Technical Writer".
    1Blog<tab>blog
    i
    iReviews of some of my favorite movies.
    1Reviews<tab>movies
    i
    iPics from my vacation in San Diego
    1Vacation Photos<tab>vacation

Each of the subfolders (blog, movies, and vacation) will have its own
gophermap. The blog and movie reviews will be text files (item type 0), while
the vacation photos will be image files (item type I).

### Add content

This is the simplest part of setting up your gopherhole. To add content just
add files and folders to your gopher home folder and/or subfolders. Update your
gophermaps (if you have them) and you’re off!

<!--  vim: set shiftwidth=4 tabstop=4 expandtab: -->
