#!/bin/bash
CHARGER_DEVICE_ID="d172cfc3f7f574bf67e8e61d8dbe5b8a670294e9120e8b248ff8d54f36048115"

battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
if [ $battery_level -le 30 ]; then
   notify-send "Battery has reached below 30%!" "Started Charging!"
   ~/scripts/toggle-switch.sh -s 1 -d $CHARGER_DEVICE_ID
fi
