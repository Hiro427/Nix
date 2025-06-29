{
    config, 
    pkgs,
    stylix,
    ...
}: 
{
    stylix = {
        enable = true;
        base16Scheme = "${pkgs."base16-schemes"}/share/themes/catppuccin-mocha.yaml";
        autoEnable = true;
        iconTheme = {
            enable = true;
            package = pkgs.papirus-icon-theme; # or your preferred icon theme package
            dark = "Papirus-Dark";
            light = "Papirus-Dark";
        };
        targets = {
            gtk.enable = true;
            rofi.enable = true;
            qt.enable = false;
            foliate.enable = true;
            # wezterm.enable = false;
        };
        fonts = {
              monospace = {
                package = pkgs.nerd-fonts.jetbrains-mono;
                name = "JetBrainsMono Nerd Font";
              };
              sansSerif = {
                package = pkgs.noto-fonts-cjk-sans;
                name = "Noto Sans";
              };
              serif = {
                package = pkgs.noto-fonts;
                name = "Noto Serif";
              };
              emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
              };
                sizes = {
                      desktop = 13;
                      applications = 13;
                      popups = 13;
                      terminal = 13;
                    };
            };

    };

}
