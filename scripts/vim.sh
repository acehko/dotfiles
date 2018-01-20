#!/usr/bin/env bash
set -e

# Install Vim-Plug
echo -en "\\nInstalling Vim-Plug... "
if [ ! -e "$HOME/.vim/autoload/plug.vim" ]; then
    echo -e "\\n"
    curl -Lo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    echo -e "\\n"
else
    echo "Already installed"
fi


# Symlink neovim config
echo -en "\\nLinking neovim config... "
if [ -e "$HOME/.config/nvim/init.vim" ]; then
    echo "Already exists"
else

    # Create dir if it doesn't exist
    if [ ! -e "$HOME/.config/nvim" ]; then
        mkdir -p "$HOME/.config/nvim"
    fi

    ln -s "$DOTFILES/vim/init.vim" "$HOME/.config/nvim/init.vim"
    echo -en "\\n"

fi

# Install plugins
echo "Installing vim plugins..."
nvim +PlugClean! +qa
nvim +PlugUpdate +qa
nvim +UpdateRemotePlugins +qa
