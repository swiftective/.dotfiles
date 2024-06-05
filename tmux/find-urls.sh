#!/usr/bin/bash

url_regex="https?://[^\s\"']+"

url=$(tmux capture-pane -pS -10000 | rg -oP "$url_regex" | uniq | sk)

if [[ "$url" == "" ]]; then
  exit 0
fi

xdg-open $url
