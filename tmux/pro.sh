#!/bin/dash

if [ ! -d ~/projects ]; then
  exit 1
fi

dir=$(fd -t d -H -g .git --base-directory ~/projects | xargs dirname | sk)

if [ "$dir" = "" ]; then
  exit 1
fi

session=$(echo projects/$dir | sed 's/\/$//' | sed 's/\//·/g' | sed 's/\./·/g')

if tmux ls | grep -q $session; then
  tmux switch-client -t $session
else
  tmux new-session -d -s $session -c "$HOME/projects/$dir"
  tmux switch-client -t $session
fi
