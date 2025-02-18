#!/bin/bash

# Force rescan display
xrandr --auto

# Apply autorandr profile
autorandr --change

# Kill all existing polybar instances
killall -q polybar

# Restart i3 window manager
i3-msg restart

echo "Display configuration applied, polybar restarted, and i3 refreshed."

