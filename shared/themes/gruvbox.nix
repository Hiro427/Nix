{ pkgs, ... }:

{
  base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
  helixTheme = "gruvbox";
  vividTheme = "gruvbox-dark";
  i3statusTheme = "gruvbox-dark";
  i3Colors = {
    background = "#282828";
    inactiveWorkspace = {
      background = "#1d2021";
      border = "#1d2021";
      text = "#504945";
    };
    focusedWorkspace = {
      background = "#ebdbb2";
      border = "#d5c4a1";
      text = "#11111b";
    };
    urgentWorkspace = {
      background = "#fb4934";
      border = "#fb4934";
      text = "#282828";
    };
  };
  swaycolors = {
    uborder = "#1d2021";
    border = "#d5c4a1";
    fg = "#504945";
    bg = "#282828";
  };
  tmuxBarColors = {
    dotbar-fg = "#504945";
    dotbar-bg = "#282828";
    dotbar-fg-current = "#ebdbb2";
    dotbar-fg-session = "#d5c4a1";
    dotbar-fg-prefix = "#83a598";

  };
}
