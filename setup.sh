#!/usr/bin/env bash
set -e


source ./zsh/zshenv.symlink


echo "_________     _______________________
______  /_______  /___  __/__(_)__  /____________
_  __  /_  __ \  __/_  /_ __  /__  /_  _ \_  ___/
/ /_/ / / /_/ / /_ _  __/ _  / _  / /  __/(__  )
\__,_/  \____/\__/ /_/    /_/  /_/  \___//____/
"

# Install packages
source $DOTFILES/scripts/pacman.sh
source $DOTFILES/scripts/npm.sh
source $DOTFILES/scripts/go.sh
source $DOTFILES/scripts/pip.sh
source $DOTFILES/scripts/composer.sh

# Link and setup configs
source $DOTFILES/scripts/neofetch.sh
source $DOTFILES/scripts/links.sh
source $DOTFILES/scripts/vim.sh
source $DOTFILES/scripts/zsh.sh
source $DOTFILES/scripts/tmux.sh

echo -e "\nDone"
