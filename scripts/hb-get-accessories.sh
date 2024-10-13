#!/bin/bash
#
# Script to get the uniqueId of Homebridge accessories
#

HOMEBRIDGE_URL="http://localhost:8581"
AUTH_CONF="$HOME/.config/homebridge/auth.json"

USERNAME="samodra"
PASSWORD="samodra"

getAccessToken() {
  if [ -f "$AUTH_CONF" ]; then
    access_token=$(jq -r '.access_token' "$AUTH_CONF")
    if [ -n "$access_token" ]; then
      echo "Using existing access token."
      return
    fi
  fi
  echo "Access token not found. Logging in to get a new token..."
  getNewAccessToken
}

getNewAccessToken() {
  curl --silent --location "$HOMEBRIDGE_URL/api/auth/login" \
    --header 'Content-Type: application/json' \
    --data "{
      \"username\": \"$USERNAME\",
      \"password\": \"$PASSWORD\"
    }" \
    -o "$AUTH_CONF"

  access_token=$(jq -r '.access_token' "$AUTH_CONF")

  if [ -z "$access_token" ]; then
    echo "Failed to retrieve access token. Please check your login credentials."
    exit 1
  fi
  echo "New access token retrieved and saved to $AUTH_CONF."
}

getAccessoriesUniqueId() {
  response=$(curl --silent --location "$HOMEBRIDGE_URL/api/accessories" \
    --header "Authorization: Bearer $access_token" \
    --header 'Content-Type: application/json')

  if [ -z "$response" ]; then
    echo "Failed to retrieve accessories. Check your Homebridge URL and authorization."
    exit 1
  fi

  echo "Unique IDs of accessories:"
  echo "$response" | jq -r '.[] | "\(.serviceName): \(.uniqueId)"'
}

getAccessToken
getAccessoriesUniqueId


