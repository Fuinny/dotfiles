#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$HOME/Programming/dotfiles"

link_file() {
    local source="$DOTFILES_DIR/$1"
    local target="$2"

    if [[ ! -e "$source" ]]; then
        echo "WARNING: Source file \"$source\" does not exist!"
        echo "Skipping..."
        return
    fi

    # Ensure target parent directory exists.
    mkdir -p "$(dirname "$target")"

    # Back up target if it exists already and is not a symlink.
    if [[ -e "$target" && ! -L "$target" ]]; then
        echo "Backing up existing $target to ${target}.bak"
        mv "$target" "${target}.bak"
    fi

    ln -sfn "$source" "$target"

    echo "Symlinked $1 => $target"
}

if [[ "$(uname -s)" == "Darwin" ]]; then
    IS_MACOS=true
else
    IS_MACOS=false
fi

echo "Deleting legacy Vim files and directories..."
rm -rf "$HOME/.vimrc" "$HOME/.vim"

echo "Creating Vim configuration directory..."
mkdir -p "$HOME/.config/vim/"{undo,swaps,backups}

echo "Creating Zsh configuration directory..."
mkdir -p "$HOME/.config/zsh"

if [[ "$IS_MACOS" == true ]]; then
    echo "Symlinking programming directory..."
    ln -sfn "$HOME/Programming" "$HOME/dev"
    chflags -h hidden "$HOME/dev"
fi

echo "Symlinking dotfiles..."
link_file "vim/vimrc" "$HOME/.config/vim/vimrc"
link_file "git/config" "$HOME/.config/git/config"
link_file "shell/hushlogin" "$HOME/.hushlogin"

if [[ "$IS_MACOS" == true ]]; then
    link_file "shell/zshenv" "$HOME/.zshenv"
    link_file "shell/zshrc" "$HOME/.config/zsh/.zshrc"
    link_file "shell/zprofile" "$HOME/.config/zsh/.zprofile"
fi

if [[ "$IS_MACOS" == true ]]; then
    VSCODE_DIR="$HOME/Library/Application Support/Code/User"
else
    VSCODE_DIR="$HOME/.config/Code/User"
fi

echo "Symlinking Visual Studio Code settings..."
link_file "vscode/settings.json" "$VSCODE_DIR/settings.json"

echo "Setup complete!"
