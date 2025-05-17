{
    config, 
    pkgs, 
    ...
}: 
{
  xdg.configFile."i3".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/i3";
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/nvim";
  xdg.configFile."picom".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/picom";
  xdg.configFile."dunst".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/dunst";
  xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/rofi";
  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/starship/starship.toml";
  xdg.configFile."helix".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/helix";
  xdg.configFile."zellij".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/zellij";
  xdg.configFile."spotify-id.txt".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/secrets/spotify-id.txt";



}
