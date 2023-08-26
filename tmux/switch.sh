#!/usr/bin/env bash

# switch tmux sessions

case $1 in
  tss) tmux ls -F '#S' \
        | sk --reverse \
        | xargs -r -I {} tmux switchc -t '{}';;

  tsw) tmux lsw \
        | sk --reverse \
        | awk -F ':' '{print $1}' \
        | xargs -r -I {} tmux selectw -t '{}';;

  tsW) tmux list-windows -a -F '#S:#I: #W' \
        | sk --reverse \
        | sed 's/\ /\\\ /g' \
        | awk -F ':' '{print $1":"$2}' \
        | xargs -r tmux switchc -t;;
esac
