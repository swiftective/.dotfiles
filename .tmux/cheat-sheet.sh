#!/usr/bin/env bash
# this script requires bat tool for paging

selected=`cat ~/.chx-languages ~/.chx-commands | fzf`
if [[ -z $selected ]]; then
  exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.chx-languages; then
  query=`echo $query | tr ' ' '+'`
  tmux neww -n  "Cheat Sheet 🗒 " bash -c "curl -s cht.sh/$selected/$query | bat -p --paging=always"
else
  tmux neww -n  "Cheat Sheet 🗒 " bash -c "curl -s cht.sh/$selected~$query | bat -p --paging=always"
fi

