#!/usr/bin/env bash

# Retrieve environment variables
source /home/rc/Repos/scripts-ril/menus/spad-bash-conf
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --prompt='󱘟 '"

clipcat-menu

exit
