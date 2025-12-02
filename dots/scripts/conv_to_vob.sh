#!/usr/bin/env bash

FILES=()

mapfile -t FILES < <(fd -e mp4 --maxdepth 1)

for item in "${FILES[@]}"; do
	if [ "${item##*.}" == "mp4" ]; then
		ffmpeg -i "$item" -target ntsc-dvd "Output/${item%.*}".vob
	fi
done
