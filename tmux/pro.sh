#!/bin/dash

if [ ! -d ~/projects ]; then
  exit 1
fi

cd ~/projects

dir=$(ls -d */*/ | sk)

if [ "$dir" = "" ]; then
  exit 1
fi

session=$(echo $dir | sed 's/\/$//' | sed 's/\//·/')

if tmux ls | grep -q $session; then
  tmux switch-client -t $session
else
  tmux new-session -d -s $session -c "$HOME/projects/$dir"
  tmux switch-client -t $session
fi
