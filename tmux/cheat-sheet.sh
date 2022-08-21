#!/usr/bin/env bash
# this script requires bat tool for paging

selected=`cat ~/.config/tmux/.chx-languages ~/.config/tmux/.chx-commands | fzf`
if [[ -z $selected ]]; then
  exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.config/tmux/.chx-languages; then
  query=`echo $query | tr ' ' '+'`
  tmux neww -n  "Cheat Sheet" bash -c "curl -s cht.sh/$selected/$query?T | bat -p --paging=always --language=$selected"
else
  tmux neww -n  "Cheat Sheet" bash -c "curl -s cht.sh/$selected~$query?T | bat -p --paging=always --language=bash"
fi

