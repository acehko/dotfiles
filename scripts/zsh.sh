#!/usr/bin/env bash


# Install Antigen
echo -en "\nInstalling Antigen... "
if [ ! -e $DOTFILES/zsh/antigen/antigen.zsh ]; then
	echo -e "\n"
	curl -Lo $DOTFILES/zsh/antigen/antigen.zsh --create-dirs git.io/antigen
else
	echo "Already installed"
fi


# Install plugins
echo "Installing zsh plugins..."
zsh -c "source $DOTFILES/zsh/zshrc.dot"
