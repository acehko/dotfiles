#!/usr/bin/env zsh

{% if dotfiles_distribution == 'MacOSX' %}
eval "$(/opt/homebrew/bin/brew shellenv)"
{% endif %}

{% if dotfiles_distribution == 'Debian' %}
PATH="$PATH:/snap/bin"
{% endif %}

PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
PATH="$PATH:$PYTHON_BIN_PATH"
