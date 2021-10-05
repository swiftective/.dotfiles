#!/usr/bin/env bash

tmux lsw | fzf-tmux -p --reverse | awk -F ':' '{print $1}' | xargs -I {} tmux selectw -t '{}'
