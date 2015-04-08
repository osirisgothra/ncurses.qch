(for i in *.html; do b=${i%%.*};echo "<keyword name=\"$b\" ref=\"$i\" id=\"$b\"/>"; done) > keywords.lst
