{
    config, 
    pkgs, 
    ...
}: 
{
  xdg.configFile."i3".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/i3";
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/nvim";
  xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/rofi";
    #Prefer to use tmux but no harm in having zellij ready, maybe I'll change that.
  xdg.configFile."zellij".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/zellij";

}
