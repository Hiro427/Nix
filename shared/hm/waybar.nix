{ config, pkgs, theme, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "sway/window" ];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "backlight"
          "disk"
          "temperature"
          "cpu"
          "memory"
          "battery"
          "clock"
          "tray"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;

        };

        "sway/window" = {
          format = "{title}";
          max-length = 50;
          rewrite = {
            "(.*) - [Yy]ou[Tt]ube.*" = "  $1";
            "nvim" = "";
            "hx" = "";
            "zsh" = "";
            "bash" = "";
            "wezterm" = "";
            ".*[Dd]iscord.*" = "󰙯 ";
            ".*[Rr]eddit.*" = "";
            ".*r\\/([^ ]+).*" = "";
          };
        };
        tray = { spacing = 5; };

        battery = {
          # bat = "BAT2";
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          max-length = 25;
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰅶";
            deactivated = "󰾪";
          };
        };
        clock = {
          format = " {:%H:%M}";
          format-alt = "󰃭 {:%m-%d-%Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";

          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };

        temperature = {
          format = " {temperatureC}C";
          tooltip = false;
          critical-threshold = 80;
        };
        memory = {
          interval = 10;
          format = "  {}%";
          max-length = 10;
        };
        cpu = {
          interval = 10;
          format = "  {}%";
          max-length = 10;
        };
        disk = {
          interval = 60;
          format = " {percentage_free}%";
          path = "/";
        };
        pulseaudio = {
          format = "{icon}{volume}%";
          format-muted = " ";
          format-icons = {
            headphone = "";
            default = [ " " " " ];

          };
          scroll-step = 1;
          on-click = "pavucontrol";
        };
        backlight = {
          format = " {percent}%";
          # format-icons = [ "" "" ];
        };
        network = {
          interface = "wlp2s0";
          format = "{ifname}";
          format-wifi = " {essid}";
          format-ethernet = "󰈀";
          format-disconnected = "󱛅";
          tooltip-format = "{ifname} via {gwaddr} 󰊗";
          tooltip-format-wifi = " {essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}  ";
          tooltip-format-disconnected = "Disconnected";
          max-length = 15;
        };

      };
    };
    style = ''
      * {
        font-size: 14px;           
        padding: 0;
        margin: 0;
      }

      window#waybar {
        border: none;
        padding: 0;
      }

      #workspaces button {
        padding: 2px 8px;            
        margin: 0 2px;
        border-radius: 4px;
      }

      .modules-left #workspaces button.focused {
        border-bottom: 2px solid @base0C;
        color: @base0C;
      }

      #tray {
        padding: 4px;
      }
      #clock, #cpu, #memory, #disk, #temperature, #idle_inhibitor, #battery, #backlight, #pulseaudio, #network {
        padding: 0 8px;
        margin: 0 2px;
      }

      #idle_inhibitor.activated {
       color: @base0B;
      }

      #network.disconnected {
       color: @base08;
      }
      #pulseaudio.muted {
       color: @base08;
      }


      #battery.warning {
       color: @base0A;
      }

      #battery.critical {
       color: @base08;
      }

      #battery.charging {
       color: @base0B;
      }
      #temperature.critical {
        color: @base08;
      }

      #window {
        padding: 0 10px;
      }
    '';
  };

}
