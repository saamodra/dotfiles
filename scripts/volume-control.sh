#!/bin/bash

# This program control default sink volume
# Example increase audio volume 4%
# ./volume-control.sh 4


current_sink_device=$(pactl get-default-sink)
sink_volume_info=$(pactl get-sink-volume $current_sink_device)

sink_volume=`echo $sink_volume_info | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`
final_sink_volume=$(($sink_volume + $1))

if [[ $final_sink_volume -le 70 ]]; then
  pactl set-sink-volume @DEFAULT_SINK@ `echo $final_sink_volume%`
else
  pactl set-sink-volume @DEFAULT_SINK@ 70%
fi

