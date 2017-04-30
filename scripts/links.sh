#!/usr/bin/env bash


# Link dotfiles
echo -e "\nLinking dotfiles..."

for file in $(find "$DOTFILES" -name "*.dot"); do

	link="$HOME/.$(basename $file ".dot")"

	echo -n "$link... "
	if [ -e $link ]; then
		echo "Already exists"
	else
		ln -s $file $link
		echo -en "\n"
	fi

done
