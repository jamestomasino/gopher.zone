---
date: 2018-11-02 17:19:19 -0400
title: "How to gophermap"
---

Originally published by **cat** at
_gopher://baud.baby/0/phlog/fs20181102.txt_

- - - - -

<pre>
   2018-11-02                                   /        \/        \/    /   \
                                               /       __/         /_       _/
   A common question  I get about  baud.baby  /        _/         /         /
is  "How  did  you do that?"  and  it always  \_______/_\___/____/\___/____/_
mystifies  me  because  nothing   I   do  is    /        \/        \/    /   \
difficult  so let me coach you on the basics   /        _/         /_       _/
of gophermap-fu. Let  me  just  preface this  /-        /        _/         /
with my usual rant: Gopher  is not  a pretty  \________/\________/\___/____/
protocol,  it can be beautified somewhat but
at  its  heart Gopher  is  about  delivering  content.  It's one thing to  put
together a fancy-pants gophermap with fun ASCII banners and who knows what but
if there's no content  no one is going to care and  no one is going to revisit
it. For example, did you know I have a Gopher space on tilde.town? Most people
don't because it's just a mildly interesting  one-shot, there's nothing  there
to bring people  back, nothing to talk about beyond "heh looks neat". I put  a
lot of effort  into it but  at the end  of the day  who cares? Content is what
drives Gopher, delivering content is what Gopher does best.

   It doesn't matter how  much time you put into a gophermap  file and a fancy
ASCII banner  and all  that,  if you don't have content  to serve  then it  is
wasted effort.

   Anyway,  enough preaching. The most common  mistake  I've seen in  people's
gopher  spaces  and from new users is approaching it like it's a web  page and
trying to throw an index.html  file into a gopher  space or trying to format a
gophermap  with  HTML markup. Gopher  isn't  HTML,  there's  no index.html  or
anything like  that. A  gopher space, no  matter  how pretty it is is far more
analogous to a file of  tab-separated values than an HTML  document, in that a
gophermap  is quite literally a table  of tab-separated values. Let me try and
illustrate.

   A nice table of contacts:


      Salutation|Name       |Phone Number  |Email Address
      ----------|-----------|--------------|-------------------
      Mr        |John Smith |(858) 651-5050|jsmith@example.com
      Miss      |Jane Doe   |(801) 820-0263|missdoe@noemail.com


   The same data as a tab-separated file:


      Mr[tab]John Smith[tab](858) 651-5050[tab]jsmith@example.com
      Miss[tab]Jane Doe[tab](801) 820-0263[tab]missdoe@noemail.com


   A nice pseudo-gophermap, represented as a table:


      File description       |Path and Filename        |Domain |Port
      -----------------------|-------------------------|-------|----
      notes.txt              |/home/me/notes.txt       |my.site|70
      construction.gif       |/home/me/construction.gif|my.site|70
      directory of more files|/home/me/morefiles/      |my.site|70


   The same gophermap as, uh... a gophermap:


      notes.txt[tab]/home/me/notes.txt[tab]my.site[tab]70
      construction.gif[tab]/home/me/construction.gif[tab]my.site[tab]70
      directory of more files[tab]/home/me/morefiles/[tab]my.site[tab]70


   Of course, though, nothing is that straight forward.  The first "column" of
a gophermap not only  describes the file to humans, it also describes the type
of  file, or  "itemtype", to Gopher  clients and  it does  so using  the first
character of the  description. It's similar to  how some  filesystems will use
the  characters after the last period in a filename  as  an indicator  of what
type of file a file is. The standard Gopher itemtypes and their indicator are:


      Indicator   | Itemtype
      ------------|-----------------------------------------
      0           | Text file
      1           | Gopher submenu/directory
      2           | CCSO Nameserver
      3           | Error code
      4           | BinHex-encoded file (primarily for Macs)
      5           | DOS binary
      6           | UNIX uuencoded file
      7           | Gopher full-text search
      8           | Telnet
      9           | Binary file
      +           | Mirror or alternate server
      g           | GIF file
      I           | Other image file
      T           | Telnet 3270


   And  though non-canonical, I think most  clients/servers  will also support
the following:


      Indicator   | Itemtype
      ------------|-----------------------------------------
      h           | HTML, Hypertext Markup Language
      i           | inline text or info line
      s           | Sound/wav file


   So reworking  our example  above  but  continuing  the  tab-separated  file
analogy, the file descriptions would look something like this as a table:


      File description        |Path and Filename        |Domain |Port
      ------------------------|-------------------------|-------|----
      0notes                  |/home/me/notes.txt       |my.site|70
      gconstruction           |/home/me/construction.gif|my.site|70
      1directory of more files|/home/me/morefiles/      |my.site|70


   And like this as a tab-separated file or gophermap:


      0notes[tab]/home/me/notes.txt[tab]my.site[tab]70
      gconstruction[tab]/home/me/construction.gif[tab]my.site[tab]70
      1directory of more files[tab]/home/me/morefiles/[tab]my.site[tab]70


   And  that's it! That's honestly  all there is  to it: a description  of the
file, prefixed  with one of the Gopher itemtypes,  then the  filename with the
path if necessary,  then the domain it's on and  then the port used to  access
it.

   "Ok Cat, but now this is just a list of files, how do I make it FANCY?!"

   It's  no different  to any other line in a gophermap file! In the  list  of
itemtypes above  there's an item i for "inline  text" or an info line, this is
essentially an itemtype that does not link to a file, it only prints the  item
description and is ostensibly used to provide helpful information to the user.

   So, ok, you've gone to FIGlet dot com and got ya fresh new ASCII banner...

   "Man it's so cool I'm just  gonna  paste it right-""

   Now  hold  up one minute there!  First some  rules; your  super l33t banner
can't have  any tabs in  it because tabs  are separators  remember and it also
can't  be  too wide, the  loose-rule  is  67 characters  wide,  excluding  the
itemtype  prefix.  Yeah? The  last rule  is my rule;  don't cut corners.  Some
clients will  render inline text without the identifier, some won't. Some will
render it  if  you  just put the itemtype  and some won't.  If  you don't  cut
corners and have the  itemtype and  the path/host/port at the end then  you're
golden, everything should render that line properly.

   "Whatever, Cat."

   Ok, ok. Imagine your dope ass FIGlet logo looks like this:


           _____          _____        _____       ______
       ___|\    \    ____|\    \   ___|\    \  ___|\     \
      |    |\    \  /     /\    \ |    |\    \|     \     \
      |    | |    |/     /  \    \|    | |    |     ,_____/|
      |    | |    |     |    |    |    |/____/|     \--'\_|/
      |    | |    |     |    |    |    ||    ||     /___/|
      |    | |    |\     \  /    /|    ||____|/     \____|\
      |____|/____/| \_____\/____/ |____|      |____ '     /|
      |    /    | |\ |    ||    | /    |      |    /_____/ |
      |____|____|/  \|____||____|/|____|      |____|     | /
                                                   |_____|/


   So fucking cool! So  now, using  our  table  analogy, let's  imagine how it
would look. Note  the  i  itemtype  in  the first  column and  the file/server
information following it:


      File description                                       |Path and Filename|Domain   |Port
      -------------------------------------------------------|-----------------|---------|----
      i     _____          _____        _____       ______   |/                |localhost|70
      i ___|\    \    ____|\    \   ___|\    \  ___|\     \  |/                |localhost|70
      i|    |\    \  /     /\    \ |    |\    \|     \     \ |/                |localhost|70
      i|    | |    |/     /  \    \|    | |    |     ,_____/||/                |localhost|70
      i|    | |    |     |    |    |    |/____/|     \--'\_|/|/                |localhost|70
      i|    | |    |     |    |    |    ||    ||     /___/|  |/                |localhost|70
      i|    | |    |\     \  /    /|    ||____|/     \____|\ |/                |localhost|70
      i|____|/____/| \_____\/____/ |____|      |____ '     /||/                |localhost|70
      i|    /    | |\ |    ||    | /    |      |    /_____/ ||/                |localhost|70
      i|____|____|/  \|____||____|/|____|      |____|     | /|/                |localhost|70
      i                                             |_____|/ |/                |localhost|70


   And now as tab-separated values AKA a gophemap:


      i     _____          _____        _____       ______[tab]/[tab]localhost[tab]70
      i ___|\    \    ____|\    \   ___|\    \  ___|\     \[tab]/[tab]localhost[tab]70
      i|    |\    \  /     /\    \ |    |\    \|     \     \[tab]/[tab]localhost[tab]70
      i|    | |    |/     /  \    \|    | |    |     ,_____/|[tab]/[tab]localhost[tab]70
      i|    | |    |     |    |    |    |/____/|     \--'\_|/[tab]/[tab]localhost[tab]70
      i|    | |    |     |    |    |    ||    ||     /___/|[tab]/[tab]localhost[tab]70
      i|    | |    |\     \  /    /|    ||____|/     \____|\[tab]/[tab]localhost[tab]70
      i|____|/____/| \_____\/____/ |____|      |____ '     /|[tab]/[tab]localhost[tab]70
      i|    /    | |\ |    ||    | /    |      |    /_____/ |[tab]/[tab]localhost[tab]70
      i|____|____|/  \|____||____|/|____|      |____|     | /[tab]/[tab]localhost[tab]70
      i                                             |_____|/[tab]/[tab]localhost[tab]70


   See,  you've got  it! That's  the whole  deal, there's no  mystery  to  it,
there's no secret Gopher technique, just a table of tab-separated values saved
into your Gopher space with the filename "gophermap".

   "But  Cat, you know that's not what we're asking right? We want to know how
to make all our own  original  ASCII  text and  stuff  ourselves, how do we do
that?"

   Huh? Fucked if I know.



EOF

</pre>

<!--  vim: set shiftwidth=4 tabstop=4 expandtab: -->
