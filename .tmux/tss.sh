#!/usr/bin/env bash

tmux ls -F '#S' | fzf-tmux -p --reverse | xargs -I {} tmux switchc -t '{}'
