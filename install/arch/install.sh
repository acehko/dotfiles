#!/usr/bin/env bash
# shellcheck disable=SC1090
set -e

echo '_________     _______________________
______  /_______  /___  __/__(_)__  /____________
_  __  /_  __ \  __/_  /_ __  /__  /_  _ \_  ___/
/ /_/ / / /_/ / /_ _  __/ _  / _  / /  __/(__  )
\__,_/  \____/\__/ /_/    /_/  /_/  \___//____/
'

source "$(dirname "$0")/helpers.sh"

source "$DIR/common.sh"
source "$DIR/devel.sh"

source "$DIR/alacritty.sh"
source "$DIR/zsh.sh"
source "$DIR/git.sh"
source "$DIR/fzf.sh"
source "$DIR/tmux.sh"
source "$DIR/nvim.sh"
source "$DIR/neofetch.sh"

source "$DIR/xorg.sh"
source "$DIR/lightdm.sh"
source "$DIR/i3.sh"
source "$DIR/polybar.sh"
source "$DIR/rofi.sh"
source "$DIR/gui.sh"
