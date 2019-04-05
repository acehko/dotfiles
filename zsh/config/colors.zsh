#!/usr/bin/env zsh
#
# Load color values from Xresources
while read -r prop value; do
    if [[ "$prop" == "color."* ]]; then
        prop="${prop%?}"
        declare -u var_name="${prop//./_}"
        export "$var_name"="$value"
    fi
done < <(xrdb -q)
