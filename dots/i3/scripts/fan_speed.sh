#!/usr/bin/env bash

speed=$(sensors | grep fan1 | awk '{print $2; exit}')

if [ "$speed" != "" ]; then
    # speed_round=$(echo "$speed/1000" | bc -l | LANG=C xargs printf "%.1f\n")
    echo "󰈐 $speed"
else
   echo ""
fi
