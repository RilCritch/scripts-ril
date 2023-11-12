#!/usr/bin/env bash

# A script that retrieves the top level path of a
# git repo and if one exists prints the top-level directory name

# if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
#     top_level_path=$(git rev-parse --show-toplevel)
#     top_level_name=$(basename "$top_level_path")
#     echo "$top_level_name"
# else
#     echo ""
# fi

top_level_path=$(git rev-parse --show-toplevel)
top_level_name=$(basename "$top_level_path")
echo "$top_level_name"
