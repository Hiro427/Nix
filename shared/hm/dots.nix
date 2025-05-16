{
    config, 
    pkgs, 
    ...
}: 
{
  xdg.configFile."i3".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/i3";
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";
  xdg.configFile."picom".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/picom";
  xdg.configFile."dunst".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/dunst";
  xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/rofi";
  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/starship/starship.toml";
  xdg.configFile."helix".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/helix";
  xdg.configFile."zellij".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/zellij";
  xdg.configFile."spotify-id.txt".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/secrets/spotify-id.txt";



}
