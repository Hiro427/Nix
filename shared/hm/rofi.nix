{ config, pkgs, lib, ... }:

let inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    theme = {
      configuration = {
        modi = "drun,window,run";
        show-icons = true;
        icon-theme = "${pkgs.papirus-icon-theme}";
        # icon-theme = "Papirus"; # Change to your preferred icon theme
        drun-display-format = "{icon} {name}";

      };
      window = {
        width = 400;
        height = 500;
        # border = mkLiteral "2px";
        # border-color = mkLiteral "var(blue)";
      };
      inputbar = { padding = mkLiteral "5px"; };
      prompt = { enabled = false; };
      "element-icon" = { padding = mkLiteral "5px"; };
      "element" = { background-color = mkLiteral "inherit"; };
      "element alternate" = { background-color = mkLiteral "inherit"; };
      "element.alternate.normal" = {
        background-color = mkLiteral "var(normal-background)";
      };

    };
  };
}
