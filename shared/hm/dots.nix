{
    config, 
    pkgs, 
    ...
}: 
{
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/nvim";
  xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/rofi";
    #Prefer to use tmux but no harm in having zellij ready, will probably move it to hm.
  xdg.configFile."zellij".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/zellij";

}
