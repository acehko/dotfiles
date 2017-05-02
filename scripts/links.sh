#!/usr/bin/env bash


# Link dotfiles
echo -e "\nLinking dotfiles..."

for file in $(find "$DOTFILES" -name "*.symlink"); do

	link="$HOME/.$(basename $file '.symlink')"

	echo -n "$link... "
	if [ -e $link ]; then
		echo "Already exists"
	else
		ln -s $file $link
		echo -en "\n"
	fi

done
