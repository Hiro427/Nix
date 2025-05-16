{ config, pkgs, catppuccin, ... }:
{
 # imports = [ catppuccin.homeManagerModules.catppuccin ];
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
    ];

    # home.file = {
    #     ".config/helix" = {
    #         source = ./dots/helix;
    #     };
    # };
  xdg.configFile."i3".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/i3";
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";

  xdg.configFile."picom".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/picom";
  xdg.configFile."dunst".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/dunst";
  xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/rofi";
  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/starship/starship.toml";
  xdg.configFile."helix".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/helix";
  xdg.configFile."zellij".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/zellij";
  xdg.configFile."spotify-id.txt".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/secrets/spotify-id.txt";



  home.stateVersion = "24.11";
}
