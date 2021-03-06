#!/usr/bin/env bash

# switch tmux sessions
if [[ $1 == tss ]]; then
  tmux ls -F '#S' | fzf-tmux --prompt="🔍 " -p --reverse | xargs -r -I {} tmux switchc -t '{}'
fi

# switch tmux windows
if [[ $1 == tsw ]]; then
  tmux lsw | fzf-tmux -p --reverse --prompt="🔍 " | awk -F ':' '{print $1}' | xargs -r -I {} tmux selectw -t '{}'
fi

# switch all tmux windows
if [[ $1 == tsW ]]; then
  tmux list-windows -a -F '#S:#I: #W' | fzf-tmux -p --reverse --prompt="🔍 " | sed 's/\ /\\\ /g' | awk -F ':' '{print $1":"$2}' | xargs -r tmux switchc -t
fi
