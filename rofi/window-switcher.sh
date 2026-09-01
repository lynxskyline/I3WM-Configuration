#!/bin/bash

i3-msg -t get_tree |
jq -r '
  recurse(.nodes[]?, .floating_nodes[]?)
  | select(.window != null)
  | [
      .id,
      .name,
      (.window_properties.class // "Unknown"),
      (.workspace.name // "")
    ]
  | @tsv
' |
while IFS=$'\t' read -r id title class workspace; do
    printf '%s\t%s — %s [%s]\n' "$id" "$class" "$title" "$workspace"
done |
rofi -dmenu \
    -i \
    -p "Windows" \
    -display-columns 1 |
cut -f1 |
while read -r id; do
    [ -n "$id" ] && i3-msg "[con_id=$id] focus"
done
