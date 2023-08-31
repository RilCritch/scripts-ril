#!/usr/bin/env bash

# Author: RilCritch

# Last update: 07/08/23

# Description: basic script for performing common actions in qtile

# Dependencies:

# script options - add more system like apps/commands as needed
options=("Reload Qtile" "Restart Qtile" "Set Wallpaper" "Power Manager" "Archlinux Tweak Tool" "Refresh Conky")

# run rofi with specified options and retrieve selection
selection=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p 'system shit')

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
    "Refresh Conky")
        ~/mydots/scripts/refreshing/conky_refresh.sh
        ;;
    *)
        # action when no/non-exsistent option selected
        ;;
esac
