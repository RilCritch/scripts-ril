#!/usr/bin/env bash

# retrieve clipboard history -- dependant on clipster
options=$(clipster -c -o -n 0 | grep -P '\S') # grep to remove empty spaces

# retrieve selection using fzf
selection=$(printf '%s\n' "${options[@]}" | \fzf --color='border:0,label:5,pointer:5,bg+:-1,gutter:-1,hl:7,hl+:4,fg:8,fg+:7,info:0,header:4,spinner:6' --header-first --reverse --prompt='󱃔  ' --pointer='󰮺' --no-scrollbar --layout=reverse --border=double --border-label=' Clipboard History ' --height=100% --separator='󰇼')

# if there was a selection add it to front of clipboard history
if [ -n "$selection" ]; then
	echo -n "$selection" | xclip -selection clipboard
fi
