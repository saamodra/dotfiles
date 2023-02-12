#!/bin/bash

# List of configuration
sourceConfig=(
	"~/.config/i3/config .config/i3/config"
	"~/.config/nvim/lua/custom .config/nvim/lua"
  "~/.config/lvim/config.lua .config/lvim/config.lua"
  "~/.config/vscode-neovim/settings.vim .config/vscode-neovim/settings.vim"
  "~/.config/Code/User/settings.json .config/vscode-neovim/settings.json"
  "~/.config/Code/User/keybindings.json .config/vscode-neovim/keybindings.json"
  "~/.config/polybar/forest .config/polybar"
	"~/.config/bumblebee-status/config .config/bumblebee-status/config"
	"~/.config/betterlockscreen/betterlockscreenrc .config/betterlockscreen/betterlockscreenrc"
	"~/.config/rofimoji.rc .config/rofimoji.rc"
	"~/.antigenrc .antigenrc"
	"~/.bashrc .bashrc"
  "~/.ideavimrc .ideavimrc"  
	"~/.npmrc .npmrc"  
	"~/.nvimrc .nvimrc"
	"~/.profile .profile"
	"~/.zshrc .zshrc"
)

IFS=""

for cfg in ${sourceConfig[@]}; do
	copyCommand=`echo cp -R $cfg`
  eval "$copyCommand"

	echo "${cfg} copied"
done

echo "======================================="
echo "                  Done                 "
echo "======================================="

