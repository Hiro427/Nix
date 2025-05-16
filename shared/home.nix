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
        ./hm/extras.nix
        ./hm/cpt.nix
        ./hm/dots.nix
    ];

    # home.file = {
    #     ".config/helix" = {
    #         source = ./dots/helix;
    #     };
    # };

  home.stateVersion = "24.11";
}
