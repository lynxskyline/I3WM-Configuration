#!/bin/bash

case "$1" in
    toggle)
        dunstctl history-pop
        ;;

    clear)
        dunstctl close-all
        ;;

    *)
        count=$(dunstctl count waiting 2>/dev/null)

        if [ "$count" -gt 0 ]; then
            echo "󰂚 $count |"
        else
            echo "󰂚 |"
        fi
        ;;
esac
