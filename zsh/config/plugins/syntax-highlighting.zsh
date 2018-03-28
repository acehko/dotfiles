#!/usr/bin/env zsh

# Syntax Highlighting config

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=$COLOR_RED
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=$COLOR_ORANGE
ZSH_HIGHLIGHT_STYLES[precommand]=fg=none
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=$COLOR_ORANGE
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[globbing]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=$COLOR_GREEN
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=$COLOR_GREEN
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=$COLOR_GREEN
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=$COLOR_WHITE
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=$COLOR_WHITE
ZSH_HIGHLIGHT_STYLES[redirection]=fg=COLOR_ORANGE
ZSH_HIGHLIGHT_STYLES[arg0]=fg=$COLOR_BLUE

ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=$COLOR_RED
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=$COLOR_BLUE
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=$COLOR_BLUE
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=$COLOR_BLUE
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=$COLOR_BLUE
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=$COLOR_BLUE