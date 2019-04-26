#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2034
set -e

# Already loaded, return
if [[ -n "$HELPERS_LOADED" ]]; then
    return
fi

# Set current directory
DIR="$(dirname "$0")"
echo "$DIR"

# Load environment variables
source "$DIR/../../zsh/.zshenv"

# YAY is not installed, install
if ! command -v yay >/dev/null; then
    echo -e "\\nYAY is not installed, installing..."

    # Git is not intalled, install
    if ! command -v git >/dev/null; then
        echo "Installing git..."
        "$PACMAN" git
    fi

    echo "Installing YAY..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si

    cd "$DIR"
fi

PACMAN() {
    sudo pacman -S --needed --noconfirm "$@"
}

AUR() {
    yay -S --needed --noconfirm "$@"
}

LINK() {
    local source_dir="$1"
    local target_dir="$2"
    for file in "${@:3}"; do
	mkdir -p "$target_dir"
        ln -sf "$source_dir/$file" "$target_dir/$file"
        echo "$file"
    done
}

# Mark as loaded
HELPERS_LOADED=1
