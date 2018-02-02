#!/usr/bin/env bash

PING_SERVER="8.8.8.8"

COLOR_EMPTY="#[bg=colour$COLOR_BLACK]"
COLOR_DOWN="#[fg=colour188,bg=colour$COLOR_DARK_RED]"

if ! ping -q -c 1 -W 1 $PING_SERVER >/dev/null; then
    echo "$COLOR_DOWN NET $COLOR_EMPTY "
fi
