{ pkgs, config, ... }: {
  base16Scheme = "${pkgs."base16-schemes"}/share/themes/tokyo-night-dark.yaml";
  helixTheme = "tokyonight";
  vividTheme = "tokyonight-night";
  i3statusTheme =
    "${config.home.homeDirectory}/Nix/dots/assets/tokyonight.toml";
  i3Colors = {
    background = "#1a1b26"; # base00
    inactiveWorkspace = {
      background = "#16161e"; # base01
      border = "#16161e"; # base01
      text = "#444a6a"; # base03
    };
    focusedWorkspace = {
      background = "#7dcfff"; # base0D
      border = "#b4f9f8"; # base0C
      text = "#1a1b26"; # base00
    };
    urgentWorkspace = {
      background = "#f7768e"; # base0F
      border = "#f7768e"; # base0F
      text = "#1a1b26"; # base00
    };
  };
  tmuxBarColors = {
    dotbar-fg = "#444a6a";
    dotbar-bg = "#1a1b26";
    dotbar-fg-current = "#c0caf5";
    dotbar-fg-session = "";
    dotbar-fg-prefix = "#7dcfff";
  };
}
