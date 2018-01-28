#!/usr/bin/env bash

MEM_MEDIUM=75
MEM_HIGH=90

SWAP_MEDIUM=10
SWAP_HIGH=50

COLOR_EMPTY="#[bg=colour233]"
COLOR_MEDIUM="#[fg=colour233,bg=colour88]"
COLOR_HIGH="#[fg=colour233,bg=colour215]"

get_mem() {
    free | grep "$1" | awk '{printf "%.0f\n", ($3+$5)/$2*100}'
}

show_warning() {
    type=$1
    mem=$2
    medium=$3
    high=$4

    if [ "$mem" -gt "$medium" ]; then
        if [ "$mem" -gt "$high" ]; then
            COLOR=$COLOR_MEDIUM
        else
            COLOR=$COLOR_HIGH
        fi

        echo "$COLOR $type $COLOR_EMPTY "
    fi
}

mem=$(get_mem "Mem")
swap=$(get_mem "Swap")

mem_warning=$(show_warning "RAM" "$mem" "$MEM_MEDIUM" "$MEM_HIGH")
swap_warning=$(show_warning "SWAP" "$swap" "$SWAP_MEDIUM" "$SWAP_HIGH")

echo "${mem_warning}${swap_warning}"
