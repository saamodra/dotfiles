#!/bin/bash

# List of configuration
configurations=(
  "~/.config/i3/config ./.config/i3/config"
  "~/.config/lvim/config.lua ./.config/lvim/config.lua"
  "~/.config/vscode-neovim/settings.vim ./.config/vscode-neovim/settings.vim"
  "~/.config/Code/User/settings.json ./.config/vscode-neovim/settings.json"
  "~/.config/Code/User/keybindings.json ./.config/vscode-neovim/keybindings.json"
  "~/.config/polybar/forest ./.config/polybar"
  "~/.config/ranger ./.config"
  "~/.config/bumblebee-status/config ./.config/bumblebee-status/config"
  "~/.config/betterlockscreen/betterlockscreenrc ./.config/betterlockscreen/betterlockscreenrc"
  "~/.config/rofi ./.config"
  "~/.config/nvim/* ./.config/nvim"
  "~/.config/homebridge ./.config"
  "~/.config/dunst ./.config"
  "~/.config/alacritty ./.config"
  "~/.config/btop ./.config"
  "~/.config/foot ./.config"
  "~/.config/networkmanager-dmenu ./.config"
  "~/.config/sddm ./.config"
  "~/.config/sway ./.config"
  "~/.config/tmux ./.config"
  "~/.config/waybar ./.config"
  "~/.config/rofimoji.rc ./.config/rofimoji.rc"
  "~/.config/mimeapps.list.rc ./.config/mimeapps.list.rc"
  "~/.config/greenclip.toml ./.config/greenclip.toml"
  "~/.config/pavucontrol.ini ./.config/pavucontrol.ini"
  "~/MyProjects/pyproject/*.py ./pyscripts"
  "~/MyProjects/pyproject/*.txt ./pyscripts"
  "~/.antigenrc .antigenrc"
  "~/.bashrc .bashrc"
  "~/.ideavimrc .ideavimrc"
  "~/.npmrc .npmrc"
  "~/.nvimrc .nvimrc"
  "~/.profile .profile"
  "~/.zshrc .zshrc"
  "~/scripts ./"
)

IFS=""

for cfg in ${configurations[@]}; do
  eval $(echo rsync -avzh $cfg)
done

echo "======================================="
echo "                  Done                 "
echo "======================================="
