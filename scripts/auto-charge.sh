#!/bin/bash
CHARGER_DEVICE_ID="26614f2d9d2d0c609a0385473f032573beb7e469488da75f87ce267ecaa088e3"

while true
do
   battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
   if [ $battery_level -ge 80 ]; then
      notify-send "Battery has reached above 80%!" "Stopped Charging!"
      ~/scripts/toggle-switch.sh -s 0 -d $CHARGER_DEVICE_ID
   elif [ $battery_level -le 30 ]; then
      notify-send "Battery has reached below 30%!" "Started Charging!"
      ~/scripts/toggle-switch.sh -s 1 -d $CHARGER_DEVICE_ID
   fi

   sleep 300
done
