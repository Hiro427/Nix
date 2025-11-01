{ config, pkgs, theme, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      indicator-idle-visible = false;
      indicator-radius = 100;
      show-failed-attempts = true;
    };
  };
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 120;
        command = "${pkgs.swaylock}/bin/swaylock";

      }
      {
        timeout = 130;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];

  };
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
    };
  };
  wayland.windowManager.sway = {
    checkConfig = false;
    # package = pkgs.swayfx;
    enable = true;
    config = {
      startup = [
        {
          command =
            "swaymsg output '*' bg $(cat ~/Nix/dots/scripts/wm/cur_wall.txt) fill";
          always = true;
        }
        {
          command = "sh ~/Nix/dots/scripts/wm/natscroll_sway.sh";
          always = true;
        }
        { command = "autotiling"; }
        { command = "waybar"; }
      ];
      input = { "type:keyboard" = { xkb_options = "caps:escape"; }; };
      keybindings = {
        "Mod4+w" = "exec i3-msg kill";
        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";
        "Mod4+p" = "exec ~/Nix/dots/scripts/wm/rofi-power-menu.sh";
        "Mod1+Tab" = "exec ~/Nix/dots/scripts/rofi_win_sw.sh";
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
        "Mod4+b" = "exec zen-beta";
        # "Mod4+space" = "exec vicinae toggle";
        # "Mod4+space" = "exec fuzzel";
        "Mod4+space" = "exec rofi -show drun";
        #
        #
        "Ctrl+space" = "exec flameshot gui";
        "Mod4+s" = "exec kitty --class spt spotify_player";
        "Mod4+Shift+r" = "swaymsg reload";
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
        "XF86AudioRaiseVolume" =
          "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" =
          "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86MonBrightnessUp" = "exec brightnessctl set +5%";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
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
        "1" = [
          { app_id = "zen-alpha"; } # Native Wayland
          { class = "zen"; } # XWayland fallback
        ];
        "2" = [
          { app_id = "org.wezfurlong.wezterm"; }
          { app_id = "kitty"; }
          { app_id = "com.mitchellh.ghostty"; }
          { class = "kitty"; } # Fallback for XWayland
        ];
        "3" = [
          { app_id = "spotify-qt"; }
          { app_id = "spt"; }
          { class = "Spotify"; } # XWayland Spotify
        ];
        "4" = [
          { app_id = "vesktop"; }
          { class = "vesktop"; }
          { class = "discord"; }
        ];
        "6" = [{ class = "PrismLauncher"; }];
      };
      window = {
        border = 0;
        commands = [{
          criteria = { title = "^Picture-in-Picture$"; };
          command = "floating enable, sticky enable";
        }];
        titlebar = false;
      };
      floating = {
        titlebar = false;
        modifier = "Mod4";
        border = 0;
      };
      defaultWorkspace = "workspace number 1";
    };

  };
}
