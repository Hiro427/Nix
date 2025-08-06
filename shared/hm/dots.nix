{ config, pkgs, ... }: {
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Nix/dots/nvim";
  xdg.configFile."zed".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Nix/dots/zed";
  # xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/rofi";
  #Prefer to use tmux but no harm in having zellij ready, will probably move it to hm.
  xdg.configFile."zellij".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Nix/dots/zellij";
  # xdg.configFile."wezterm/wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Nix/dots/wezterm/.wezterm.lua";
  xdg.configFile."gowall".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Nix/dots/gowall";

}
