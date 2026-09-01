#!/usr/bin/env bash

STATE_FILE="$HOME/.cache/current-wallpaper"
WALLPAPER_DIR="/usr/share/backgrounds/wallpaper"

if [ -f "$STATE_FILE" ]; then
    WALLPAPER=$(cat "$STATE_FILE")

    if [ -f "$WALLPAPER" ]; then
        feh --no-fehbg --bg-fill "$WALLPAPER"
        exit 0
    fi
fi

# Fallback kalau belum pernah memilih wallpaper
feh --no-fehbg --bg-fill "$WALLPAPER_DIR/wallpaper.jpg"
