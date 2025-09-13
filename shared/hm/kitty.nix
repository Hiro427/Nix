{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    # font.name = "JetBrainsMono Nerd Font";
    # font.size = 12;
    extraConfig = ''
      window_padding_width 10
      cursor_shape_unfocused hollow
      confirm_os_window_close 0 
      cursor_trail 3 
      dynamic_background_opacity yes 
      background_opacity 0.7
    '';
    # text_composition_strategy 0.09 5
  };

}
