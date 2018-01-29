#!/usr/bin/env bash

MEM_MEDIUM=75
MEM_HIGH=90

SWAP_MEDIUM=0
SWAP_HIGH=30

COLOR_EMPTY="#[bg=colour233]"
COLOR_MEDIUM="#[fg=colour233,bg=colour215]"
COLOR_HIGH="#[fg=colour188,bg=colour88]"

get_mem() {
    free | grep "$1" | awk '{printf "%.0f\n", ($3+$5)/$2*100}'
}

show_warning() {
    type=$1
    mem=$2
    medium=$3
    high=$4

    if [ "$mem" -ge "$medium" ]; then
        if [ "$mem" -ge "$high" ]; then
            COLOR=$COLOR_HIGH
        else
            COLOR=$COLOR_MEDIUM
        fi

        echo "$COLOR $type $COLOR_EMPTY "
    fi
}

mem=$(get_mem "Mem")
swap=$(get_mem "Swap")

mem_warning=$(show_warning "RAM" "$mem" "$MEM_MEDIUM" "$MEM_HIGH")
swap_warning=$(show_warning "SWAP" "$swap" "$SWAP_MEDIUM" "$SWAP_HIGH")

echo "${mem_warning}${swap_warning}"
