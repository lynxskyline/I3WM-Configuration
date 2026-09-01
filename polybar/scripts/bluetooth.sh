#!/bin/bash

if ! bluetoothctl show >/dev/null 2>&1; then
    echo "󰂲 Off |"
    exit 0
fi

powered=$(bluetoothctl show 2>/dev/null |
    awk '/Powered:/ {print $2}')

if [ "$powered" != "yes" ]; then
    echo "󰂲 Off |"
    exit 0
fi

device=$(bluetoothctl devices Connected 2>/dev/null | head -n 1)

if [ -n "$device" ]; then
    mac=$(echo "$device" | awk '{print $2}')

    name=$(bluetoothctl info "$mac" 2>/dev/null |
        sed -n 's/^[[:space:]]*Name: //p' |
        head -n 1)

    echo "󰂯 $name |"
else
    echo "󰂯 |"
fi
