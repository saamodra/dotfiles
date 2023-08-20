#!/bin/bash
#
# Scripts to toggle smart plug
# Notes: 
# * TO get device id, we need to call homebridge API accessories path
#   and get uniqueId of specific device
#

# kadonio_sp01_device_id="aa1e07534f9514c83a7810de747864e28c8173f4c0f511ea359fd48a8a66846a"
# kadonio_sp02_device_id="26614f2d9d2d0c609a0385473f032573beb7e469488da75f87ce267ecaa088e3"

homebridge_url="http://192.168.2.105:8581"
device_id=$1
device_status_conf="$HOME/.config/homebridge/status_$device_id.json"
auth_conf="$HOME/.config/homebridge/auth.json"

setupEnv() {
  access_token=$(cat $auth_conf | jq -r '.access_token')
}

toggleDevice() {
  status_code=$(curl --location --request PUT "$homebridge_url/api/accessories/$device_id" \
  --header "Authorization: Bearer $3" \
  --header 'Content-Type: application/json' \
  --data "{
      \"characteristicType\": \"On\",
      \"value\": $2
    }" | jq -r '.statusCode')
}

setupEnv
toggleDevice $1 1 $access_token

if [[ $status_code -eq 401 ]]
then
  echo 'Forbidden'
  curl --location 'http://192.168.2.105:8581/api/auth/login' \
  --header 'Content-Type: application/json' \
  --data '{
    "username": "samodra",
    "password": "Samodra4566",
    "otp": ""
  }' \
  -o $auth_conf

  setupEnv
  toggleDevice $1 1 $access_token
else
  echo $device_status > "$device_status_conf"
fi

