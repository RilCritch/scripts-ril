#!/usr/bin/env bash

# Set fzf values so this works when run from window manager
export FZF_DEFAULT_OPTS="--header-first \
--reverse --no-scrollbar --border \
--prompt=' ' --pointer='▶' --marker='󱦰' \
--color='fg:0,fg+:7,bg:-1,bg+:-1,\
hl:-1,hl+:6,info:15,border:8,header:4,\
prompt:6,pointer:4,spinner:3'"

clipcat-menu
