{ pkgs, config, ... }: {
  base16Scheme =
    "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
  helixTheme = "everforest_dark";
  tmuxStatusLine = "#7fbb3b"; # base0D
  vividTheme = "${config.home.homeDirectory}/Nix/dots/assets/everforest.yml";
  i3statusTheme =
    "${config.home.homeDirectory}/Nix/dots/assets/everforest.toml";

  i3Colors = {
    background = "#272e33"; # base00
    inactiveWorkspace = {
      background = "#2e383c"; # base01
      border = "#2e383c"; # base01
      text = "#859289"; # base03
    };
    focusedWorkspace = {
      background = "#7fbbb3"; # base0D
      border = "#83c092"; # base0C
      text = "#272e33"; # base00
    };
    urgentWorkspace = {
      background = "#9da9a0"; # base0F
      border = "#9da9a0"; # base0F
      text = "#272e33"; # base00
    };
  };

  tmuxBarColors = {
    dotbar-fg = "#859289"; # base03
    dotbar-bg = "#272e33"; # base00
    dotbar-fg-current = "#dbbc7f"; # base09 (using yellow for emphasis)
    dotbar-fg-session = ""; # This was empty in your original
    dotbar-fg-prefix = "#7fbbb3"; # base0D
  };
}
