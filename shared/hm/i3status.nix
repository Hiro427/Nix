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

          {
            block = "disk_space";
            info_type = "used";
            alert_unit = "GB";
            alert = 700.0;
            warning = 875.0;
            format = " $icon $free.eng(range:..10e10) |";
          }
          # {
          #   block = "custom";
          #   command = "~/Nix/dots/scripts/cava-bar.sh";
          #   persistent = true;
          # }
          {
            block = "sound";
            click = [{
              button = "left";
              cmd = "pavucontrol";
            }];
          }
          {
            block = "backlight";
            format = "󰃝 $brightness";
            missing_format = "";
          }
          {
            block = "music";
            format = "{ $combo.str(max_w:15,rot_interval:0.6) | (-.-)Zzz...}";
            player = [ "spotify_player" "spotify" "spotify-qt" "ncspot" ];

          }
          # {
          #   block = "custom";
          #   interval = 600;
          #   command =
          #     "echo  $(docker ps -q | wc -l)  $(tmux ls | wc -l) $(git_i3bar) ";
          #   click = [{
          #     button = "left";
          #     update = true;
          #   }];
          # }
          {
            block = "custom";
            interval = 3600;
            command =
              "echo 󰖕 $(curl -s 'wttr.in/NYC?format=1' | awk -F'+' '{print $2}')";
          }

          # {
          #   block = "custom";
          #   interval = 60;
          #   command = "~/Nix/dots/scripts/mullstat";
          #   click = [
          #     {
          #       button = "left";
          #       cmd = "mullvad connect";
          #     }
          #     {
          #       button = "right";
          #       cmd = "mullvad disconnect";
          #     }
          #   ];
          #
          # }
          # {
          #   block = "vpn";
          #   driver = "mullvad";
          #   interval = 180;
          #   format_connected = "󰖂 : $icon ";
          #   format_disconnected = "󰖂 : $icon ";
          #   state_connected = "good";
          #   state_disconnected = "idle";
          # }
          {
            block = "net";
            format = "{󰖩 $signal_strength $ssid $frequency|󰈀 Wired} ";
            click = [{
              button = "left";
              cmd = "nm-connection-editor";
            }];
          }
          # {
          #   block = "toggle";
          #   format = "$icon 󰅶 ";
          #   command_state = "xset q | grep 'DPMS is Disabled'";
          #   command_on = "xset q -dpms s off";
          #   command_off = "xset q +dpms s on";
          #   state_on = "idle";
          #   state_off = "idle";
          # }
          {
            block = "time";
            interval = 60;
            format = "$timestamp.datetime(f:' %D %I:%M%p') ";
          }
          {
            block = "menu";
            text = " ";
            items = [
              {
                display = "󰄽 󰒲 Suspend 󰄾";
                cmd = "i3lock -c 000000 && systemctl suspend";
                # cmd = "swaylock && systemctl suspend";
              }
              {
                display = "󰄽 󰍃 Log Out 󰄾";
                cmd = "i3-msg exit";
                # cmd = "swaymsg exit";
              }
              {
                display = "󰄽  Restart 󰄾";
                cmd = "systemctl reboot";
              }
              {
                display = "󰄽 ⭘ Shutdown 󰄾";
                cmd = "systemctl poweroff";
              }
              {
                display = "󰄽  Lock 󰄾";
                cmd = "swaylock";
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
