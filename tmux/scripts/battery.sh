#!/usr/bin/env bash

BATTERY_LOW=30

COLOR_CHARGING="#[fg=colour$COLOR_GREEN]"
COLOR_DISCHARGING="#[fg=colour$COLOR_ORANGE]"
COLOR_LOW="#[fg=colour$COLOR_RED]"

if [[ $(acpi) =~ ^Battery\ 0:\ ([a-zA-Z]+),\ ([0-9]+)%.*$ ]]; then
    status=${BASH_REMATCH[1]}
    percentage=${BASH_REMATCH[2]}

    if [[ $status == "Charging" ]]; then
        echo "$COLOR_CHARGING "
    elif [[ $status == "Discharging" ]]; then
        if [[ $percentage -le $BATTERY_LOW ]]; then
            echo "$COLOR_LOW "
        else
            echo "$COLOR_DISCHARGING "
        fi
    fi
fi
