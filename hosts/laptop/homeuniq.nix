{ config, pkgs, ... }:


{
    xdg.configFile."i3".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/i3-laptop";

}
