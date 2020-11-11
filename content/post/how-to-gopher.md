---
date: 2018-09-21 21:09:55 -0400
title: "How to Gopher"
tags:
  - Introduction
---

Originally published by **dbucklin** at
_gopher://sdf.org:70/0/users/dbucklin/posts/how\_gopher.txt_

- - - - -

```

From: dbucklin@sdf.org
Date: 2018-03-31
Subject: How to Gopher

In principal, publishing a Gopher site should be easy.  And it *is*
easy, assuming you are willing to put in some effort.  At  minimum,
you  need to find someone who is already operating a Gopher server,
find out how to get access to the server, and  then  create,  orga-
nize, and upload your content.

At most, you need to set up a gopher server -- not just the daemon,
but set up a server or VPS with the appropriate  operating  system.
This  could be a Raspberry Pi or Beaglebone Black on your home net-
work, or a VPS at Digital Ocean, Vultr, Lightsail, or any number of
VPS providers.

Neither of these are as easy as setting up a blog at WordPress.com,
but you're here to set up a gopher hole, right?  I won't cover  how
to  set  up  a  VPS  or some other incarnation of a server.  I also
won't cover how to choose, install, and configure a gopher  server.
Aside from that, there's really only three things you need to do:

* Create your content
* Organize your content
* Upload your content

Assuming  all goes to plan, you will have a gopher hole that anyone
willing to fire up a gopher client can see.

Creating Content

If content is king on the web, on Gopher it's...  the  only  thing.
The  good news is that just about every device has a text editor on
it.  Don't use anything  with  formatting  in  it  (e.g.  Microsoft
Word),  that's not plain text.  Some of the fancier word processing
programs can output plain text if you tell them to.   Beyond  that,
what content you choose to share is up to you.  You could write :

* a gopher log, or phlog, with posts on any topic you like
* short stories
* instructions on how to do things
* poetry or song lyrics
* screenplays or librettos
* your own dictionary
* research articles
* book reviews
* class notes
* ASCII art
* a mix of all of the above

You could also collect documents from around the internet and share
them.  Most Gopher clients only display plain text files.  They can
also  handle  downloading  files, but not viewing them.  That means
that someone can download a PDF,  for  example,  from  your  gopher
hole,  but they will need a PDF viewer to see it.  The same applies
to images.

Organize Your Content

Content in a gopher hole is organized through the gophermap.  A go-
phermap  is  a  plain  text  file that contains selectors for other
files, including gophermaps, in your gopher hole or,  indeed,  any-
where  in  gopherspace.   A selector is the location of a file on a
gopher server.  So, a gophermap is a list of the locations of other
files on the server.

Creating  a  gophermap  is  one of the more technical challenges in
creating a gopher hole because of the specific formatting  require-
ments for gophermaps.  Each line in a gophermap begins with an item
type indicator.  An item type indicator is a single character  that
tells  the gopher client how it should handle the rest of the line.
To set up a very basic gopher  hole,  you  only  need  three  items
types: i, 1, and 0.

+-----+-----------------------------------------------------------+
|Type | Function                                                  |
+-----+-----------------------------------------------------------+
|i    | Tells  the  gopher client to display the rest of the line |
|     | unaltered. This type is used to add information to a  go- |
|     | phermap  to help explain, for example, one or more selec- |
|     | tors.                                                     |
+-----+-----------------------------------------------------------+
|1    | Indicates that the selector refers to another  gophermap. |
|     | Multiple  gophermaps can be used to give your gopher hole |
|     | some structure.                                           |
+-----+-----------------------------------------------------------+
|0    | Indicates a selector that refers to  a  text  file.  This |
|     | tells  the gopher client that the file referred to in the |
|     | selector is a plain text file.                            |
+-----+-----------------------------------------------------------+

For example, you could create a top-level gopher map that points to
an  About  Me  file, and to other gophermaps for Books, Movies, and
Knitting Projects.  The item type for the About Me file would be  0
since  it  is  pointing  to  a text file.  The item type for Books,
Movies, and Knitting Projects would be  1  because  they  point  to
folders  that  contain  other gophermaps.  A gophermap can also in-
clude lines that use type i to provide  inline  information.   This
lets  you  give  visitors  context around the selectors in your go-
phermap.  Lines that use type 1 and 0 require a specific format:

         Tlabel&lt;tab&gt;path&lt;tab&gt;host&lt;tab&gt;port

Here's a breakdown of what this means:

+--------+---------------------------------------------------+
|Element | Function                                          |
+--------+---------------------------------------------------+
|T       | The item type code (e.g. 1, 0, i)                 |
+--------+---------------------------------------------------+
|label   | A human-readable label for this item (e.g. Books) |
+--------+---------------------------------------------------+
|path    | The relative path to the target file              |
+--------+---------------------------------------------------+
|host    | The hostname of the target gopher server          |
+--------+---------------------------------------------------+
|port    | The gopher server port (usually 70).              |
+--------+---------------------------------------------------+
|&lt;tab&gt;   | A literal tab character (ASCII character 9)       |
+--------+---------------------------------------------------+

Depending on the gopher server, you may be able to omit the  server
and port fields if your selectors are on the same server as the go-
phermap.  I'm going to omit these fields from  the  examples  below
for readability.

Let's  assume  we  have folders called books, movies, and knitting,
and a text file named about.txt.  Our folder structure  would  look
like this:

         -home
          +books/
          +movies/
          +knitting/
           about.txt

Our hypothetical gophermap looks like this:

         0About Me&lt;tab&gt;about.txt
         1Books&lt;tab&gt;books
         1Movies&lt;tab&gt;movies
         1Knitting Projects&lt;tab&gt;knitting

We can add some i type lines to this to give some context.

         iWelcome to my gopher hole!
         i
         0About Me&lt;tab&gt;about.txt
         i
         iHere are some books that I've read.
         1Books&lt;tab&gt;books
         i
         iI also like to write about movies.
         1Movies&lt;tab&gt;movies
         i
         iI collect knitting projects.
         1Knitting Projects&lt;tab&gt;knitting

Let's put this main gophermap in our home folder.

         -home
          +books/
          +movies/
          +knitting/
           about.txt
           gophermap

Uploading Content

Once  your  work has been edited, spell-checked, and formatted, you
will want to put it up on a gopher server where  other  people  can
read  it.   There  are  many tools that will help you transfer your
content to your host, and I'm not going to cover  them  here.   The
process  of  uploading  your content will depend heavily on the ma-
chine and operating system you are using.  It's  most  likely  that
you  will  be  required  by your host to use a secure file transfer
protocol such as SFTP or SCP.  Your host should be able to  provide
you with information about how they expect you to transfer files to
their system.  To find a suitable client, your best bet is  to  use
your favorite search engine.  Your system administrator may be able
to provide some advice.

After you've uploaded your content, it's time to test  your  gopher
hole!   Be  sure to test your gopher hole each time you upload con-
tent.  I can't tell you how many mistakes I've  caught  only  after
uploading  my content.  Spelling mistakes, gophermap format errors,
missing files... all of it.  Make sure you  achieved  the  intended
outcome.

Finally, be sure to make a backup of your work.  Writing takes time
and effort.  Don't lose all that work because your hard drive fails
or  you  fall victim to malicious software.  Here, again, there are
many ways to do this.  I recommend doing a little research to  find
a  method  that  will  work in your particular circumstances.  Make
sure you back up your work regularly.

It Gets Easier

When I think about the work that goes into  putting  a  simple  web
page  or  text file on the internet, I realize how inaccessible the
internet is for most people.  As I write this, there is no  commer-
cial interest in Gopher.  Many, myself included, hope it stays that
way.  This means that there's no one trying to  make  all  of  this
push-button-simple  so  that they can make a buck off of you on the
back end.  I think that if more regular folks feel like they own  a
piece  of the internet, they will be more likely to resist policies and
practices that aim to disenfranchise them.

```

<!--  vim: set shiftwidth=4 tabstop=4 expandtab: -->
