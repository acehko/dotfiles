#!/usr/bin/env bash
set -e

# Install Vim-Plug
echo -en "\\nInstalling Vim-Plug... "
if [ ! -e "$HOME/.vim/autoload/plug.vim" ]; then
    echo -e "\\n"
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
            "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    echo -e "\\n"
else
    echo "Already installed"
fi

# Install plugins
echo "Installing vim plugins..."
nvim +PlugClean! +qa
nvim +PlugUpdate +qa
nvim +UpdateRemotePlugins +qa
