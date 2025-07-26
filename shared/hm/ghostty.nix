{ config, pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      # font-family = "JetBrainsMono Nerd Font";
      # font-size = 13;
      gtk-titlebar = false;
      alpha-blending = "native";
      window-padding-x = 10;
      window-padding-y = 5;
      window-decoration = "client";
      window-colorspace = "display-p3";
      gtk-single-instance = true;

    };
  };
}
