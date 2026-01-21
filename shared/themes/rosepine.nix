{ pkgs, config, ... }:

{

  base16Scheme = "${pkgs."base16-schemes"}/share/themes/rose-pine.yaml";
  vividTheme = "rose-pine";
  helixTheme = "rose_pine";
  i3statusTheme = "${config.home.homeDirectory}/Nix/dots/assets/rosepine.toml";
  i3Colors = {
    background = "#191724";
    inactiveWorkspace = {
      background = "#1f1d2e";
      border = "#1f1d2e";
      text = "#6e6a86";
    };
    focusedWorkspace = {
      background = "#ebbcba";
      border = "#ebbcba";
      text = "#26233a";
    };
    urgentWorkspace = {
      background = "#eb6f92";
      border = "#eb6f92";
      text = "#191724";
    };
  };

  swaycolors = {
    uborder = "#6e6a86";
    border = "#31748f";
    bg = "#191724";
    fg = "#908caa";
  };
  tmuxBarColors = {
    dotbar-fg = "#6e6a86";
    dotbar-bg = "#191724";
    dotbar-fg-current = "#e0def4";
    dotbar-fg-session = "";
    dotbar-fg-prefix = "#9ccfd8";

  };
}
