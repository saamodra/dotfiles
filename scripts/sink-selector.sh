#!/bin/bash

declare -A sinks_map

while read -r line; do
    if [[ $line =~ ^Sink\ \#([0-9]+) ]]; then
        sink_id=${BASH_REMATCH[1]}
    elif [[ $line =~ ^\s*Name:\ (.+) ]]; then
        sink_name=${BASH_REMATCH[1]}
    elif [[ $line =~ ^\s*Description:\ (.+) ]]; then
        sink_desc=${BASH_REMATCH[1]}
        sinks_map[$sink_id]="$sink_name;$sink_desc"
    fi
done < <(pactl list sinks)

menu=$(for id in "${!sinks_map[@]}"; do
    echo "$id;${sinks_map[$id]}"
done | awk -F';' '{print $1 " - " $3}')

chosen_sink_id=$(echo "$menu" | rofi -dmenu -p "Select Audio Output" -theme ~/.config/rofi/launchers/type-4/style-2.rasi | awk '{print $1}')

sink_name=$(echo "${sinks_map[$chosen_sink_id]}" | awk -F';' '{print $1}')

if [ -n "$sink_name" ]; then
    pactl set-default-sink "$sink_name"
    pactl list sink-inputs short | awk '{print $1}' | while read input; do
        pactl move-sink-input "$input" "$sink_name"
    done
    notify-send "Audio output switched to $(echo "${sinks_map[$chosen_sink_id]}" | awk -F';' '{print $2}')"
fi
