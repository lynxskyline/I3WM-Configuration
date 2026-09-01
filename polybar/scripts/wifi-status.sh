#!/bin/bash

state=$(nmcli -t -f DEVICE,TYPE,STATE device | \
    awk -F: '$1=="wlan0" && $2=="wifi" {print $3}')

if [ "$state" = "connected" ]; then
    ssid=$(nmcli -t -f IN-USE,SSID device wifi | awk -F: '$1=="*" {print $2; exit}')
    echo "󰖩 $ssid |"
else
    echo "󰖪 Offline |"
fi
