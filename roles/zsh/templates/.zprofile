#!/usr/bin/env zsh

{% if dotfiles_distribution == 'MacOSX' %}
eval "$(/opt/homebrew/bin/brew shellenv)"
{% endif %}

{% if dotfiles_distribution == 'Debian' %}
PATH="$PATH:/snap/bin"
{% endif %}

PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
PATH="$PATH:$PYTHON_BIN_PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

autoload -U add-zsh-hook

load-nvmrc() {
  if command -v nvm &> /dev/null; then
    if [[ -f .nvmrc && -r .nvmrc ]]; then
      nvm use > /dev/null 2>&1
    elif [[ $(nvm version) != $(nvm version default)  ]]; then
      echo "Reverting to nvm default version"
      nvm use default > /dev/null 2>&1
    fi
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
