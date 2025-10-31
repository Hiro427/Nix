#!/usr/bin/env bash

# Options for the power menu
# options=" Lock\n Logout\n Reboot\n Shutdown\n Suspend"
options="\n\n\n\n"
# Show the power menu in Rofi and capture the user's choice
# chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu:" -theme-str 'inputbar {enabled: false;} window { height: 200px; }' -kb-row-down "j" -kb-row-up "k")

DE=$XDG_CURRENT_DESTKOP

chosen=$(echo -e "$options" | rofi -dmenu -i -p "" \
    -theme-str '
        * {
            font: "Font Awesome 6 Free 36";
        }
        window {
            width: 100px;
            height: 43%;
            location: east;
            x-offset: -20;
            border-radius: 15px;
            border: 0px;
        }
        listview {
             padding: 30px 3px 3px 0px;
            spacing: 30px;
            fixed-height: false;
        }
        element selected {
            border-radius: 10px;
        }
        entry, prompt, inputbar {
            enabled: false;
        }
        element-text, element-icon {
            horizontal-align: 0;
            vertical-align: 0;
            padding: 5px;
        }' \
    -kb-row-down "j" -kb-row-up "k")

exit_cmd() {
    if [[ "$DE" != "sway" ]]; then 
        i3-msg exit
     else
         sway-msg exit
    fi
}

suspend_cmd() {
    if [[ "$DE" != "sway" ]]; then 
        i3-lock -c 000000 && systemctl suspend
     else
         swaylock && systemctl suspend
    fi
}

lock_cmd() {
    if [[ "$DE" != "sway" ]]; then 
        i3-lock -c 000000
     else
         swaylock
    fi
}

    


# Execute the corresponding command based on the user's choice
case "$chosen" in
    "")
        # Replace with your lock screen command
        i3lock -c 000000
        ;;
    "")
        # Replace with the appropriate logout command for your desktop environment
        exit_cmd
        ;;
    "")
       systemctl reboot
        ;;
    "")
        systemctl poweroff
        ;;
    "")
        # light-locker-command -l && systemctl suspend 
        # i3lock -c 000000 && systemctl suspend
        suspend_cmd
        ;;
    *)
        # Exit if no option is chosen
        exit 0
        ;;
esac


