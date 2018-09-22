---
date: 2018-09-21 21:55:28 -0400
title: "Publishing on gophernicus"
---

Originally published by **bitreich.org** at
_gopher://bitreich.org/0/tutorials/publish-gophernicus.txt_

- - - - -

Gophernicus is quite fussy about permissions, to minimise the risk of
accidentally serving files not intended for public consumptions.  Only
world accessible content will be served, so chmod files o+r and
directories o+rw.  This is a common cause of confusion and frustration
for beginners.

Gophernicus supports so-called "personal gopherspaces".  If a user
"bob" has a directory named "public_gopher" in their home directory,
then the file /home/bob/public_gopher/foo/bar/baz.ext will be
accessible via the selector ~bob/foo/bar/baz.ext (if permissions
allow).  The name of the "public_gopher" directory can be changed via
the -u option.  This is a convenient feature for those who want to
host multiple users, although it can of course be emulated with
symlinks for other server software.

Automatically generated directory listings list files in alphabetical
order.  This is less than ideal for phloggers who usually want the
most recent entry to appear at the top.  The conventional workaround
for this seems to be to prefix filenames with some kind of timestamp
that sorts nicely alphabetically.  YYYYMMDD timestamps obviously work
nicely, but a three-character alphanumeric code also sees some use,
see e.g. gopher://grex.org:70/0/~tfurrows/phlog_filename.txt.

Automatically generated menus can be overridden by creating a file
named "gophermap" in any directory.  Menu items are specified with
lines of the type:

Xname&lt;TAB&gt;selector&lt;TAB&gt;host&lt;TAB&gt;port

where X is the gopher item type. The host and port may be omitted,
in which case they will be set to the same host and port that the
server is running on (the server's idea of its own hostname can be
forced with the -h option).  The selector may also be omitted, in
which case it will be set equal to the name.  Lines not beginning
with a valid item type or with one of Gophernicus' own non-standard
control characters are treated as information lines (type i).

It is important to note that selectors which do not begin with a /
will be interpreted as *relative* links, e.g. a selector of "bar"
specified in "foo/gophermap" will point to "foo/bar".  Selectors
beginning with / are treated as absolute links.  Some other gopher
servers with seemingly compatible gophermap syntax (e.g. PyGopherd)
treat all selectors as absolute and this can cause headaches when
attempting to port gophermaps from one server to another.

Dynamically generated menus are possible by making the "gophermap"
file a world-executable script which produces output on stdout of
exactly the same format as a static gophermap.

As a lightweight alternative to gophermaps, a file named "gophertag"
may be placed in any directory containing a "user friendly" name for
that directory to be used in automatically generated listings (e.g.
you could placed a gophertag file containing the text
"Miscellaneous photographs" in the directory "misc_photos").

