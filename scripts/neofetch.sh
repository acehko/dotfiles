#!/usr/bin/env bash


# Link dotfiles
echo -en "\nLinking neofetch config... "
if [ -e $HOME/.config/neofetch/config ]; then
	echo "Already exists"
else
	ln -s $DOTFILES/neofetch/config $HOME/.config/neofetch/config
	echo -en "\n"
fi
