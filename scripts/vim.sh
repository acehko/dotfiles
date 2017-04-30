#!/usr/bin/env bash


# Install Vim-Plug
echo -en "\nInstalling Vim-Plug... "
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
	echo -e "\n"
	curl -Lo $HOME/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo -e "\n"
else
	echo "Already installed"
fi


# Install plugins
echo "Installing vim plugins..."
vim +PlugUpdate +qall
