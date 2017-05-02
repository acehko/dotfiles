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
zsh -c "source $DOTFILES/zsh/zshrc.symlink"


# Set zsh as the default shell
if [ "$SHELL" != "$(which zsh)" ]; then
	echo -e "\nSetting zsh as the default shell..."
	chsh -s $(which zsh)
fi
