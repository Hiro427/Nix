{ pkgs, ... }:

{
  base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
  vividTheme = "nord";
  i3statusTheme = "nord-dark";
  tmuxStatusLine = "#81a1c1";
  i3Colors = {
    background = "#2e3440";
    inactiveWorkspace = {
      background = "#2e3440";
      border = "#4c566a";
      text = "#eceff4";
    };
    focusedWorkspace = {
      background = "#eceff4";
      border = "#4c566a";
      text = "#2e3440";
    };
    urgentWorkspace = {
      background = "#bf616a";
      border = "#bf616a";
      text = "#eceff4";
    };
  };
}
