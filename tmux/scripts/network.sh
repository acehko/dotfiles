#!/usr/bin/env bash

PING_SERVER="8.8.8.8"

COLOR_EMPTY="#[bg=default]"
COLOR_DOWN="#[fg=$COLOR_TMUX_BACKGROUND,bg=$COLOR_TMUX_RED]"

if ! ping -q -c 1 -W 1 $PING_SERVER >/dev/null; then
    echo "$COLOR_DOWN NET $COLOR_EMPTY "
fi
