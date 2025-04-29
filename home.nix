{ config, pkgs, catppuccin, ... }:
{
 # imports = [ catppuccin.homeManagerModules.catppuccin ];
  home.username = "jacobrambarran";
  home.homeDirectory = "/home/jacobrambarran";
  catppuccin.flavor = "mocha";
   programs.btop.enable = true;
  catppuccin.btop.enable = true; 
programs.ghostty = {
    enable = true;
    settings = {
          font-family = "JetBrainsMono Nerd Font";
          font-size = 13;
          gtk-titlebar = false;
          alpha-blending = "native";
          window-padding-x = 10; 
          window-padding-y = 5;
          window-decoration = "client";
          window-colorspace = "display-p3";

    };
    };
  catppuccin.ghostty.enable = true;
  programs.kitty = {
        enable = true; 
        font.name = "JetBrainsMono Nerd Font";
        font.size = 12; 
        extraConfig = ''
            window_padding_width 10
            cursor_shape_unfocused hollow
            confirm_os_window_close 0
        '';
    };
  catppuccin.kitty.enable = true;
  gtk = {
        enable = true;
    };
  catppuccin.gtk = {
        enable = true;
        accent = "lavender";
    };
  # qt = {
  #     enable = true;
  #     platformTheme.name = "gtk"; # or "qt5ct" if you use qt5ct
  #     style.name = "catppuccin-mocha"; # or "breeze-dark", "catppuccin-mocha", etc.
  #   };
  programs.cava.enable = true;
  catppuccin.cava.enable = true;
  programs.vesktop = {
        enable = true;
        vencord.settings = {
            autoUpdate = true;
            autoUpdateNotification = true;
            useQuickCss = true;
            themeLinks = [
                    "https://raw.githubusercontent.com/catppuccin/discord/refs/heads/main/themes/mocha.theme.css"
                ];
            
        };
    };



  programs.yazi = {
  enable = true;
  settings = {
  manager = {
      sort_by = "mtime";
      show_hidden = true;
    };
    open = {
      # Define commands
      edit = [
        "nvim \"$@\""
      ];
      feh = [
        "feh \"$@\""
      ];
      zathura = [
        "zathura \"$@\""
      ];
      mpv = [
        "vlc \"$@\""
      ];

      # Rules for file types
      rules = [
        {
          mime = "text/*";
          use = "edit";
        }
        {
          mime = "image/*";
          use = "feh";
        }
        {
          mime = "application/pdf";
          use = "zathura";
        }
        {
          mime = "video/*";
          use = "mpv";
        }
      ];
    };
  };
};
  catppuccin.yazi = {
        enable = true;
        accent = "lavender";
  };
  programs.bat.enable = true;
  catppuccin.bat.enable = true;

  programs.zathura.enable = true;
  catppuccin.zathura.enable = true;
  programs.zsh = {
        dotDir = ".config/zsh";
        enable = true;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        #   plugins = [
        #     {
        #       name = "mycustom";
        #       src = builtins.path { path = "/home/jacobrambarran/.dotfiles/zshrc"; };
        #     }
        # ];
          initContent = ''
            # Source my original config
              source "$HOME/.dotfiles/zshrc/PATH.zsh"
              source "$HOME/.dotfiles/zshrc/fzf-options.zsh"
              source "$HOME/.dotfiles/zshrc/aliases.zsh"
              source "$HOME/.dotfiles/zshrc/fn.zsh"
              source "$HOME/.dotfiles/zshrc/gum_settings.zsh"
          '';
        history = {
            append = true;
            share = true;
            save = 1000;
            size = 999;
            expireDuplicatesFirst = true;
            extended = true;
        };
    };
  catppuccin.zsh-syntax-highlighting.enable = true;
  programs.joplin-desktop = {
        enable = true;
        sync.target = "dropbox";
        sync.interval = "10m";
    };
  programs.spotify-player = {
        enable = true; 
        settings = {
            playback_window_position = "Top";
            playback_window_height = 60;

            enable_notify = false;
            

            client_id_command = {
                command = "cat";
                args = [
                    "${config.home.homeDirectory}/.sptid.txt"
                ];
            };
        };
        keymaps = [
            {
                command = "NextTrack";
                key_sequence = "g l";
            }
            {
                command = "PreviousTrack";
                key_sequence = "g h";
            }
        ];
    };
  catppuccin.spotify-player.enable = true;

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";

  xdg.configFile."picom".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/picom";
  xdg.configFile."dunst".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/dunst";
  xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/rofi";
  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/wezterm/starship.toml";






  



 

  home.stateVersion = "24.11";
}
    
