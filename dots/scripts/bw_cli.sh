#!/usr/bin/env bash

PASSWORD=$(rofi -dmenu -password -p "Enter Password: ")

if [[ "$PASSWORD" == "" ]]; then
    exit
fi

SESSION=$(bw unlock ${PASSWORD} --raw)

ITEM=$(rofi -dmenu -p "Search Passwords: ")

BW_JSON=$(bw list items --session "$SESSION" --search "$ITEM")

ENTRIES=()

mapfile -t ENTRIES < <(echo "$BW_JSON" | jq -r '.[].name')

selected=$(printf "%s\n" "${ENTRIES[@]}" | rofi -dmenu -p "select login: ")


PWSD=$(echo "$BW_JSON" | jq -r '.[] | select(.name == \"$selected\")')

echo "$PWSD"


