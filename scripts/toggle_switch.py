import argparse
import json
import os
import requests

HOMEBRIDGE_URL = "http://localhost:8581"
CONFIG_DIR = os.path.expanduser("~/.config/homebridge")

def load_json(file_path):
    try:
        with open(file_path, "r") as file:
            return json.load(file)
    except (FileNotFoundError, json.JSONDecodeError):
        return None

def save_json(file_path, data):
    with open(file_path, "w") as file:
        json.dump(data, file)

def setup_env(device_id, device_status_arg):
    auth_conf = os.path.join(CONFIG_DIR, "auth.json")
    status_conf = os.path.join(CONFIG_DIR, f"status_{device_id}.json")

    auth_data = load_json(auth_conf)
    access_token = auth_data.get("access_token") if auth_data else None

    device_status = load_json(status_conf) if device_status_arg is None else device_status_arg
    device_status = 0 if device_status == 1 else 1 if device_status_arg is None else int(device_status_arg)

    return access_token, device_status, status_conf

def toggle_device(device_id, device_status, access_token):
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Content-Type": "application/json"
    }
    data = {
        "characteristicType": "On",
        "value": device_status
    }
    response = requests.put(f"{HOMEBRIDGE_URL}/api/accessories/{device_id}", headers=headers, json=data)
    return response.status_code

def request_new_token():
    auth_conf = os.path.join(CONFIG_DIR, "auth.json")
    data = {
        "username": "samodra",
        "password": "samodra",
        "otp": ""
    }
    response = requests.post(f"{HOMEBRIDGE_URL}/api/auth/login", headers={"Content-Type": "application/json"}, json=data)
    if response.status_code == 201:
        save_json(auth_conf, response.json())
    return response.status_code == 201

def main():
    parser = argparse.ArgumentParser(description="Toggle smart plug via Homebridge API")
    parser.add_argument("-d", "--device_id", required=True, help="Device ID")
    parser.add_argument("-s", "--device_status", type=int, choices=[0, 1], help="Device status: 1 (on), 0 (off)")
    args = parser.parse_args()

    access_token, device_status, status_conf = setup_env(args.device_id, args.device_status)
    if not access_token:
        print("Missing access token. Requesting new one.")
        if not request_new_token():
            print("Failed to obtain access token.")
            return
        access_token, device_status, status_conf = setup_env(args.device_id, args.device_status)

    status_code = toggle_device(args.device_id, device_status, access_token)
    if status_code == 401:
        print("Forbidden. Requesting new access token.")
        if request_new_token():
            access_token, device_status, status_conf = setup_env(args.device_id, args.device_status)
            toggle_device(args.device_id, device_status, access_token)
    else:
        save_json(status_conf, device_status)
        print(f"Device {args.device_id} toggled to {device_status}")

if __name__ == "__main__":
    main()
