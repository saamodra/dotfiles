#!/bin/bash

# List of configuration
configurations=(
	"~/.config/i3/config ./.config/i3/config"
	"~/.config/nvim/lua/custom ./.config/nvim/lua"
  "~/.config/lvim/config.lua ./.config/lvim/config.lua"
  "~/.config/vscode-neovim/settings.vim ./.config/vscode-neovim/settings.vim"
  "~/.config/Code/User/settings.json ./.config/vscode-neovim/settings.json"
  "~/.config/Code/User/keybindings.json ./.config/vscode-neovim/keybindings.json"
  "~/.config/polybar/forest ./.config/polybar"
  "~/.config/ranger ./.config"
	"~/.config/bumblebee-status/config ./.config/bumblebee-status/config"
	"~/.config/betterlockscreen/betterlockscreenrc ./.config/betterlockscreen/betterlockscreenrc"
  "~/.config/rofi ./.config"
  "~/.config/homebridge ./.config"
  "~/.config/dunst ./.config"
	"~/.config/rofimoji.rc ./.config/rofimoji.rc"
	"~/.fonts ./"
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
  eval `echo rsync -avzh $cfg`
done

echo "======================================="
echo "                  Done                 "
echo "======================================="

