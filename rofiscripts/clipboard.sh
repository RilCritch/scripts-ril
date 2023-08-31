#!/usr/bin/env bash

# Author: RilCritch

# Last update: 07/07/23

# Description: script to go through and copy clipboard contents

# Dependencies: rofi, clipster, xclip

# clipboard history
options=$(clipster -c -o -n 0 | grep -P '\S')

# run rofi with all clipboard history
selection=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p 'clippy')

# if there was a selection add it to front of clipboard history
if [ -n "$selection" ]; then
	echo -n "$selection" | xclip -selection clipboard
fi
