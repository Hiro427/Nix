{ config, pkgs, ... }:

let inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    theme = {
      configuration = {
        modi = "drun,window,run";
        show-icons = true;

        icon-theme = "Papirus"; # Change to your preferred icon theme
        drun-display-format = "{icon} {name}";
      };
      window = {
        border-radius = 8;
        width = 450;
      };
      prompt = { enabled = false; };

      inputbar = {
        padding = mkLiteral "12px";
        spacing = mkLiteral "12px";
      };
      "icon-search" = {
        expand = false;
        filename = "search";
        padding = mkLiteral "12px";
        spacing = mkLiteral "12px";
      };
      textbox = { padding = mkLiteral "8px 24px"; };

      entry = {
        # placeholder = " Launch";
        height = mkLiteral "30px";
        padding = mkLiteral "12px";
        spacing = mkLiteral "12px";
      };

      listview = {
        columns = 1;
        lines = 3; # Number of rows visible at once
        spacing = mkLiteral "2px";
        cycle = false;
        dynamic = false;
      };
      element = {
        padding = mkLiteral "0px";
        margin = mkLiteral "0px";
        spacing = mkLiteral "0px";
      };

      "element-icon" = {
        size = 64; # Medium size icons
        horizontal-align = mkLiteral "0.5";
        vertical-align = mkLiteral "0.5";
      };

      "element-text" = {
        horizontal-align = mkLiteral "0.5";
        vertical-align = mkLiteral "0.5";
      };
    };
  };
}
