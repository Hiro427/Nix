{ config, pkgs, catppuccin, ... }:
let
  theme = import ./themes/onedark.nix {
    inherit pkgs;
    inherit config;
  };
in {
  _module.args.theme = theme;

  home.username = "jacobrambarran";
  home.homeDirectory = "/home/jacobrambarran";
  home.sessionVariables = { GOPATH = "$HOME/.go"; };

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
    (pkgs.writeShellScriptBin "tsm" (builtins.readFile ../dots/scripts/tsm))

    (pkgs.writeShellScriptBin "doom" ''
      #!/bin/sh
      # Execute the actual Doom Emacs binary
      exec "$HOME/.config/emacs/bin/doom" "$@"
    '')
  ];
  imports = [
    ./hm/freetube.nix
    ./hm/zsh.nix
    ./hm/spotify_player.nix
    # ./hm/zed.nix
    ./hm/brave.nix
    ./hm/ghostty.nix
    ./hm/wezterm.nix
    ./hm/kitty.nix
    ./hm/gtk.nix
    ./hm/i3.nix
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
    ./hm/stylix.nix
    ./hm/spicetify.nix
    ./hm/i3status.nix
  ];
  # programs.qutebrowser.enable = true;
  # catppuccin.qutebrowser.enable = true;
  # catppuccin.qutebrowser.flavor = "mocha";
  programs.zed-editor.enable = true;
  programs.rofi.enable = true;

  # home.file = {
  #     ".wezterm.lua" = {
  #         source = ../dots/wezterm/.wezterm.lua;
  #     };
  # };

  home.stateVersion = "24.11";
}
