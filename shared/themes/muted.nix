{ pkgs, config, ... }:

{

  base16Scheme = {
    base00 = "#121212"; # background
    base01 = "#1c1b1b";
    base02 = "#2e2d2d";
    base03 = "#4a4848";
    base04 = "#636161";
    base05 = "#898585";
    base06 = "#b7b2b2";
    base07 = "#ffffff"; # white
    base08 = "#c48786"; # red
    base09 = "#bd8b51"; # orange
    base0A = "#e8ebb0"; # yello
    base0B = "#9dd1a4"; # green
    base0C = "#7dc7b8"; # cyan
    base0D = "#86aac4"; # blue
    base0E = "#e4c3fa"; # magenta
    base0F = "#8c705b"; # unknown*
  };
  vividTheme = "muted";
  helixTheme = "muted";
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
    dotbar-bg = "#121212";
    dotbar-fg-current = "#dde1e6";
    dotbar-fg-session = "";
    dotbar-fg-prefix = "#85aac4";

  };
}
