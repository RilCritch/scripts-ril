#!/usr/bin/env bash

# Author: RilCritch

# Last update: 07/07/23

# Description: default rofi dmenu like script to use as a template

# Dependencies:

# script options
options=("opt1" "opt2" "optN")

# run rofi with specified options and retrieve selection
selection=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p 'prompt name')

# decide what to with specified option
case "$selection" in
    "opt1")
        # option one action
        ;;
    "opt2")
        # option two action
        ;;
    "optN")
        # add as many opts as you want
        ;;
    *)
        # action when no/non-exsistent option selected
        ;;
esac
