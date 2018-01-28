#!/usr/bin/env bash

get_idle() {
    echo "$1" | awk '/^cpu /{print $5}'
}

get_total() {
    echo "$1" | awk '/^cpu /{print $2+$3+$4+$5}'
}

stat=$(cat /proc/stat)
previdle=$(get_idle "$stat")
prevtotal=$(get_total "$stat")

sleep 0.4

stat=$(cat /proc/stat)
idle=$(get_idle "$stat")
total=$(get_total "$stat")

intervaltotal=$((total - ${prevtotal:-0}))

cpu="$((100 * ((intervaltotal) - (idle - ${previdle:-0})) / (intervaltotal)))"

if [ $cpu -gt 80 ]; then
    echo "#[fg=colour231,bg=colour88] CPU #[bg=colour233] "
fi
