#!/usr/bin/env bash

# Script options
options=("Logout" "Suspend" "Hibernate" "Reboot" "Shutdown")

# run fzf with specified options and retrieve selection
selection=$(printf '%s\n' "${options[@]}" | \fzf --color='border:0,label:5,pointer:5,bg+:-1,gutter:-1,hl:7,hl+:4,fg:8,fg+:7,info:0,header:4,spinner:6' --header-first --reverse --prompt='  ' --pointer='󰮺' --no-scrollbar --layout=reverse --border=double --border-label=' Power ' --height=100% --separator='󰇼')

# decide what to with specified option
case "$selection" in
"Logout") # add tests for many different wm and de
	if [ "$(wmctrl -m | grep "Name:" | awk '{print $2}')" == "qtile" ]; then
		qtile cmd-obj -o cmd -f shutdown
	fi
	;;
"Suspend")
	systemctl suspend
	;;
"Hibernate")
	systemctl hibernate
	;;
"Reboot")
	systemctl reboot
	;;
"Shutdown")
	systemctl poweroff
	;;
*)
	# do nothing
	;;
esac
