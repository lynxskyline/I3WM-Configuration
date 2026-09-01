#!/usr/bin/env bash

WALLPAPER_DIR="/usr/share/backgrounds/wallpaper"
STATE_FILE="$HOME/.cache/current-wallpaper"

mkdir -p "$HOME/.cache"

get_wallpapers() {
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \
        \( -iname "*.jpg" \
        -o -iname "*.jpeg" \
        -o -iname "*.png" \
        -o -iname "*.webp" \
        -o -iname "*.svg" \) \
        -printf '%f\n' | sort
}

set_wallpaper() {
    local wallpaper="$1"
    local fullpath="$WALLPAPER_DIR/$wallpaper"

    [ -f "$fullpath" ] || return 1

    feh --no-fehbg --bg-fill "$fullpath"

    printf '%s\n' "$fullpath" > "$STATE_FILE"
}

random_wallpaper() {
    local wallpaper

    wallpaper=$(get_wallpapers | shuf -n 1)

    [ -n "$wallpaper" ] && set_wallpaper "$wallpaper"
}

if [ "$1" = "random" ]; then
    random_wallpaper
    exit 0
fi

# Build Rofi gallery
{
    printf '%s\0icon\x1f%s\n' "󰸉 Random" "$WALLPAPER_DIR"

    while IFS= read -r wallpaper; do
        printf '%s\0icon\x1f%s\n' \
            "$wallpaper" \
            "$WALLPAPER_DIR/$wallpaper"
    done < <(get_wallpapers)

} | rofi \
    -dmenu \
    -i \
    -show-icons \
    -p "Wallpaper" \
    -theme "$HOME/.config/rofi/rofi.rasi" \
    -theme-str '
        listview {
            columns: 2;
            lines: 3;
            spacing: 12px;
            margin: 15px 20px;
        }

        element {
            orientation: vertical;
            spacing: 8px;
            padding: 8px;
        }

        element-icon {
            size: 180px;
        }

        element-text {
            horizontal-align: 0.5;
            vertical-align: 0.5;
        }
    ' > /tmp/wallpaper-selection

SELECTED=$(cat /tmp/wallpaper-selection)

rm -f /tmp/wallpaper-selection

[ -z "$SELECTED" ] && exit 0

if [[ "$SELECTED" == "󰸉 Random" ]]; then
    random_wallpaper
else
    set_wallpaper "$SELECTED"
fi
