#!/bin/bash

# Add all nvim plugins as git submodules based on what exists in ~/.local/share/nvim/lazy
# This script dynamically detects plugins and tries to find their GitHub repos

cd ~/backups/nvim_tmux_config

# Function to get git remote URL from a plugin directory
get_plugin_url() {
    local plugin_dir="$1"
    if [ -d "$plugin_dir/.git" ]; then
        cd "$plugin_dir" && git config --get remote.origin.url 2>/dev/null
    fi
}

# Remove existing plugin directories first
rm -rf .local/share/nvim/lazy/*

echo "Detecting plugins from ~/.local/share/nvim/lazy..."

# Loop through all plugin directories in ~/.local/share/nvim/lazy
for plugin_path in ~/.local/share/nvim/lazy/*/; do
    if [ -d "$plugin_path" ]; then
        plugin_name=$(basename "$plugin_path")
        
        # Skip claudecode.nvim and empty lazy directory
        if [[ "$plugin_name" == "claudecode.nvim" || "$plugin_name" == "lazy" ]]; then
            echo "Skipping: $plugin_name"
            continue
        fi
        
        echo "Processing plugin: $plugin_name"
        
        # Try to get the git URL from the plugin directory
        plugin_url=$(get_plugin_url "$plugin_path")
        
        if [ -n "$plugin_url" ]; then
            echo "Adding submodule: $plugin_name -> $plugin_url"
            git submodule add "$plugin_url" ".local/share/nvim/lazy/$plugin_name" || echo "Failed to add $plugin_name as submodule"
        else
            echo "Warning: Could not determine git URL for $plugin_name"
        fi
    fi
done

echo "Submodule setup complete!"
echo "To initialize on a new machine, run:"
echo "git submodule update --init --recursive"

