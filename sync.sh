#!/bin/bash

# List of configuration
sourceConfig=(
	~/.config/i3/config
	~/.config/nvim/init.lua	
	~/.config/bumblebee-status/config
	~/.config/betterlockscreen/betterlockscreenrc
	~/.config/rofimoji.rc
	~/.antigenrc
	~/.bashrc
	~/.ideavimrc
	~/.npmrc
	~/.nvimrc
	~/.profile
	~/.vimrc
	~/.zshrc
)

for cfg in ${sourceConfig[@]}; do
	cp $cfg .
	echo "${cfg} copied."
done

echo "======================================="
echo "                  Done                 "
echo "======================================="

