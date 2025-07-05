{ pkgs, config, ... }:

{

  base16Scheme = "${pkgs."base16-schemes"}/share/themes/rose-pine.yaml";
  vividTheme = "rose-pine";
  tmuxStatusLine = "#c4a7e7";
  i3statusTheme ="${config.home.homeDirectory}/Nix/dots/assets/rosepine.toml" ;
  i3Colors = {
      background = "#191724"; # base
      inactiveWorkspace = {
        background = "#1f1d2e"; # surface
        border     = "#1f1d2e"; # surface
        text       = "#6e6a86"; # muted
      };
      focusedWorkspace = {
        background = "#31748f"; # pine
        border     = "#9ccfd8"; # foam
        text       = "#e0def4"; # text
      };
      urgentWorkspace = {
        background = "#eb6f92"; # love
        border     = "#eb6f92"; # love
        text       = "#191724"; # base
      };
  };
}
