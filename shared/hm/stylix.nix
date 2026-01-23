{ config, pkgs, stylix, theme, ... }: {
  stylix = {
    enable = true;
    overlays.enable = false;
    # base16Scheme = "${pkgs."base16-schemes"}/share/themes/catppuccin-mocha.yaml";
    base16Scheme = theme.base16Scheme;
    autoEnable = true;
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Dark";
    };
    targets = {
      gtk.enable = true;
      rofi.enable = true;
      qt.enable = true;
      foliate.enable = true;
      helix.enable = false;
      zed.enable = false;
      sway.enable = false;
      vicinae.enable = true;
      # foot.enable = false;
      # waybar.enable = false;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        # package = pkgs.noto-fonts-cjk-sans;
        # name = "Noto Sans";
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      serif = {
        # package = pkgs.noto-fonts;
        # name = "Noto Serif";
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        desktop = 12;
        applications = 12;
        popups = 12;
        terminal = 12;
      };
    };

  };

}
