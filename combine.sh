#!/bin/bash

if [[ -r output.qhp ]]; then
	echo "Error: There is already an output.qhp file in this directory. You must remove it yourself before running this command."
	echo "       It is a security precaution and it is also meant to prevent accidental deletions of the project file(s)"
	echo "stop."
	exit 3
fi	
if [[ ! -w . ]]; then
	echo "Error: you cannot write to this directory, generation is impossible, please copy files to a permissive location!"
	echo "stop."
	exit 2
fi
if [[ ! -r section.lst || ! -r keywords.lst || ! -r files.lst ]]; then
	echo "Error: you need to create the section.lst,keywords.lst and files.lst to proceed"
	echo "       You can create them using their respective sections.sh/keywords.sh/files.sh"
	echo "       scripts. You MUST have your documentation in HTML format (man2html) first,"
	echo "		 and it must be in THE SAME DIRECTORY AS THESE FILES."
	echo "stop."
	exit 1
fi
echo "found lists, reading files..."

mapfile SECTIONS < section.lst
mapfile KEYWORDS < keywords.lst
mapfile FILES < files.lst

echo "...finished reading ${#SECTIONS[@]} section(s), ${#KEYWORDS[@]} keywords, ${#FILES[@]} files"	
echo "writing output file \"output.qhp\"..."

cat <<-EOF > output.qhp
<?xml version="1.0" encoding="UTF-8"?>
<QtHelpProject version="1.0">
	<namespace>ncurses</namespace>
	<virtualfolder>ndoc</virtualfolder>
	<customfilters name="ncurses">
		<filterattribute>ncurses</filterattribute>
	</customfilters>
	<filtersection>
		<filterattribute>ncurses</filterattribute>
		<toc>
			${SECTIONS[@]}
		</toc>
		<keywords>
			${KEYWORDS[@]}
		</keywords>
		<files>
			${FILES[@]}
		</files>
	</filtersection>
</QtHelpProject>
EOF

if [[ -r output.qhp ]]; then
	echo "Finished, use the qt help compiler to create your new qch file!"
else
	echo "Error: output.qhp missing, disk full?"
fi