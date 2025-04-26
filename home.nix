{ config, pkgs, ... }:

{
  home.username = "jacobrambarran";
  home.homeDirectory = "/home/jacobrambarran";

  programs.btop = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
    };
  };

  home.stateVersion = "24.11"; # Set this to your current NixOS version
}

