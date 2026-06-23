#!/bin/bash

VIM_DIRS=(
    "$HOME/.vim/undo"
    "$HOME/.vim/swaps"
    "$HOME/.vim/backups"
)

echo "Checking required vim directories..."

for dir in "${VIM_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "Creating vim directory: $dir"
        mkdir -p "$dir"
    fi
done

echo "All required vim directories successfully created!"

TARGET_DIR="$HOME"
DOTFILES_DIR="$HOME/dev/dotfiles"

echo "Symlinking dotfiles from $DOTFILES_DIR to $TARGET_DIR..."

cd "$DOTFILES_DIR" || { echo "Error: $DOTFILES_DIR not found!"; exit 1; }

for file in .*; do

    # Skip current dir (.), parent dir(..), Finder metadata, and the .git directory.
    if [[ "$file" == "." || "$file" == ".." || "$file" == ".DS_Store" || "$file" == ".git" ]]; then
        continue
    fi

    # Define exact target and source paths.
    TARGET="$TARGET_DIR/$file"
    SOURCE="$DOTFILES_DIR/$file"

    # If target path exists and is not a symlink then back it up.
    if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
        echo "Backing up existing $file to $file.bak"
        mv "$TARGET" "${TARGET}.bak"
    fi

    # Create symlink
    # -s: Create a symlink
    # -f: Force overwrite (if symlink already exists)
    # -n: Treat destination symlink as regular file to prevent nesting
    ln -sfn "$SOURCE" "$TARGET"
    echo "Linked: ~/$file to $SOURCE"
done

echo "Dotfiles successfully symlinked!"
