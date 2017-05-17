#!/usr/bin/env bash


# Link dotfiles
echo -en "\nLinking neofetch config... "
if [ -e $HOME/.config/neofetch/config ]; then
	echo "Already exists"
else

	# Create dir if not exists
	if [ ! -e $HOME/.config/neofetch ]; then
		mkdir -p $HOME/.config/neofetch
	fi

	ln -s $DOTFILES/neofetch/config $HOME/.config/neofetch/config
	echo -en "\n"

fi
