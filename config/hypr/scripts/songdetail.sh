#!/bin/bash

player=$(playerctl -l 2>/dev/null | grep -E "spotify|firefox|chromium|chrome|brave" | head -n1)

[ -z "$player" ] && echo "" && exit

playerctl -p "$player" metadata --format "{{status}}|{{title}}|{{artist}}" 2>/dev/null |
while IFS="|" read status title artist; do
    [[ "$status" == "Playing" ]] && icon=" " || icon=" "
    echo "$icon  $title - $artist"
done

