#!/bin/bash

THEME="$HOME/.config/rofi/wifi.rasi"

# Pastikan Bluetooth hidup
bluetoothctl power on >/dev/null 2>&1

# Scan sebentar untuk menemukan device
bluetoothctl scan on >/dev/null 2>&1 &
SCAN_PID=$!

sleep 3

bluetoothctl scan off >/dev/null 2>&1
kill "$SCAN_PID" 2>/dev/null

# Ambil semua device yang ditemukan
devices=$(bluetoothctl devices 2>/dev/null)

[ -z "$devices" ] && {
    notify-send "Bluetooth" "Tidak ada device ditemukan"
    exit 0
}

# Buat daftar untuk Rofi
list=$(echo "$devices" | while read -r _ mac name; do

    if bluetoothctl info "$mac" 2>/dev/null | grep -q "Connected: yes"; then
        icon="󰄬"
    else
        icon="󰂯"
    fi

    printf "%s  %s  [%s]\n" "$icon" "$name" "$mac"

done)

# Tampilkan Rofi
selected=$(printf '%s\n' "$list" |
    rofi \
        -dmenu \
        -i \
        -p "󰂯" \
        -theme "$THEME")

[ -z "$selected" ] && exit 0

# Ambil MAC address
mac=$(echo "$selected" | sed -n 's/.*\[\(.*\)\]$/\1/p')

[ -z "$mac" ] && exit 0

# Nama device
name=$(bluetoothctl info "$mac" 2>/dev/null |
    sed -n 's/^[[:space:]]*Name: //p' |
    head -n 1)

# Kalau sudah connected → disconnect
if bluetoothctl info "$mac" 2>/dev/null | grep -q "Connected: yes"; then

    bluetoothctl disconnect "$mac" >/dev/null 2>&1

    notify-send \
        -i bluetooth \
        "Bluetooth Disconnected" \
        "$name"

    exit 0
fi

# Kalau belum paired → pair
if ! bluetoothctl info "$mac" 2>/dev/null | grep -q "Paired: yes"; then

    bluetoothctl pair "$mac" >/dev/null 2>&1

fi

# Connect
if bluetoothctl connect "$mac" >/dev/null 2>&1; then

    notify-send \
        -i bluetooth \
        "Bluetooth Connected" \
        "$name"

else

    notify-send \
        -u critical \
        -i bluetooth \
        "Bluetooth Connection Failed" \
        "$name"

fi
