#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="/home/user/nordic-wallpapers/wallpapers"

# Check if feh is installed
if ! command -v feh &> /dev/null; then
    echo "Error: feh is not installed. Please install it."
    exit 1
fi

# Check if the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Wallpaper directory does not exist."
    exit 1
fi

# Get a list of all image files in the wallpaper directory
wallpapers=("$WALLPAPER_DIR"/*.{jpg,jpeg,png,gif})

# Check if there are any image files in the directory
if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "Error: No wallpapers found in the directory."
    exit 1
fi

# Select a random wallpaper
random_wallpaper=${wallpapers[RANDOM % ${#wallpapers[@]}]}

# Set the selected wallpaper as the desktop background using feh
feh --bg-fill "$random_wallpaper"

echo "Wallpaper set to $random_wallpaper"
