#!/usr/bin/env bash

export FZF_DEFAULT_OPTS="--header-first \
--reverse --border-label-pos=2 -i \
--no-scrollbar --border --height=100% \
--prompt='󱘟 ' --pointer='' --marker='󰮺' \
--color='\
fg:black,fg+:-1,preview-fg:white,\
bg:-1,bg+:-1,preview-bg:-1,\
hl:cyan:dim,hl+:blue:underline,\
query:cyan,disabled:cyan:dim,\
prompt:cyan:dim,pointer:blue,marker:blue:dim,\
info:bright-white,spinner:yellow,\
border:white,separator:bright-black:dim,scrollbar:8:dim,\
header:cyan,label:blue:bold,preview-label:cyan'"

clipcat-menu

exit
