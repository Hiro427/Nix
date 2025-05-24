{ config, pkgs, catppuccin, ... }:
{
  home.username = "jacobrambarran";
  home.homeDirectory = "/home/jacobrambarran";
  home.sessionVariables = {
  GOPATH = "$HOME/.go";
 };

home.sessionPath = [
  "$HOME/.nimble/bin"
  "$HOME/.cargo/bin"
  "$HOME/.local/bin"
  "$HOME/.go/bin"
];
home.packages = [
    (pkgs.writeShellScriptBin "gm" (builtins.readFile ../dots/scripts/gm))
    (pkgs.writeShellScriptBin "rw" (builtins.readFile ../dots/scripts/rw))
    (pkgs.writeShellScriptBin "run" (builtins.readFile ../dots/scripts/run))
  ];
imports = [
        ./hm/freetube.nix
        ./hm/zsh.nix
        ./hm/spotify_player.nix
        ./hm/zed.nix
        ./hm/brave.nix
        ./hm/ghostty.nix
        ./hm/kitty.nix
        ./hm/gtk.nix
        ./hm/vesktop.nix
        ./hm/yazi.nix
        ./hm/helix.nix
        ./hm/picom.nix
        ./hm/extras.nix
        ./hm/cpt.nix
        ./hm/tm.nix
        ./hm/dots.nix
        ./hm/dunst.nix
        ./hm/starship.nix
    ];

    home.file = {
        ".wezterm.lua" = {
            source = ../dots/wezterm/wezterm.lua;
        };
    };

  home.stateVersion = "24.11";
}
