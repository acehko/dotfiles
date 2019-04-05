#!/usr/bin/env bash

CPU_PERIOD=1
CPU_MEDIUM=75
CPU_HIGH=90

COLOR_EMPTY="#[bg=default]"
COLOR_MEDIUM="#[fg=$COLOR_TMUX_BACKGROUND,bg=$COLOR_TMUX_YELLOW]"
COLOR_HIGH="#[fg=$COLOR_TMUX_BACKGROUND,bg=$COLOR_TMUX_RED]"

get_idle() {
    echo "$1" | awk '/^cpu /{print $5}'
}

get_total() {
    echo "$1" | awk '/^cpu /{print $2+$3+$4+$5}'
}

stat=$(cat /proc/stat)
previdle=$(get_idle "$stat")
prevtotal=$(get_total "$stat")

sleep $CPU_PERIOD

stat=$(cat /proc/stat)
idle=$(get_idle "$stat")
total=$(get_total "$stat")

intervaltotal=$((total - ${prevtotal:-0}))

cpu="$((100 * ((intervaltotal) - (idle - ${previdle:-0})) / (intervaltotal)))"

if [ $cpu -ge $CPU_MEDIUM ]; then
    if [ $cpu -ge $CPU_HIGH ]; then
        COLOR=$COLOR_HIGH
    else
        COLOR=$COLOR_MEDIUM
    fi

    echo "$COLOR CPU $COLOR_EMPTY "
fi
