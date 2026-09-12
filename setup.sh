#!/bin/bash

set -e

DOTFILE_DIR="$(cd "$(dirname "$0")" && pwd)"
HOME_DIR="$HOME"

link() {
    local src="$1"
    local dst="$2"

    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "SKIP: $dst exists and is not a symlink"
        return
    fi

    mkdir -p "$(dirname "$dst")"
    rm -rf "$dst"
    ln -s "$src" "$dst"
    echo "LINK: $dst -> $src"
}

# git
link "$DOTFILE_DIR/git/gitconfig" "$HOME_DIR/.gitconfig"

# foot
link "$DOTFILE_DIR/foot" "$HOME_DIR/.config/foot"

# sway
link "$DOTFILE_DIR/sway" "$HOME_DIR/.config/sway"

# tmux
link "$DOTFILE_DIR/tmux" "$HOME_DIR/.config/tmux"

# waybar
link "$DOTFILE_DIR/waybar" "$HOME_DIR/.config/waybar"

# yazi
link "$DOTFILE_DIR/yazi" "$HOME_DIR/.config/yazi"

# kitty
link "$DOTFILE_DIR/kitty" "$HOME_DIR/.config/kitty"

# gtklock
link "$DOTFILE_DIR/gtklock" "$HOME_DIR/.config/gtklock"

# ssh
link "$DOTFILE_DIR/ssh" "$HOME_DIR/.ssh"

echo "Done."
