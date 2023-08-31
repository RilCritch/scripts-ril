#!/usr/bin/env bash

# simple script for killing and restarting conky

pkill conky

(conky -c $HOME/.config/conky/qtileconky.lua) &

