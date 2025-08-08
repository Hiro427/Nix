{ pkgs, config, ... }:

{
  base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark-dark.yaml";
  vividTheme = "one-dark";
  helixTheme = "onedarker";
  i3statusTheme = "${config.home.homeDirectory}/Nix/dots/assets/onedark.toml";
  i3Colors = {
    background = "#000000"; # base00

    inactiveWorkspace = {
      background = "#000000"; # base01
      border = "#000000"; # base01
      text = "#565c64"; # base04
    };

    focusedWorkspace = {
      background = "#C0C0C0"; # base0A
      border = "#C0C0C0"; # base0A
      text = "#2c313a"; # base02
    };

    urgentWorkspace = {
      background = "#ef596f"; # base08
      border = "#ef596f"; # base08
      text = "#000000"; # base00
    };
  };

  tmuxBarColors = {
    dotbar-fg = "#565c64"; # base04
    dotbar-bg = "#000000"; # base00
    dotbar-fg-current = "#61afef"; # base0D
    dotbar-fg-session = "#89ca78"; # base0B
    dotbar-fg-prefix = "#d55fde"; # base0E
  };
}
