{ config, pkgs, theme, ... }: {
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
            if_command = ''
              [ "$(cat /sys/class/dmi/id/product_name)" != "B650 EAGLE AX" ]'';
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
            if_command =
              ''[ "$(cat /sys/class/dmi/id/product_name)" = "XPS 15 9510" ]'';
            interval = 10;
            format = " 󰾆 $utilization $temperature "; # $clocks
          }
          {
            block = "amd_gpu";
            if_command =
              ''[ "$(cat /sys/class/dmi/id/product_name)" = "B650 EAGLE AX" ]'';
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
          # {
          #   block = "uptime";
          #   interval = 3600;
          # }
          {
            block = "custom";
            interval = 600;
            command =
              "echo  $(docker ps -q | wc -l)  $(tmux ls | wc -l) $(git_i3bar) ";
            # format = "{$command|}";
            click = [{
              button = "left";
              update = true;
            }];
          }
          {
            block = "backlight";
            format = "󰃝 $brightness";
            missing_format = "";
          }
          {
            block = "custom";
            # if_command = "pgrep -f spotify-qt";
            command = "~/Nix/dots/scripts/cava-bar.sh";
            persistent = true;
          }
          {
            block = "sound";
            click = [{
              button = "left";
              cmd = "pavucontrol";
            }];
          }
          {
            block = "music";
            # format = "{ $combo.str(max_w:20,rot_interval:0.4) |}";
            format = "{ $combo.str(max_w:20) $prev $play $next |}";
            # format_alt = "{  $combo.str(max_w:20,rot_interval:0.6) $play |}";
            player = [ "spotify_player" "spotify" "spotify-qt" ];

          }
          {
            block = "custom";
            interval = 3600;
            command =
              "echo 󰖕 $(curl -s 'wttr.in/NYC?format=1' | awk -F'+' '{print $2}')";
          }
          # {
          #   block = "tea_timer";
          #   format = "󰔟 {$time|0m 00s}";
          #   done_cmd = "notify-send 'Timer Finished'";
          #   increment = 301;
          # }
          {
            block = "time";
            interval = 60;
            format = "$timestamp.datetime(f:' %D %I:%M%p') ";
          }
          {
            block = "toggle";
            format = "$icon 󰋋 ";
            command_state = "pactl get-default-sink | grep -i -v 'usb'";
            command_on = "sel_audio headphones";
            command_off = "sel_audio";
            state_on = "idle";
            state_off = "idle";
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
            if_command = ''
              [ "$(cat /sys/class/dmi/id/product_name)" != "B650 EAGLE AX" ]'';

            format =
              " $percentage {$time_remaining.dur(hms:true, min_unit:m) |}";
            device = "DisplayDevice";
            driver = "upower";
            missing_format = "";
            full_format = "";
          }
        ];
        settings = {
          theme = {
            theme = theme.i3statusTheme;
            # theme = "${config.home.homeDirectory}/Nix/dots/assets/tokyonight.toml";
          };

          icons = { icons = "awesome4"; };
        };
      };
    };
  };
}
