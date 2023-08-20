#!/bin/bash
#

charger_device_id="26614f2d9d2d0c609a0385473f032573beb7e469488da75f87ce267ecaa088e3"

while true
do
    battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
    if [ $battery_level -ge 80 ]; then
       notify-send "Battery is above 80%!" "Stopped Charging!"
       ~/scripts/switch-off.sh $charger_device_id
    elif [ $battery_level -le 30 ]; then
       notify-send "Battery is below 30%!" "Started Charging!"
       ~/scripts/switch-on.sh $charger_device_id
    fi

    sleep 300 # 300 seconds or 5 minutes
done
