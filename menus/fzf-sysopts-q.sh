#!/usr/bin/env bash

# Script options
options=("Reload Qtile" "Restart Qtile" "Set Wallpaper" "Power Manager" "Archlinux Tweak Tool")

# run fzf with specified options and retrieve selection
selection=$(printf '%s\n' "${options[@]}" | \fzf --color='border:0,label:5,pointer:5,bg+:-1,gutter:-1,hl:7,hl+:4,fg:8,fg+:7,info:0,header:4,spinner:6' --header-first --reverse --prompt='  ' --pointer='󰮺' --no-scrollbar --layout=reverse --border=double --border-label=' System Options ' --height=100% --separator='󰇼')

# decide what to with specified option
case "$selection" in
"Reload Qtile")
	qtile cmd-obj -o cmd -f reload_config
	;;
"Restart Qtile")
	qtile cmd-obj -o cmd -f restart
	;;
"Set Wallpaper")
	qtile cmd-obj -o group 'scratchpad' -f dropdown_toggle -a 'nitrogen'
	;;
"Power Manager")
	xfce4-power-manager -c
	;;
"Archlinux Tweak Tool")
	att
	;;
*)
	# action when no/non-exsistent option selected
	;;
esac
