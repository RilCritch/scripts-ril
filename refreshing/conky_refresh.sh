#!/usr/bin/env bash

# simple script for killing and restarting conky

pkill conky

# (conky -c $HOME/.config/conky/qtile.conkyrc) &
(conky -c $HOME/.config/conky/calander.conkyrc) &
