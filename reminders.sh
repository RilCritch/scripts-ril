#!/usr/bin/env bash

# here I am testing different fundtionality I want the the script to have
# eventually I would like to set flags, so you can do different things without interactive propmt

# depencies: clr (my script); lineacross (my script)

# user reminders file name file
userdir="${HOME}/.local/share/reminders"
userfile="${userdir}/${USER}-reminders.txt"

# menthod thee - nummbers *** best option -- with cat doesnt need array
print_reminders() {
	# # header text?
	# if [ ! -z $1 ]; then
	#   echo "$1" | clr blue
	# fi
	#
	\cat -n $userfile | clr green
}

# check for user file
reminders_file_check() {
	if [ ! -d "$userdir" ]; then
		echo "'${USER}' has no reminders directory" | clr yellow
		echo -n "creating directory at "
		echo "'$userdir'" | clr blue
		echo
	fi

	if [ ! -f $userfile ]; then
		echo "No reminders found for user '$USER'" | clr yellow

		echo -n "creating file at "
		echo "'$userfile'" | clr blue

		touch $userfile
	else
		lineacross | clr
		echo "Reminders" | clr blue
		print_reminders
		lineacross | clr
	fi
}

# adding reminders to file
add_reminders() {
	echo "Adding reminders: Each line is a single reminder (type 'exit' to stop adding)"

	while true; do
		# echo -n "Reminder to add: " # eventually add reminder number or something
		read -p "New entry: " choice

		if [ "$choice" = "exit" ]; then
			echo "Exiting..." | clr yellow
			break
		fi

		if [ -z "$choice" ]; then
			echo "Error... no input. To stop adding reminders type 'exit'" | clr red
			continue
		fi

		echo "$choice" >>$userfile
	done
}

remove_reminders() { # need to figure out good ux for this
	echo "Remove a reminder: Enter reminder number to remove (type 'exit' to stop removing)"

	while true; do
		print_reminders

		read -p "Number to remove: " choice

		if [ "$choice" = "exit" ]; then
			echo "Exiting..." | clr yellow
			break
		fi

		if [ -z "$choice" ]; then
			echo "Error... no input. To stop removing reminders type 'exit'" | clr red
			continue
		fi

		if [[ ! $choice =~ ^[0-9]+$ ]]; then
			echo "Error... please enter a positive integer" | clr red
			continue
		fi

		line_count=$(wc -l <$userfile)
		if [ "$choice" -gt "$line_count" ]; then
			echo "Error... this reminder does not exsist" | clr red
			continue
		fi

		sed -i "${choice}d" $userfile
	done
}

# Main program
reminders_file_check

while true; do

	# prompt user
	echo "What would you like to do?"
	echo "    1. Add reminders"
	echo "    2. Remove reminders"
	echo "    3. View Reminders"
	echo "    4. Exit program (type 4 or exit)"
	read -p ">>> " option

	# test for user input and perform specific actions
	if [[ $option =~ ^[0-9]+$ ]]; then
		if [ $option -eq 1 ]; then
			echo
			add_reminders
			lineacross | clr
		elif [ $option -eq 2 ]; then
			echo
			remove_reminders
			lineacross | clr
		elif [ $option -eq 3 ]; then
			echo
			echo "Reminders" | clr blue
			print_reminders
			lineacross | clr
		elif [ $option -eq 4 ]; then
			echo
			echo "Goodbye $USER" | clr yellow
			lineacross | clr
			break
		else
			echo
			echo "Error... invalid input: option doesn't exsist (enter 4 or 'exit' to close program)" | clr red
			lineacross | clr
		fi
	else
		if [ "$option" = "exit" ]; then
			echo
			echo "Goodbye $USER" | clr yellow
			lineacross | clr
			break
		else
			echo
			echo "Error... invalid input: please (enter 4 or 'exit' to close program)" | clr red
			lineacross | clr
		fi
	fi

done
