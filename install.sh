#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
echo "Installing all packages:"

declare -a INSTALLER=(
"initial"
"vim"
"terminator"
"git"
"zsh"
"encfs"
"insync"
"python3"
"shutter"
"visualstudiocode"
"asciidoc"
"gnormalize"
"borgbackup"
"hidrive"
"puddletag"
"android_dev"
)

for i in ${INSTALLER[@]}
do
	echo ""
	$DIR/scripts/$i.sh $DIR
	echo ""
	read -p "Continue? [YyJj] " -n 1 -r
	echo
	if [[ $REPLY =~ ^[YyJj]$ ]]
	then
		continue
	else
		break
	fi
done
