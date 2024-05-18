#!/bin/bash

# To show all available sink devices, use "pactl list sinks"
# Get the name of sinks
#

BLON="alsa_output.usb-Synaptics_CX31993_HIFI_AUDIO-00.analog-stereo"
EARPODS="alsa_output.usb-Apple__Inc._EarPods_FRX5G2W2TG-00.analog-stereo"

arg="${1:-}"

case "$arg" in
  --headphones)
    SINK="$EARPODS"
    pacmd set-default-sink "$SINK"
    pacmd list-sink-inputs | grep index | while read line; do
      pacmd move-sink-input `echo $line | cut -f2 -d' '` "$SINK"
    done
    notify-send "Switched to headphones! $EARPODS"
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
    ;;
esac

