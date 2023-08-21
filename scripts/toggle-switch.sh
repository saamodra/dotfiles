#!/bin/bash
#
# Scripts to toggle smart plug
# Notes:
# * To get device id, we need to call homebridge API accessories path
#   and get uniqueId of specific device
#

# kadonio_sp01_device_id="aa1e07534f9514c83a7810de747864e28c8173f4c0f511ea359fd48a8a66846a"
# kadonio_sp02_device_id="26614f2d9d2d0c609a0385473f032573beb7e469488da75f87ce267ecaa088e3"

PROGNAME=$0

usage() {
  cat << EOF
    Usage: $PROGNAME [-d|-s] [-d <device_id>] [-s <device_status>]

      -d <device_id>
          To get device id, we need to call homebridge API /api/accessories path and get uniqueId of specific device

      -s <device_status> (optional)
          Device status, 1 to toggle on, 0 to toggle off
EOF
  exit 1
}

while getopts ":d:s:" opt; do
  case $opt in
    d) device_id="$OPTARG";;
    s) device_status_arg="$OPTARG";;
    *) usage
    exit 1
    ;;
  esac
done

if [ -z "$device_id" ]; then
  echo 'Missing -d arguments for local device id' >&2
  exit 1
fi

HOMEBRIDGE_URL="http://192.168.2.105:8581"
DEVICE_STATUS_CONF="$HOME/.config/homebridge/status_$device_id.json"
AUTH_CONF="$HOME/.config/homebridge/auth.json"

setupEnv() {
  access_token=$(jq -r '.access_token' "$AUTH_CONF")
  device_status=$(cat "$DEVICE_STATUS_CONF")

  if [ -z "$device_status_arg" ]; then
    if [ "$device_status" -eq 1 ]; then
      device_status=0
    else
      device_status=1
    fi
  else
    device_status="$device_status_arg"
  fi
}

toggleDevice() {
  status_code=$(curl --location --request PUT "$HOMEBRIDGE_URL/api/accessories/$device_id" \
  --header "Authorization: Bearer $2" \
  --header 'Content-Type: application/json' \
  --data "{
      \"characteristicType\": \"On\",
      \"value\": $1
    }" | jq -r '.statusCode')
}

setupEnv
toggleDevice $device_status $access_token

if [[ $status_code -eq 401 ]]
then
  echo 'Forbidden, requesting new access token.'
  curl --location 'http://192.168.2.105:8581/api/auth/login' \
  --header 'Content-Type: application/json' \
  --data '{
    "username": "samodra",
    "password": "5jlkW237M95ISes*",
    "otp": ""
  }' \
  -o $auth_conf

  setupEnv
  toggleDevice $device_status $access_token
else
  echo $device_status > "$DEVICE_STATUS_CONF"
fi
