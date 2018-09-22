---
date: 2018-09-21 21:48:42 -0400
title: "Tutorial for Absolute Beginners"
---

Originally published by **bitreich.org** at
_gopher://bitreich.org/0/tutorials/beginners.txt_

- - - - -

<pre>
Hello dear reader,

if you have heard about gopher and want to explore its space but feel
lost about how to achieve that, this text is for you. We will assume
that you have no technical skill so everyone can read this.

Gopher is the name of a protocol for sharing text, images or any kind
of file. A network protocol is a set of rules which allow to create a
common service for different people, everyone needing to respect
thoses rules to be able to communicate with each other. Some people
writing code (called Developers) will write "Clients" software for the
end-user and others developers will write "Servers" software which
will allow to publish content. The gopher protocol is so simple that
anyone with basic knowledge of computer science can write its own
client or server easily. Using gopher implies to understand the
protocol itself, but we promise it's really easy.

Gopher is an enjoyable way to browse informations. Every gopherhole
[that is the name given to someone's gopher content] looks like
another one. There is no way to customize a gopherhole display except
from the text. While this can look a bit harsh, this makes gopher
universal. If you know how to browse one gopherhole, you will know how
to browse all others because the way to do it is consistent.

So, let's speak about how gopher works. First, gopher requires 3
informations if you want to get content. You will need a remote
address to connect to [it's called an hostname, like "floodgap.com"],
the data type and a path to the data. The url looks like this :

    gopher://hostname/type/path

The most important type is the type 1, which is the gopher menu
type. A gopher menu is an index made of differents lines, each line
having a type field to know what kind of data it leads to. It will
allow you to browse from menu to menu or from a menu to a content
(image, text, music, archives...).

Here is the list of the most used data types allowed on gopher, the
complete list is defined in a document named RFC 1436 which defines
the gopher protocol :

- type i is a line of text in the menu, it's not a link
- type 0 is a link to a text document
- type 1 is a link to another gopher menu
- type 3 means an error
- type 7 (search) asks a text input and lead to another menu
- type 9 is a link to a binary file (data archives, music...)
- type g is a link to a GIF file (animated picture)
- type I is a link to an image file
- type h is a link which lead to use another protocol (irc, http...)

Only the types menu and search can lead to another content. Asking
another type will lead to downloading a file.

Now that you are ready to browse the gopher space, we recommend you to
read the others tutorials about the gopher client software you would
like to use.
</pre>


<!--  vim: set shiftwidth=4 tabstop=4 expandtab: -->
