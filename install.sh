#!/bin/bash

# Neovim & Tmux Configuration Install Script

set -e # Exit on any error

echo "Installing Neovim and Tmux configurations..."

# Create necessary directories
mkdir -p ~/.config
mkdir -p ~/.local/share

# Backup existing configs (if they exist)
if [ -d ~/.config/nvim ]; then
  echo "Backing up existing nvim config to ~/.config/nvim.backup..."
  rm -rf ~/.config/nvim.backup
  mv ~/.config/nvim ~/.config/nvim.backup
fi

if [ -d ~/.local/share/nvim ]; then
  echo "Backing up existing nvim data to ~/.local/share/nvim.backup..."
  rm -rf ~/.local/share/nvim.backup
  mv ~/.local/share/nvim ~/.local/share/nvim.backup
fi

if [ -d ~/.config/tmux ]; then
  echo "Backing up existing tmux config to ~/.config/tmux.backup..."
  rm -rf ~/.config/tmux.backup
  mv ~/.config/tmux ~/.config/tmux.backup
fi

# Install Neovim configuration
echo "Installing Neovim configuration..."
cp -r .config/nvim ~/.config/

# Install Neovim local share data
echo "Installing Neovim local share data..."
cp -r .local/share/nvim ~/.local/share/

# Bootstrap lazy.nvim if it doesn't exist
if [ ! -d ~/.local/share/nvim/lazy/lazy.nvim ]; then
    echo "Bootstrapping lazy.nvim..."
    git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
fi

# Install tmux configuration (if exists)
if [ -d .config/tmux ]; then
  echo "Installing tmux configuration..."
  cp -r .config/tmux ~/.config/
fi

echo "Installation complete!"
echo "Note: Any existing configs were backed up with .backup extension"

