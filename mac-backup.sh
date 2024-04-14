#!/bin/bash

# List of configuration
configurations=(
  "~/.config/tmux ./.config"
  "~/.config/nvim ./.config"
)

IFS=""

for cfg in ${configurations[@]}; do
  eval `echo rsync -avzh $cfg`
done

echo "======================================="
echo "                  Done                 "
echo "======================================="
