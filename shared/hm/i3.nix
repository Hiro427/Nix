{
    config, 
    pkgs, 
    ...
}: 
{
    xsession.windowManager.i3.enable = true;
    xsession.windowManager.i3.config = {
        startup = [
            { command = "--no-startup-id dex --autostart environment i3"; }
            { command = "--no-startup-id picom --config $HOME/.config/picom/picom.conf"; }
            { command = "--no-startup-id nm-applet &"; } 
            { command = "--no-startup-id sh ~/Nix/dots/i3/scripts/natscroll.sh"; }
            { command = "--no-startup-id sh ~/Nix/dots/i3/scripts/monitors.sh"; }
            { command = "--no-startup-id feh --bg-fill $(cat ~/Nix/dots/i3/cur_wall.txt)"; always = true; }
            { command = "--no-startup-id autotiling"; always = true; }
            { command = "--no-startup-id dunst &"; }
            { command = "--no-startup-id setxkbmap -option caps:escape"; always = true; }
        ];
        keybindings = {
            "Mod4+w" = "exec i3-msg kill";
            "Mod4+h" = "focus left";
            "Mod4+j" = "focus down";
            "Mod4+k"  = "focus up";
            "Mod4+l"  = "focus right";
            "Mod4+Shift+h" = "move left";
            "Mod4+Shift+j" = "move down";
            "Mod4+Shift+k" = "move up";
            "Mod4+Shift+l" = "move right";
            "Mod4+Shift+f" = "fullscreen toggle";
            "Mod4+Shift+space" = "floating toggle";
            "Mod4+a" = "focus parent";
            "Mod4+minus" = "move scratchpad";
            "Mod4+Shift+minus" = "scratchpad show";
            "Mod4+Shift+b" = "bar mode toggle";
            "Mod4+Return" = "exec wezterm"; 
            "Mod4+f" = "exec nautilus";
            "Mod1+Shift+p" = "exec sh ~/.config/rofi/power.sh";
            # "Mod4+space" = "exec dmenu_run -nb '#1e1e2e' -nf '#cdd6f4' -sb '#b4befe' -sf '#1e1e2e'";
            "Mod4+space" = "exec zsh -c bemenu-run";
            "Ctrl+space" = "exec flameshot gui"; 
            "Mod4+Shift+r" = "restart"; 
            "Mod4+Shift+c" = "reload";
            "Mod4+Shift+s" = "mode resize"; 
            "Mod4+1" = "workspace number 1"; 
            "Mod4+2" = "workspace number 2"; 
            "Mod4+3" = "workspace number 3"; 
            "Mod4+4" = "workspace number 4"; 
            "Mod4+5" = "workspace number 5"; 
            "Mod4+6" = "workspace number 6"; 
            "Mod4+Shift+1" = "move container to workspace number 1"; 
            "Mod4+Shift+2" = "move container to workspace number 2"; 
            "Mod4+Shift+3" = "move container to workspace number 3"; 
            "Mod4+Shift+4" = "move container to workspace number 4"; 
            "Mod4+Shift+5" = "move container to workspace number 5"; 
            "Mod4+Shift+6" = "move container to workspace number 5"; 
            "Mod4+Tab" = "workspace back_and_forth";
            "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +1%";
            "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -1%";
            "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
            "XF86MonBrightnessUp" = "exec brightnessctl set +1%";
            "XF86MonBrightnessDown" = "exec brightnessctl set 1%-";
        };
        modes = {
          resize = {
                Down = "resize grow height 10 px or 10 ppt";
                Escape = "mode default";
                Left = "resize shrink width 10 px or 10 ppt";
                Return = "mode default";
                Right = "resize grow width 10 px or 10 ppt";
                Up = "resize shrink height 10 px or 10 ppt";
          };
        };
        gaps = {
            inner = 10;
            outer = 5;
            smartBorders = "no_gaps"; 
            smartGaps = false; 
        };
        focus.followMouse = false;
        assigns = {
            "2" = [{ class = "org.wezfurlong.wezterm"; }];
            # "2" = [{ class = "com.mitchellh.ghostty"; }];
            "3" = [{ class = "vesktop"; }];
            "4" = [{ class = "Spotify"; }];
            "6" = [{ class = "PrismLauncher"; }];
        };
        window = {
            border = 0;
            hideEdgeBorders = "smart";
            commands = [
                {
                    command = "floating disable, move workspace 1"; 
                    criteria = {
                        class = "Brave-browser"; 
                    };
                }
            ];
            titlebar = false;
        };
        floating = {
            titlebar = false; 
            modifier = "Mod4";
            border = 0; 
        };
        defaultWorkspace = "workspace number 1";
        bars = [
            {
                id = "mainbar";
                mode = "dock";
                trayOutput = "primary";
                statusCommand = "i3status-rs ~/.config/i3status-rust/config-bottom.toml";
                position = "bottom";
                fonts = {
                    names = [
                        "JetBrainsMonoNerdFont"
                    ];
                    size = 12.0;
                };
                colors = {
                    # separator = "#cdd6f4"; 
                    # statusline = "dddddd"; 
                    background = "#282828"; # "#1e1e2e" - catppuccin "#665c54" -gruv  "#2e3440" nord
                     inactiveWorkspace = {
                       # background = "#11111b"; #ctp
                       # border = "#11111b";
                       # text = "#313244";
                       background = "#1d2021"; #gruv
                       border = "#1d2021";
                       text = "#504945";
                       # background = "#2e3440";  #nord
                       # border = "#4c566a";
                       # text = "#eceff4";
                    };
                    focusedWorkspace = {
                       # background = "#a6adc8"; ctp
                       # border = "#cdd6f4";
                       # text = "#11111b";
                       background = "#ebdbb2"; #gruv
                       border = "#d5c4a1";
                       text = "#282828";
                       # background = "#eceff4"; nord
                       # border = "#4c566a";
                       # text = "#2e3440";

                    };
                    activeWorkspace = {
                       background = "#333333";
                       border = "#333333";
                       text = "#ffffff";
                    };

                };
                extraConfig = "height 25";
            }
        ];

   };
}
