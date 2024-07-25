#!/bin/bash

scp -i ~/.ssh/biznet_gio.pem samodra@103.175.216.12:~/backups/doccano.sql ~/backups/
notify-send "VPS Backup Synced"

