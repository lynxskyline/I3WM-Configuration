#!/bin/bash

nmcli device wifi rescan >/dev/null 2>&1

wifi_list=$(nmcli -t -f IN-USE,SSID,SIGNAL,SECURITY device wifi list |
awk -F: '
{
    if ($2 != "") {

        if ($1 == "*")
            icon="󰄬"
        else
            icon="󰖩"

        if ($4 == "")
            security="Open"
        else
            security=$4

        printf "%s  %s   %s%%  [%s]\n", icon, $2, $3, security
    }
}' | sort -u)

selected=$(printf '%s\n' "$wifi_list" |
    rofi \
        -dmenu \
        -i \
        -p "󰖩" \
        -theme ~/.config/rofi/wifi.rasi)

[ -z "$selected" ] && exit 0

ssid=$(echo "$selected" |
    sed -E 's/^󰄬  |^󰖩  //' |
    sed -E 's/  .*//')

security=$(echo "$selected" |
    sed -n 's/.*\[\(.*\)\]$/\1/p')

# =========================
# OPEN WIFI
# =========================

if [ "$security" = "Open" ]; then
    nmcli device wifi connect "$ssid"

    notify-send "Wi-Fi Connected" "$ssid"
    exit 0
fi

# =========================
# SAVED WIFI
# =========================

if nmcli connection show "$ssid" >/dev/null 2>&1; then

    nmcli connection up "$ssid"

    notify-send "Wi-Fi Connected" "$ssid"
    exit 0
fi

# =========================
# PASSWORD
# =========================

password=$(rofi \
    -dmenu \
    -password \
    -p "󰌆 Password" \
    -theme ~/.config/rofi/wifi.rasi)

[ -z "$password" ] && exit 0

# =========================
# CONNECT
# =========================

if nmcli device wifi connect "$ssid" password "$password"; then

    notify-send \
        -i network-wireless \
        "Wi-Fi Connected" \
        "$ssid"

else

    notify-send \
        -u critical \
        -i network-wireless \
        "Wi-Fi Connection Failed" \
        "$ssid"

fi
