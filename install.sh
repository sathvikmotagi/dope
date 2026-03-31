#!/bin/bash

set -e

echo "Installing Hyprland rice dependencies..."

sudo pacman -S --needed \
awww \
rofi \
waybar \
hyprlock \
hyprshot

echo "Dependencies installed."

# determine repo location
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Creating config symlinks..."

mkdir -p ~/.config

link_config () {
    src="$REPO_DIR/configs/$1"
    dest="$HOME/.config/$1"

    if [ -e "$dest" ]; then
        echo "Backing up existing $dest -> $dest.bak"
        mv "$dest" "$dest.bak"
    fi

    ln -s "$src" "$dest"
}

link_config hypr
link_config waybar
link_config rofi
link_config hyprlock

echo "Starting wallpaper daemon..."

awww-daemon &

sleep 1

echo "Setting wallpaper..."

awww img "$REPO_DIR/wallpaper/29.png"

echo "Installation complete."
