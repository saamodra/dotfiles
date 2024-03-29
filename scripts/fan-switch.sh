#!/bin/bash
#
# Scripts to toggle smart plug
#

homebridge_url="http://192.168.2.105:8581"
device_id="26614f2d9d2d0c609a0385473f032573beb7e469488da75f87ce267ecaa088e3"
fan_status_conf=~/.config/homebridge/fan_status.json
auth_conf=~/.config/homebridge/auth.json

setupEnv() {
  access_token=$(cat $auth_conf | jq -r '.access_token')
  fan_status=$(cat $fan_status_conf)

  if [ $fan_status -eq 1 ]
  then
    fan_status=0
  else
    fan_status=1
  fi
}

toggleFan() {
  status_code=$(curl --location --request PUT "$homebridge_url/api/accessories/$device_id" \
  --header "Authorization: Bearer $2" \
  --header 'Content-Type: application/json' \
  --data "{
      \"characteristicType\": \"On\",
      \"value\": $1
    }" | jq -r '.statusCode')
}

setupEnv
toggleFan $fan_status $access_token

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
  toggleFan $fan_status $access_token
else
  echo $fan_status > $fan_status_conf
fi

