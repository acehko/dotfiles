#!/usr/bin/env bash
set -e


DOTFILES=$HOME/dotfiles


echo "_________     _______________________
______  /_______  /___  __/__(_)__  /____________
_  __  /_  __ \  __/_  /_ __  /__  /_  _ \_  ___/
/ /_/ / / /_/ / /_ _  __/ _  / _  / /  __/(__  )
\__,_/  \____/\__/ /_/    /_/  /_/  \___//____/
"


# Load OS name
for file in /etc/*-release; do
	source $file
done

OS=$NAME
echo -e "\nOS: $OS"


# Install os-specific packages
if [ "$OS" == "Ubuntu" ]; then
	source $DOTFILES/scripts/ubuntu.sh
elif [ "$OS" == "Arch Linux" ]; then
	source $DOTFILES/scripts/arch.sh
else
	echo "No package install script for $OS. Skipping..."
fi


# Install node modules
source $DOTFILES/scripts/npm.sh


# Link dotfiles and install vim and zsh plugins
source $DOTFILES/scripts/links.sh
source $DOTFILES/scripts/vim.sh
source $DOTFILES/scripts/zsh.sh
source $DOTFILES/scripts/tmux.sh


echo -e "\nDone"
