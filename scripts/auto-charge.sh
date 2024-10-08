#!/bin/bash
CHARGER_DEVICE_ID="26d7099045cc7e9c530096dcf84cae6b451bf4fe55baf91bd2f07e1c4eae66ac"

battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
if [ $battery_level -le 30 ]; then
   notify-send "Battery has reached below 30%!" "Started Charging!"
   ~/scripts/toggle-switch.sh -s 1 -d $CHARGER_DEVICE_ID
fi
