#!/usr/bin/env bash
# this script requires bat tool for paging

selected=`cat ~/.config/tmux/.chx-languages | fzf --bind=enter:replace-query+print-query`
if [[ -z $selected ]]; then
  exit 0
fi

if grep -qs "$selected" ~/.config/tmux/.chx-languages; then
  read -p "Enter Query: " query
  query=`echo $query | tr ' ' '+'`
  tmux splitw -h bash -c "curl -s cht.sh/$selected/$query?T | bat -p --paging=always --language=$selected"
else
  query=`echo $query | tr ' ' '+'`
  tmux splitw -h bash -c "curl -s cht.sh/$selected~$query?T | bat -p --paging=always --language=bash"
fi

