#!/usr/bin/env bash

BATTERY_LOW=30

COLOR_CHARGING="#[fg=colour107]"
COLOR_DISCHARGING="#[fg=colour215]"
COLOR_LOW="#[fg=colour167]"

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
