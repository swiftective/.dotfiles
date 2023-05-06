#!/bin/bash

if [[ ! -d ~/projects ]]; then
  exit 1
fi

cd ~/projects

dir=$(for i in $(fd -t d -H)
do
  if [[ -d "$i/.git" ]]; then
    echo $i
  fi
done | sk)

if [[ ! $dir ]]; then
  exit 1
fi

session=$(echo projects/$dir | sed 's/\/$//' | sed 's/\//·/g' | sed 's/\./_/g')


if tmux ls | grep -q $session; then
  tmux switch-client -t $session
else
  tmux rename-session $session
  fish -C "cd ~/projects/$dir"
fi
