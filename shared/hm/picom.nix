{ config, pkgs, ... }: {
  services.picom = {
    enable = true;
    # fadeDelta = 4;
    # fade = true;
    # fadeSteps = [ 2.8e-2 3.0e-2 ];
    inactiveOpacity = 0.9;
    activeOpacity = 1;
    backend = "glx";
    vSync = true;

    settings = {
      # corner-radius = 8;
      blur = { method = "dual_kawase"; };
      glx-use-copybuffer-mess = true;
      glx-copy-from-front = true;
      glx-swap-method = 2;
      xrender-sync = true;
      xrender-sync-fence = true;
      rounded-corners-exclude =
        [ "class_g = 'i3bar'" "class_g = 'dmenu'" "class_g = 'bemenu'" ];
    };
    opacityRules = [
      "100:class_g = 'Rofi'"
      "100:class_g = 'Dunst'"
      "100:class_g = 'dmenu'"
      "100:class_g = 'bemenu'"
    ];
    # extraConfig = ''
    #   animations = ({
    #       triggers = ["close", "hide"];
    #       opacity = {
    #           curve = "linear";
    #           duration = 0.15;
    #           start = "window-raw-opacity-before";
    #           end = "window-raw-opacity";
    #       };
    #       blur-opacity = "0";
    #       shadow-opacity = "opacity";
    #       offset-x = "(1 - scale-x) / 2 * window-width";
    #       offset-y = "(1 - scale-y) / 2 * window-height * 5";
    #       scale-x = {
    #           curve = "cubic-bezier(0.21, 0.02, 0.76, 0.36)";
    #           duration = 0.15;
    #           start = 1;
    #           end = 0.9;
    #       };
    #       scale-y = "scale-x";
    #       shadow-scale-x = "scale-x";
    #       shadow-scale-y = "scale-y";
    #       shadow-offset-x = "offset-x";
    #       shadow-offset-y = "offset-y";
    #   }, {
    #       triggers = ["open", "show"];
    #       opacity = {
    #           curve = "linear";
    #           duration = 0.15;
    #           start = "window-raw-opacity-before";
    #           end = "window-raw-opacity";
    #       };
    #       blur-opacity = {
    #           curve = "linear";
    #           duration = 0.1;
    #           delay = 0.15;
    #           start = "window-raw-opacity-before";
    #           end = "window-raw-opacity";
    #       };
    #       shadow-opacity = "opacity";
    #       offset-x = "(1 - scale-x) / 2 * window-width";
    #       offset-y = "(1 - scale-y) / 2 * window-height * 5";
    #       scale-x = {
    #           curve = "cubic-bezier(0.24, 0.64, 0.79, 0.98)";
    #           duration = 0.15;
    #           start = 0.95;
    #           end = 1;
    #       };
    #       scale-y = "scale-x";
    #       shadow-scale-x = "scale-x";
    #       shadow-scale-y = "scale-y";
    #       shadow-offset-x = "offset-x";
    #       shadow-offset-y = "offset-y";
    #   },

    #   # Half Window Size Desktop Switch
    #   {
    #       triggers = ["workspace-out"];
    #       offset-y = {
    #           curve = "cubic-bezier(0.21, 0.02, 0.76, 0.36)";
    #           duration = 0.15;
    #           start = "0";
    #           end = "- window-height / 2";
    #       };
    #       shadow-offset-y = "offset-y";
    #       opacity = {
    #           curve = "linear";
    #           duration = 0.15;
    #           start = "window-raw-opacity-before";
    #           end = "window-raw-opacity";
    #       };
    #       blur-opacity = "0";
    #       shadow-opacity = "opacity";
    #   }, {
    #       triggers = ["workspace-out-inverse"];
    #       offset-y = {
    #           curve = "cubic-bezier(0.21, 0.02, 0.76, 0.36)";
    #           duration = 0.15;
    #           start = "0";
    #           end = "window-height / 2";
    #       };
    #       shadow-offset-y = "offset-y";
    #       opacity = {
    #           curve = "linear";
    #           duration = 0.15;
    #           start = "window-raw-opacity-before";
    #           end = "window-raw-opacity";
    #       };
    #       blur-opacity = "0";
    #       shadow-opacity = "opacity";
    #   }, {
    #       triggers = ["workspace-in"];
    #       offset-y = {
    #           curve = "cubic-bezier(0.24, 0.64, 0.79, 0.98)";
    #           duration = 0.15;
    #           start = "window-height / 2";
    #           end = "0";
    #       };
    #       shadow-offset-y = "offset-y";
    #       opacity = {
    #           curve = "linear";
    #           duration = 0.15;
    #           start = "0";
    #           end = "window-raw-opacity";
    #       };
    #       blur-opacity = {
    #           curve = "linear";
    #           duration = 0.1;
    #           delay = 0.15;
    #           start = "0";
    #           end = "window-raw-opacity";
    #       };
    #       shadow-opacity = "opacity";
    #   }, {
    #       triggers = ["workspace-in-inverse"];
    #       offset-y = {
    #           curve = "cubic-bezier(0.24, 0.64, 0.79, 0.98)";
    #           duration = 0.15;
    #           start = "- window-height / 2";
    #           end = "0";
    #       };
    #       shadow-offset-y = "offset-y";
    #       opacity = {
    #           curve = "linear";
    #           duration = 0.15;
    #           start = "0";
    #           end = "window-raw-opacity";
    #       };
    #       blur-opacity = {
    #           curve = "linear";
    #           duration = 0.1;
    #           delay = 0.15;
    #           start = "0";
    #           end = "window-raw-opacity";
    #       };
    #       shadow-opacity = "opacity";
    #   }, {
    #       triggers = [ "geometry" ];
    #       preset = "geometry-change";
    #   })

    # '';

  };
}
