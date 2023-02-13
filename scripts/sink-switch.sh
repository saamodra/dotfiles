#!/bin/bash

# To show all available sink devices, use "pactl list sinks"
# Get the name of sinks

arg="${1:-}"

case "$arg" in
  --headphones)
    SINK="alsa_output.usb-Synaptics_CX31993_HIFI_AUDIO-00.analog-stereo"
    pacmd set-default-sink "$SINK"
    pacmd list-sink-inputs | grep index | while read line; do
      pacmd move-sink-input `echo $line | cut -f2 -d' '` "$SINK"
    done
    notify-send "Switched to headphones!"
    ;;
  --speakers)
    SINK="alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink"
    pacmd set-default-sink "$SINK"
    pacmd list-sink-inputs | grep index | while read line; do
      pacmd move-sink-input `echo $line | cut -f2 -d' '` "$SINK"
    done
    notify-send "Switched to speakers!"
    ;;
  *)
    echo "   "
    ;;
esac

