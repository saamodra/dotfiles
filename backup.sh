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

slicedChar=$(expr 8 + ${#USER})

for cfg in ${sourceConfig[@]}; do
	dest=`echo $cfg | cut -c ${slicedChar}-`
	cp $cfg $dest
	echo "${cfg} copied."
done

echo "======================================="
echo "                  Done                 "
echo "======================================="

