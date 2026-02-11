{ config, pkgs, theme, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "clock" "mpris" ];
        modules-right = [
          "temperature"
          "cpu"
          # "custom/rocm"
          "memory"
          "disk"
          "pulseaudio"
          "backlight"
          "battery"
          "custom/notification"
          "idle_inhibitor"
          "tray"
        ];
        "custom/notification" = {
          tooltip = true;
          format = "{icon}";
          format-icons = {
            notification = "󱅫";
            none = "󰂜";
            dnd-notification = "󰂠";
            dnd-none = "󰪓";
            inhibited-notification = "󰂛";
            inhibited-none = "󰪑";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰪑";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
        "custom/rocm" = {
          exec = "sh ~/Nix/dots/scripts/wm/shared/amdgpu.sh";
          exec-if = "which rocm-smi";
          interval = 10;
          return-type = "json";
          format = "{text}";
          tooltip-format = "{alt}";
          tootlip = true;
        };
        "sway/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "󰈹";
            "2" = "";
            "3" = "";
            "4" = "󰙯";
            "5" = "󰓓";
            "6" = "";
            urgent = "";
            active = "";
            default = "";
          };
          disable-scroll = false;
          # all-outputs = true;
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
          };
        };

        mpris = {
          format = "{player_icon} {title} - {artist}";
          format-paused = "{status_icon} {title} - {artist}";
          title-len = 35;
          artist-len = 20;
          player-icons = {
            default = "▶";
            mpv = " ";
            spotify_player = "󰓇 ";
            spotify = "󰓇 ";
            vlc = "󰕼 ";
            firefox = " ";
          };
          status-icons = { paused = "󰏤"; };
          ignored-players = [ "vlc" "mpv" "firefox" ];
        };

        cava = {
          framerate = 30;
          autosens = 1;
          sensitivity = 75;
          bars = 8;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          hide_on_silence = true;
          method = "pulse";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = true;
          noise_reduction = { };
          input_delay = 2;
          format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          actions = { on-click-right = "mode"; };
        };

        "sway/window" = {
          format = "{title}";
          max-length = 30;
          rewrite = {
            "(.*) - [Yy]ou[Tt]ube.*" = "  $1";
            "(.*) - mpv.*" = "  $1";
            # "mpv" = "";
            "(.*) — Zen Browser.*" = " $1";
            # "zen-beta" = "";
            # "vlc" = "󰕼";
            "Picture-in-Picture" = "";
            "nvim" = "";
            "hx (.*)" = " $1";
            "(h|hx)" = "";
            "~" = "";
            "(zsh|bash)" = "";
            "tmux" = "";
            "(wezterm|foot)" = "";
            "(.*[Dd]iscord.*|vesktop)" = "󰙯 ";
            ".*[Rr]eddit.*" = "";
            ".*r\\/([^ ]+).*" = "";
            ".*[Ss]potify.*" = "󰓇 ";
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
          format = "󰃭 {:%B %d %Y %H:%M}";
          # format-alt = "";
          tooltip-format = "<tt><small>{calendar}</small></tt>";

          calendar = {
            mode = "month";
            mode-mon-col = 3;
            # weeks-pos = "right";
            on-scroll = 1;
            # format = {
            #   months = "<span color='#ffead3'><b>{}</b></span>";
            #   days = "<span color='#ecc6d9'><b>{}</b></span>";
            #   weeks = "<span color='#99ffdd'><b>W{}</b></span>";
            #   weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            #   today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            # };
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
          format = " {percentage_used}%";
          tooltip-format = "Used: {used}/{total}";
          path = "/";
        };
        pulseaudio = {
          format = "{icon}{volume}%";
          format-muted = " ";
          format-icons = {
            headphone = " ";
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
    # window#waybar {
    #   border: 2px solid @base0C;
    #   border-radius: 8px;
    #   margin: 6px;
    #   padding: 0;
    # }

    # .modules-left, .modules-right, .modules-center {
    #   background-color: @base00; 
    #   border-radius: 10px;
    #   margin: 3px;
    #   border: none;
    # }
    style = ''
      * {
        font-size: 12px;           
        padding: 0;
        margin: 0;
      }

      window#waybar  {
        border: none;
        padding: 0;
        color: @base05;
      }



      window#waybar #window {
        border: none;
        padding: 0px;
        color: @base09;
      }


      #workspaces button {
        padding: 2px 8px;            
        margin: 0 2px;
        border-radius: 4px;
      }

      .modules-left, .modules-right, .modules-center {
        background-color: @base00; 
      }

      .modules-left #workspaces button.urgent {
       color: @base08;
        border-bottom: 2px solid @base08;

      }

      .modules-left #workspaces button.focused {
        color: @base0B;
        border-bottom: 2px solid @base0B
      }
      .modules-left #workspaces button.empty {
        color: @base02;
      }
      .modules-left #workspaces button {
        color: @base04;
      }


      #tray {
        padding: 4px;
      }
      #clock, #cpu, #memory, #disk, #mpris, #gpu, #temperature, #idle_inhibitor, #battery, #backlight, #pulseaudio, #network, #custom-notification {

        padding: 0 8px;
        margin: 0 2px;
      }

      #custom-notification.dnd-notification, #custom-notification.dnd {
        color: @base0E;
      }
      #custom-notification.notification {
        color: @base0C;
      }
      #custom-notification.dnd-notification {
        color: @base0E;
      }

      #mpris.paused {
       color: @base0E;
      }

      #mpris {
       color: @base0C;
      }

      #idle_inhibitor.activated {
       color: @base0D;
      }
      #idle_inhibitor.deactivated {
       color: @base0E;
      }

      #network.disconnected {
       color: @base0F;
      }

      #pulseaudio.muted {
       color: @base08;
      }

      #pulseaudio.source-muted {
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
        color: @base0F;
      }

      #window {
        padding: 0 10px;
      }
    '';
  };

}
