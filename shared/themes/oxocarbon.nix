{ pkgs, config, ... }:

{

  base16Scheme = "${pkgs."base16-schemes"}/share/themes/oxocarbon-dark.yaml";
  vividTheme = "one-dark";
  helixTheme = "carbon";
  i3statusTheme = "${config.home.homeDirectory}/Nix/dots/assets/rosepine.toml";
  i3Colors = {
    background = "#191724"; # base
    inactiveWorkspace = {
      background = "#1f1d2e"; # surface
      border = "#1f1d2e"; # surface
      text = "#6e6a86"; # muted
    };
    focusedWorkspace = {
      background = "#ebbcba"; # pine
      border = "#ebbcba"; # foam
      text = "#26233a"; # text
    };
    urgentWorkspace = {
      background = "#eb6f92"; # love
      border = "#eb6f92"; # love
      text = "#191724"; # base
    };
  };
  tmuxBarColors = {
    dotbar-fg = "#ffffff";
    dotbar-bg = "#161616";
    dotbar-fg-current = "#dde1e6";
    dotbar-fg-session = "";
    dotbar-fg-prefix = "#82cfff";

  };
}
