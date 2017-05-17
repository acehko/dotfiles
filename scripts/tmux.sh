#!/usr/bin/env bash


# Install Tmux Pluin Manager
echo -en "\nInstalling TPM... "
if [ ! -e $HOME/.tmux/plugins/tpm ]; then
	echo -e "\n"
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
	echo -e "\n"
else
	echo "Already installed"
fi


# Create a new tmux session
tmux has || tmux new-session -d -s main

# Initialize TPM
tmux source-file $DOTFILES/tmux/tmux.conf.symlink


# Install plugins
echo "Installing tmux plugins..."
source $HOME/.tmux/plugins/tpm/bin/install_plugins
source $HOME/.tmux/plugins/tpm/bin/update_plugins all
