#!/usr/bin/env bash


DOTFILES=$HOME/dotfiles


echo "_________     _______________________
______  /_______  /___  __/__(_)__  /____________
_  __  /_  __ \  __/_  /_ __  /__  /_  _ \_  ___/
/ /_/ / / /_/ / /_ _  __/ _  / _  / /  __/(__  )
\__,_/  \____/\__/ /_/    /_/  /_/  \___//____/"



echo -e "\n\nInstalling...\n"


echo -en "Vim-Plug... "
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
	echo -e "\n"
	curl -Lo $HOME/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo -e "\n"
else
	echo "Already installed"
fi

echo -en "Antigen... "
if [ ! -e $DOTFILES/zsh/antigen/antigen.zsh ]; then
	echo -e "\n"
	curl -Lo $DOTFILES/zsh/antigen/antigen.zsh --create-dirs git.io/antigen
else
	echo "Already installed"
fi



echo -e "\n\nLinking...\n"

for file in $(find "$DOTFILES" -name "*.dot"); do

	link="$HOME/.$(basename $file ".dot")"

	if [ -e $link ]; then
		echo "$link... Already exists"
	else
		echo "$link..."
		ln -s $file $link
	fi

done


echo -e "\nInstalling vim plugins..."

vim +PlugInstall +qall


echo -e "\nDone"
