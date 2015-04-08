( for i in *.html; do b=${i%%.*};echo "<file>$i</file>"; done ) > files.lst
