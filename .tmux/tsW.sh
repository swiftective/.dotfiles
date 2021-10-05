#!/usr/bin/env bash

tmux list-windows -a -F '#S:#I: #W' | fzf-tmux -p --reverse | sed 's/\ /\\\ /g' | awk -F ':' '{print $1":"$2}' | xargs tmux switchc -t
