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
                    }
                    {
                        block = "nvidia_gpu"; 
                        if_command = "[ \"$(cat /sys/class/dmi/id/product_name)\" = \"XPS 15 9510\" ]";
                        interval = 10; 
                        format = " 󰾆 $utilization $temperature $clocks "; 
                    }
                    {
                        block = "custom"; 
                        interval = 5;
                        command = "echo 󰈐 $(sensors | grep fan1 | awk '{print $2; exit}')"; 
                    }
                    {
                        block = "net"; 
                        format_alt = "{󰖩 $ssid | 󰈀 }$speed_up $speed_down "; 
                        format = "{󰖩 $ssid | 󰈀 }"; 
                        inactive_format = "󰖪 "; 
                    }
                    {
                        block = "disk_space";
                        info_type = "available";
                        alert_unit = "GB";
                        alert = 100.0;
                        warning = 150.0;
                        format = " $icon $available ";
                    }
                    {
                        block = "uptime"; 
                        interval = 3600;
                    }
                    {
                        block = "backlight"; 
                        missing_format = ""; 
                    }
                    {
                        block = "sound"; 
                        driver = "pulseaudio"; 
                    }
                    {
                        block = "custom";
                        interval = 3600;
                        command = "echo 󰖕 $(curl -s 'wttr.in/NYC?format=1' | awk -F'+' '{print $2}')";
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
                        state_on = "good";
                        state_off = "idle";
                    }
                    {
                        block = "battery";
                        format = " $percentage {$time_remaining.dur(hms:true, min_unit:m) |}";
                        device = "DisplayDevice";
                        driver = "upower";
                        missing_format = "";
                        full_format = "";
                    }
                ];
                settings = {
                    theme = {
                        theme = "ctp-mocha"; 
                    }; 
                    icons = {
                        icons = "awesome4";
                    };
                };
            };
        };
    };
}

