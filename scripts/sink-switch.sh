#!/bin/bash

# To show all available sink devices, use "pactl list sinks"
# Get the name of sinks
#

HEADPHONES=$(pactl list short sinks | head -n 1 | awk '{print $2}')
SPEAKERS=$(pactl list short sinks | tail -n 1 | awk '{print $2}')

arg="${1:-}"

case "$arg" in
  --headphones)
    pactl set-default-sink "$HEADPHONES"
    pactl list-sink-inputs | grep index | while read line; do
      pactl move-sink-input `echo $line | cut -f2 -d' '` "$SINK"
    done
    notify-send "Switched to headphones!"
    ;;
  --speakers)
    pactl set-default-sink "$SPEAKERS"
    pactl list-sink-inputs | grep index | while read line; do
      pactl move-sink-input `echo $line | cut -f2 -d' '` "$SINK"
    done
    notify-send "Switched to speakers!"
    ;;
  *)
    ;;
esac

