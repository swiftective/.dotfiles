#!/usr/bin/env bash
# this script requires bat tool for paging

selected=`cat ~/.chx-languages ~/.chx-commands | fzf`
if [[ -z $selected ]]; then
  exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.chx-languages; then
  query=`echo $query | tr ' ' '+'`
  tmux neww -n  "Cheat Sheet 🗒 " bash -c "curl -s cht.sh/$selected/$query | bat --paging=always --theme=Visual\ Studio\ Dark+"
else
  tmux neww -n  "Cheat Sheet 🗒 " bash -c "curl -s cht.sh/$selected~$query | bat --paging=always"
fi

