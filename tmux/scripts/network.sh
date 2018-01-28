#!/usr/bin/env bash

PING_SERVER="8.8.8.8"

COLOR_EMPTY="#[bg=colour233]"
COLOR_DOWN="#[fg=colour188,bg=colour88]"

if ! ping -q -c 1 -W 1 $PING_SERVER >/dev/null; then
    echo "$COLOR_DOWN NET $COLOR_EMPTY "
fi
