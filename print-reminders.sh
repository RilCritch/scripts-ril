#!/usr/bin/env bash

# dependencies: figlet; clr (my script); lineacross (my script)

userfile="${HOME}/.local/share/reminders/${USER}-reminders.txt"

if [ -f $userfile ]; then
	# title
	# lineacross | clr blue
	figlet -k -f shadow "Reminders" | clr blue
	# lineacross | clr blue

	# reminders
	\cat -n $userfile | clr magenta
	# echo
else
	echo "Error... user '${USER}' does not have a reminders file." | clr red
	echo "Please run 'reminders.sh' to create reminders file"
fi
