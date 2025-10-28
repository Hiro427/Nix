#!/usr/bin/env bash

case $(hostname) in
    nixos)
        # Get mouse device name (adapt the grep pattern as needed)
        MOUSE_DEVICE=$(swaymsg -t get_inputs | \
            jq -r '.[] | select(.type == "pointer") | select(.name | contains("Logitech")) | .identifier')
        
        if [ -n "$MOUSE_DEVICE" ]; then
            # Set natural scrolling
            swaymsg input "$MOUSE_DEVICE" natural_scroll enabled
        fi
        ;;
esac
