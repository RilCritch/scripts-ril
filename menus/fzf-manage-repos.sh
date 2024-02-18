#!/usr/bin/env bash

# Description ->
#
# |- Summary:
#             - TODO: script explanation
#
# |- Usage: TODO: script syntax
#       * Options:
#             - TODO: script options/flags
#       * Environ:
#             - TODO: environment variables
#
# |- Dependencies:
#             - TODO: script dependencies

# Document Info ->
#
# |- Author: 
#
# |- Last Update: 02/10/2024

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="${PATH:+"$PATH:"}$1"
    fi
}

# Imports - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
. "/home/rc/Repos/bash-ril/ansi_escape_sequences"
pathadd "${HOME}/.local/share/go/bin"

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
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Functions - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
retrieve_gita_status() {
    /home/rc/.local/bin/gita ll --no-colors | grep '\[[^]]\+\]' | awk '{print $1, $3}'
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# |- Retrieve Data ->
repos_path="${HOME}/Repos"
mapfile -t gita_ll < <(retrieve_gita_status)

if [[ "${#gita_ll[@]}" -le 0 ]]; then
    echo -e "${cyan}All of your repositories are up to date!${reset}"
    read -r -p "Press enter to quit"
    exit 0
fi

# |- Prompt user to manage repos ->
choice="notempty"
while [[ ${choice} != "" && ${choice} != "exit (or esc)" && "${#gita_ll[@]}" -gt 0 ]]; do
    fzf_options=("${gita_ll[@]}")
    fzf_options+=("exit (or esc)")

    choice=$(printf "%s\n" "${fzf_options[@]}" | fzf --height=100% --border-label=" Manage Repositories with Changes " --prompt=" " )

    if [[ ${choice} != "" && ${choice} != "exit (or esc)" ]]; then
        lazygit --path="$(echo "${repos_path}/${choice}" | awk '{print $1}')"
    fi
    mapfile -t gita_ll < <(retrieve_gita_status)
done


# |- Final Checks ->
if [[ "${#gita_ll[@]}" -le 0 ]]; then
    echo -e "${cyan}All of your repositories are up to date!${reset}"
    read -r -p "Press enter to quit"
fi

exit

# Vim options - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# vim:fileencoding=utf-8:foldmethod=marker
