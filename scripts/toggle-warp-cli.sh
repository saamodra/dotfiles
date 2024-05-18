#!/bin/bash

WARP_CONF="$HOME/.config/warp-cli/config.json"

warp_status=$(jq -r '.status' "$WARP_CONF")
icon=$(jq -r '.icon' "$WARP_CONF")

if [ "$warp_status" == "Connected" ]; then
  warp-cli disconnect
  notify-send "Cloudflare warp disconnected"
  warp_status="Disconnected"
  icon="󰨹"
else
  warp-cli connect
  notify-send "Cloudflare warp connected"
  warp_status="Connected"
  icon="󰅠"
fi

jq --arg a "${warp_status}" '.status = $a' "$WARP_CONF" > "tmp" && mv "tmp" "$WARP_CONF"
jq --arg a "${icon}" '.icon = $a' "$WARP_CONF" > "tmp" && mv "tmp" "$WARP_CONF"

