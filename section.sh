(for i in *.html; do b=${i%%.*};echo "<section ref=\"$i\" title=\"$b: $(whatis $b | perl -wpe 's/.*-\s*//g;s/\n//gm;s/(.*)(s)$/$1/g')\"/>"; done) > section.ls
