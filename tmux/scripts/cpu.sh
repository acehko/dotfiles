#!/usr/bin/env bash

CPU_PERIOD=1
CPU_MEDIUM=75
CPU_HIGH=90

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

if [ $cpu -gt $CPU_MEDIUM ]; then
    if [ $cpu -gt $CPU_HIGH ]; then
        color="#[fg=colour233,bg=colour88]"
    else
        color="#[fg=colour233,bg=colour215]"
    fi

    echo "$color CPU #[bg=colour233] "
fi
