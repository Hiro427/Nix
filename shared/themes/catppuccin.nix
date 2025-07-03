{ pkgs, ... }:

{

  base16Scheme = "${pkgs."base16-schemes"}/share/themes/catppuccin-mocha.yaml";
  vividTheme = "catppuccin-mocha";
  tmuxStatusLine = "#b4befe";
  i3statusTheme = "ctp-mocha";
  i3Colors = {
    background = "#313244";
    inactiveWorkspace = {
      background = "#11111b";
      border = "#11111b";
      text = "#313244";
    };
    focusedWorkspace = {
      background = "#a6adc8";
      border = "#cdd6f4";
      text = "#11111b";
    };
    urgentWorkspace = {
      background = "#f7768e";
      border = "#f7768e";
      text = "#1a1b26";
    };
  };
}
