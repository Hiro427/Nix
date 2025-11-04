#!/usr/bin/env bash

HOST=$(cat "/sys/class/dmi/id/product_name")

desktop() {
  local resp
  local identifier

  resp=$( swaymsg -r -t get_inputs | \
    jq -r '.[] | select((.type == "pointer") and (.name | contains("Logitech")))')

  identifier=$(echo "$resp" | jq -r .identifier)

  swaymsg input "$identifier" "natural_scroll" "enabled"

}


laptop() {
  local resp
  local identifier

    resp=$( swaymsg -r -t get_inputs | \
    jq -r '.[] | select(.type == "touchpad")')

  identifier=$(echo "$resp" | jq -r .identifier)

  swaymsg input "$identifier" "natural_scroll" "enabled"
    

}


case "$HOST" in
  "B650 EAGLE AX")
    desktop
  ;;
  "XPS 15 9510" | "20L70023US")
    laptop
  ;;
  *)
   exit
  ;;

esac
