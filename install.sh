#!/bin/bash

# Dotfiles installation script
# This script creates symbolic links from the home directory to the dotfiles in this repository

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create backup directory if it doesn't exist
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Function to create symbolic link
create_symlink() {
    local source="$1"
    local target="$2"
    
    # Check if source file exists
    if [ ! -f "$source" ]; then
        echo "Error: Source file $source does not exist"
        return 1
    fi
    
    # Backup existing file or directory if it exists and is not a symlink
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $target to $BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
    elif [ -L "$target" ]; then
        echo "Removing existing symlink $target"
        rm "$target"
    fi
    
    # Create symbolic link
    echo "Creating symlink: $target -> $source"
    ln -s "$source" "$target"
}

# Install dotfiles
create_symlink "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
create_symlink "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"

echo ""
echo "Installation complete!"
echo "Backups stored in: $BACKUP_DIR"
echo ""
echo "To apply bash configuration, run: source ~/.bashrc"
echo "Vim configuration will be active on next launch"
