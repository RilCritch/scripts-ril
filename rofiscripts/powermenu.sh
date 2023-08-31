#!/usr/bin/env bash

# Author: RilCritch

# Last update: 07/07/23

# Description: default rofi dmenu like script to use as a template

# Dependencies: rofi, wmctrl, grep, awk, systemd, and polkit

# script options
options=("Logout" "Suspend" "Hibernate" "Reboot" "Shutdown")

# run rofi with specified options and retrieve selection
selection=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p 'prompt name')

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
