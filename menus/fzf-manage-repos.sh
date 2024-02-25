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



# Imports - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
source /home/rc/Repos/scripts-ril/menus/spad-bash-conf

pathadd "${HOME}/.local/share/go/bin"
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
