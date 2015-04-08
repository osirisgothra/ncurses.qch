# ncurses.qch

It's just a qch help file for QtCreator featuring all the ncurses5 documentation manpages

It also has full F1 keyword support, enjoy it.

It was compiled from ncurses version 5.9

LICENSE and other stuff applies to MY parts of the contribution, not the documentation itself.

REBUILDING:

If for some crazy reason you dont like this the way it is you can rebuild it by doing this:

1) copy all ncurses documents (man pages) into an empty directory
2) decompress and then convert them all to html (probably with man2html)
3) delete the MAN versions of those files
4) copy the files from this repository into that directory
5) verify output.qch does not exist (especially if you are continuing from below)
6) source each generator script like this '. ./keywords.sh' for example, to generate keywords.lst
7) verify you have 3 (three) .lst files in there now
8) run combine.sh (not source) './combine.sh', and... drumroll..
9) run 'qhelpcompiler output.qhp -o /my/help/location/ncurses5.qch' <- or whatever name you want
10) repeat from step 5 if you lost your qch file down the road, or from step 1 (duh) to start over!
11) dont forget to add the documentation in qtcreator's help section under preferences!
12) you can quickly register with assistant by typing 'assistant -register /path/to/documentation.qch'
  ( if you see 'Documentation successfully registered' you know it worked.)


Contact me, the author, for insight or other qch's (requests, or queries on ones I might have lying around collecting dust).
<etherial_raine@outlook.com>


