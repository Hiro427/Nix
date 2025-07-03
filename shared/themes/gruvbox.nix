{ pkgs, ... }:

{
  base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
  vividTheme = "gruvbox-dark";
  i3statusTheme = "gruvbox-dark";
  tmuxStatusLine = "#ebdbb2";
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
}
