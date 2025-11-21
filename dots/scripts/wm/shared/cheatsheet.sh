#!/usr/bin/env bash

CHT_DIR="$HOME/coding/resources/"

selected=$(fd . "$CHT_DIR" -t f -e md --exec basename {} \; | fzf)

if [ -n "$TMUX" ]; then
	tmux new-window "glow --pager \"$CHT_DIR$selected\"" # use ';read' to keep pane open upon quit
else
	glow --pager "$CHT_DIR$selected"
fi
