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
          command = "sh ~/Nix/dots/scripts/wm/sway/natscroll.sh";
          always = true;
        }
        { command = "autotiling"; }
        { command = "waybar"; }
      ];
      input = { "type:keyboard" = { xkb_options = "caps:escape"; }; };
      keybindings = {
        #Applications
        "Mod4+Return" = "exec ghostty, workspace 2";
        "Mod4+f" = "exec nautilus";
        "Mod4+b" = "exec zen-beta, workspace 1";
        "Ctrl+space" = "exec flameshot gui";
        # "Mod4+s" = "exec kitty --class spt spotify_player, workspace 3";
        "Mod4+s" = "exec spotify, workspace 3";
        "Mod4+d" = "exec vesktop, workspace 4";
        "Mod4+w" = "exec i3-msg kill";
        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";
        "Mod4+p" = "exec sh ~/Nix/dots/scripts/wm/shared/rofi-power-menu.sh";
        "Mod4+Shift+h" = "move left";
        "Mod4+Shift+j" = "move down";
        "Mod4+Shift+k" = "move up";
        "Mod4+Shift+l" = "move right";
        "Mod4+Shift+f" = "fullscreen toggle";
        "Mod4+Shift+space" = "floating toggle";
        "Mod4+Shift+b" = "bar mode toggle";
        "Mod4+a" = "focus parent";
        "Mod4+minus" = "move scratchpad";
        "Mod4+Shift+minus" = "scratchpad show";
        # "Mod4+space" = "exec vicinae toggle";
        "Mod4+space" = "exec rofi -show drun";
        "Mod4+Shift+r" = "exec swaymsg reload";
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
        "Mod4+Shift+6" = "move container to workspace number 6";
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
          j = "resize grow height 10 px or 10 ppt";
          Escape = "mode default";
          h = "resize shrink width 10 px or 10 ppt";
          Return = "mode default";
          l = "resize grow width 10 px or 10 ppt";
          k = "resize shrink height 10 px or 10 ppt";
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
          { app_id = "zen-beta"; } # Native Wayland
          { class = "zen"; } # XWayland fallback
        ];
        "2" = [
          { app_id = "org.wezfurlong.wezterm"; }
          { app_id = "kitty"; }
          { app_id = "foot"; }
          { app_id = "com.mitchellh.ghostty"; }
          { class = "org.wezfurlong.wezterm"; } # Fallback for XWayland
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
        # "5" = [ { app_id = "mpv"; } { class = "mpv"; } ];
        "5" = [ { app_id = "steam"; } { class = "steam"; } ];
      };
      window = {
        border = 0;
        commands = [
          {
            criteria = {
              title = "Picture-in-Picture";
              app_id = "zen-beta";
            };
            command = "floating enable, sticky enable";
          }
          {
            criteria = { app_id = "mpv"; };
            command = "floating enable, sticky enable, resize set 420 250";
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

      bars = [{ command = "swaybar_command none"; }];
    };
    extraConfig = ''
      # Swipe left: move to next workspace
      bindgesture swipe:left workspace next
      # Swipe right: move to previous workspace
      bindgesture swipe:right workspace prev
    '';

  };
}
