{
    config, 
    pkgs, 
    ...
}: 
{
    programs.i3status-rust = {
        enable = true; 
        bars = {
            bottom = {
                blocks = [
                    {
                        block = "cpu"; 
                        info_cpu = 20; 
                        warning_cpu = 50; 
                        critical_cpu = 90; 
                        interval = 5; 
                        format = "  $utilization"; 
                    }
                    {
                        block = "memory"; 
                        interval = 5; 
                        format = " $icon $mem_used_percents.eng(w:2) ";
                    }
                    {
                        block = "temperature"; 
                        interval = 5; 
                        format = " $icon $average"; 
                        idle = 55;
                    }
                    {
                        block = "custom"; 
                        interval = 5;
                        if_command = "[ \"$(cat /sys/class/dmi/id/product_name)\" != \"B650 EAGLE AX\" ]";
                        command = ''
                            if [ "$(sensors | grep fan1 | awk '{print $2; exit}')" -gt 2000 ]; then 
                                echo 󰈐 $(sensors | grep fan1 | awk '{print $2; exit}')
                            fi
                        ''; 
                        hide_when_empty = true;
                        theme_overrides = { 
                            idle_bg = { link = "warning_bg"; };
                            idle_fg = { link = "warning_fg"; };
                        };
                    }
                    {
                        block = "nvidia_gpu"; 
                        if_command = "[ \"$(cat /sys/class/dmi/id/product_name)\" = \"XPS 15 9510\" ]";
                        interval = 10; 
                        format = " 󰾆 $utilization $temperature ";  #$clocks
                    }
                    {
                        block = "amd_gpu";
                        if_command = "[ \"$(cat /sys/class/dmi/id/product_name)\" = \"B650 EAGLE AX\" ]";
                        format = "   $utilization $vram_used ";
                        interval = 5;
                    }

                    # {
                    #     block = "net"; 
                    #     format_alt = "{󰖩 $ssid | 󰈀 }$speed_up $speed_down "; 
                    #     format = "{󰖩 $ssid | 󰈀 }"; 
                    #     inactive_format = "󰖪 "; 
                    # }
                    {
                        block = "disk_space";
                        info_type = "used";
                        alert_unit = "GB";
                        alert = 700.0;
                        warning = 875.0;
                        format = " $icon $used ";
                    }
                    {
                        block = "uptime"; 
                        interval = 3600;
                    }
                    {
                        block = "backlight"; 
                        format = "󰃝 $brightness";
                        missing_format = ""; 
                    }
                    {
                        block = "sound"; 
                        driver = "pulseaudio"; 
                    }
                    {
                        block = "music"; 
                        format = "{  $combo.str(max_w:20,rot_interval:0.4) |}";
                        player = "spotify_player";

                    }
                    {
                        block = "custom";
                        interval = 3600;
                        command = "echo 󰖕 $(curl -s 'wttr.in/NYC?format=1' | awk -F'+' '{print $2}')";
                    }
                    {
                        block = "tea_timer"; 
                        format = "󰔟 {$time |}";
                        done_cmd = "notify-send 'Timer Finished'";
                        increment = 301;
                    }
                    {
                        block = "time";
                        interval = 60;
                        format = "$timestamp.datetime(f:' %D %I:%M%p') ";
                    }
                    
                    {
                        block = "toggle";
                        format = "$icon 󰅶 ";
                        command_state = "xset q | grep 'DPMS is Disabled'";
                        command_on = "xset q -dpms s off";
                        command_off = "xset q +dpms s on";
                        state_on = "idle";
                        state_off = "idle";
                    }
                    {
                        block = "menu"; 
                        text = " ";
                        items = [ 
                            {
                                display = "󰄽 󰒲 Suspend 󰄾";
                                cmd = "i3lock -c 000000 && systemctl suspend";
                            }
                            {
                                display = "󰄽 ⭘ Shutdown 󰄾";
                                cmd = "systemctl poweroff";
                            }
                            {
                                display = "󰄽  Restart 󰄾";
                                cmd = "systemctl reboot";
                            }
                            {
                                display = "󰄽  Lock 󰄾";
                                cmd = "i3lock -c 000000";
                            }
                            {
                                display = "󰄽 󰍃 Log Out 󰄾";
                                cmd = "i3-msg exit";
                            }                        
                        ];
                    }
                    {
                        block = "battery";
                        if_command = "[ \"$(cat /sys/class/dmi/id/product_name)\" != \"B650 EAGLE AX\" ]";

                        format = " $percentage {$time_remaining.dur(hms:true, min_unit:m) |}";
                        device = "DisplayDevice";
                        driver = "upower";
                        missing_format = "";
                        full_format = "";
                    }
                ];
                settings = {
                    theme = {
                        theme = "${config.home.homeDirectory}/Nix/dots/assets/tokyonight.toml";
                        # theme = "gruvbox-dark";
                        # theme = "ctp-mocha";
                        # theme = "nord-dark";
                        # theme_overrides = { 
                        #     idle_bg = "#1a1b26";
                        #     idle_fg = "#c0caf5";
                        #     good_fg = "#16161e";
                        #     good_bg = "#9ece6a";
                        #     warning_fg = "#16161e";
                        #     warning_bg = "#ff9e64";
                        #     critical_fg = "#16161e";
                        #     critical_bg = "#f7768e";
                        #     separator = "\ue0b2";
                        #     separator_bg = "auto";
                        #     separator_fg = "auto";
                        # };
                    };


                    icons = {
                        icons = "awesome4";
                    };
                };
            };
        };
    };
}

