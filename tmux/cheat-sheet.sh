#!/usr/bin/env bash
# this script requires bat tool for paging

selected=`cat ~/.config/tmux/.chx-languages ~/.config/tmux/.chx-commands | fzf`
if [[ -z $selected ]]; then
  exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.config/tmux/.chx-languages; then
  query=`echo $query | tr ' ' '+'`
  tmux splitw -h bash -c "curl -s cht.sh/$selected/$query?T | bat -p --paging=always --language=$selected"
else
  tmux splitw -h bash -c "curl -s cht.sh/$selected~$query | bat -p --paging=always"
fi

