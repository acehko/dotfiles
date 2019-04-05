#!/usr/bin/env bash

source /home/andrija/dotfiles/zsh/config/colors.zsh

i3lock \
    --blur=10 \
    --clock \
    --indicator \
    --line-uses-inside \
    --insidecolor="${COLOR_RAW_HEX_BLACK}FF" \
    --ringcolor="${COLOR_RAW_HEX_BRIGHT_BLACK}FF" \
    --timecolor="${COLOR_RAW_HEX_FOREGROUND}FF" \
    --datecolor="${COLOR_RAW_HEX_FOREGROUND}FF" \
    --keyhlcolor="${COLOR_RAW_HEX_BLUE}FF" \
    --separatorcolor="${COLOR_RAW_HEX_BRIGHT_BLACK}FF" \
    --insidevercolor="${COLOR_RAW_HEX_BLACK}FF" \
    --ringvercolor="${COLOR_RAW_HEX_BLUE}FF" \
    --verifcolor="${COLOR_RAW_HEX_FOREGROUND}FF" \
    --insidewrongcolor="${COLOR_RAW_HEX_BLACK}FF" \
    --ringwrongcolor="${COLOR_RAW_HEX_RED}FF" \
    --wrongcolor="${COLOR_RAW_HEX_RED}FF" \
    --bshlcolor="${COLOR_RAW_HEX_RED}FF"
