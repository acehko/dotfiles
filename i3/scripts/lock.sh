#!/usr/bin/env bash

color_background=2E3440FF
color_ring=4C566AFF
color_text=88C0D0FF
color_keypress=88C0D0FF

color_verify_background=$color_background
color_verify_ring=88C0D0FF
color_verify_text=88C0D0FF

color_wrong_background=$color_background
color_wrong_ring=BF616AFF
color_wrong_text=BF616AFF

i3lock \
    --blur=10 \
    --clock \
    --indicator \
    --line-uses-inside \
    --insidecolor=$color_background \
    --ringcolor=$color_ring \
    --timecolor=$color_text \
    --datecolor=$color_text \
    --keyhlcolor=$color_keypress \
    --separatorcolor=$color_background \
    --insidevercolor=$color_verify_background \
    --ringvercolor=$color_verify_ring \
    --verifcolor=$color_verify_text \
    --insidewrongcolor=$color_wrong_background \
    --ringwrongcolor=$color_wrong_ring \
    --wrongcolor=$color_wrong_text \
    --bshlcolor=$color_wrong_text
