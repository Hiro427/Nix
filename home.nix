{ config, pkgs, catppuccin, ... }:
{
 # imports = [ catppuccin.homeManagerModules.catppuccin ];
  home.username = "jacobrambarran";
  home.homeDirectory = "/home/jacobrambarran";
  catppuccin.flavor = "mocha";
   programs.btop.enable = true;
  catppuccin.btop.enable = true;
  programs.lazygit.enable = true;
  catppuccin.lazygit.enable = true;
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
            text_composition_strategy 0.09 5
        '';
    };
  catppuccin.kitty.enable = true;
    # gtk = {
  #       enable = true;
  #       # theme = {
  #       #     name = "Catppuccin";
  #       #     package = pkgs.colloid-gtk-theme;
  #       # };
  #   };
  gtk.enable = true;
  catppuccin.gtk = {
        enable = true;
        accent = "lavender";
    };
  # qt = {
  #     enable = true;
  #     # platformTheme.name = "gtk"; # or "qt5ct" if you use qt5ct
  #     style.name = "breeze-dark"; # or "breeze-dark", "catppuccin-mocha", etc.
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

  programs.zed-editor = {

        enable = true;
        extensions = [
        "catppuccin"
        "nix"
        "toml"
        "zig"
        "java"
        "dockerfile"
        "sql"
        "make"
        "ruby"
        "lua"
        "xml"
        "docker compose"
        "catppuccin icons"
        "csv"
        "ruff"
        "rainbow csv"
        "python lsp"
        "env"
        "templ"
        "meson"
        "golangci-lint"
        "discord presence"
        "air"
        
        ];
        userSettings = {
            features = {
                copilot = false;
            };
            telemetry = {
                metrics = false;
                diagnostics = false;
            };
            vim_mode = true;
            icon_theme = "Catppuccin Mocha";
            ui_font_size = 16;
            buffer_font_size = 16;
            theme = {
                mode = "dark";
                light = "Catppuccin Latte";
                dark = "Catppuccin Mocha";
            };
            use_auto_surround = true;
            autosave = "on_focus_change";
            confim_quit = true;
            scrollbar = {
                show = "never";
            };
            show_completion_documentation = true;
            tab_bar = {
                show = true;
            };
            format_on_save = "on";
            formatter = "language_server";
            inlay_hints = {
                enabled = false;
                show_parameter_hints = false;
            };
            file_finder = {
                modal_max_width = "large";
            };
            remove_trailing_whitespace_on_save = true;
            show_edit_predictions = false;
            show_completion_on_input = true;
        };
        userKeymaps = [
            {
                context = "Editor && vim_mode == normal && vim_operator == none && !VimWaiting";
                bindings = {
                    "space space" = "file_finder::Toggle";
                    "space t" = [
                        "workspace::OpenTerminal"
                        {
                            working_directory = ".";
                        }
                    ];
                    "space a" = "workspace::AddFolderToProject";
                    "space e" = "workspace::ToggleLeftDock";
                    "space o" = "workspace::OpenFiles";
                    "/" = "workspace::NewSearch";
                    ctrl-shift-k = "pane::SplitLeft";
                    ctrl-shift-j = "pane::SplitDown";
                    "space l" = "pane::TogglePreviewTab";
                    ctrl-e = "project_panel::ToggleFocus";
                    "space w" = "terminal_panel::ToggleFocus";
                };
            }
            {
                context = "vim_mode == insert";
                bindings = {
                     tab = "editor::MoveRight";
                     shift-tab = "editor::Tab";
                };
            }
        ];

    };

    programs.helix = {
      enable = true;
      package  = pkgs.evil-helix;
      settings = {
        theme = "catppuccin_mocha";
        editor = {
          line-number = "relative";
          true-color = true;
          preview-completion-insert = true;
          completion-trigger-len = 1;
          auto-format = true;
          end-of-line-diagnostics = "hint";
        };
        editor.cursor-shape = {
          insert = "bar";
        };
        editor.inline-diagnostics = {
          cursor-line = "error";
        };
        editor.lsp = {
          enable = true;
          display-messages = true;
        };
        editor.statusline = {
         left = ["mode" "spacer" "version-control"];
         center = [];
         right = ["file-base-name" "spinner" "spacer" "workspace-diagnostics" "spacer" "position" "file-modification-indicator"];
         separator = "│";
        };
      };
      extraPackages = [
        pkgs.zls
        pkgs.zig
        pkgs.gopls
        pkgs.bash-language-server
        pkgs.golangci-lint
        pkgs.golangci-lint-langserver
        pkgs.typescript-language-server
        pkgs.mesonlsp
        pkgs.lua-language-server
        pkgs.ruff
        pkgs.nil
        pkgs.cmake
        pkgs.cmake-language-server
        pkgs.bash-language-server
        pkgs.vscode-langservers-extracted
        pkgs.llvmPackages_19.clang-tools
      ];

    };

    programs.chromium = {
        enable = true;
        package = pkgs.brave; 
        extensions = [
            {
                id = "kekjfbackdeiabghhcdklcdoekaanoel"; #Mal-Sync
            }
            {
                id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; #Ublock Origin
            }
            {
                id = "nngceckbapebfimnlniiiahkandclblb"; #bitwarden
            }
            # {
            #     id = "dbfoemgnkgieejfkaddieamagdfepnff"; #2fas
            #
            # }
            {
                id = "clngdbkpkpeebahjckkjfobafhncgmne"; #Stylus
            }
            {
                id = "dbepggeogbaibhgnhhndojpepiihcmeb"; #Vimium
            }
            {
                id = "fdaphilojaklgkoocegabckfanjoacjg"; #mtab
            }
            {
                id = "ghkdkllgoehcklnpajjjmfoaokabfdfm"; #remove paywall
            }
            {
                id = "ponfpcnoihfmfllpaingbgckeeldkhle"; #youtube enhancer
            }
            {
                id = "lnjaiaapbakfhlbjenjkhffcdpoompki"; #catppuccin icons
            }
            {
                id = "hkgfoiooedgoejojocmhlaklaeopbecg";
            }
        ];
    };

   catppuccin.chromium.enable = true;
    programs.freetube = {
        enable = true;
    };
    catppuccin.freetube = {
        enable = true;
        accent = "lavender";
        secondaryAccent = "blue";
    };

    programs.zellij = {
        enable = true; 
        settings = {
            theme = "catppuccin-mocha";
        };
    };
  services.fusuma = {
        enable = true; 
        settings = {
          threshold = {
            swipe = 0.1;
          };
          interval = {
            swipe = 0.7;
          };
          swipe = {
            "3" = {
              left = {
                # GNOME: Switch to left workspace
                command = "xdotool key ctrl+alt+Right";
              };
            };
          };
        };
    };


  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";

  xdg.configFile."picom".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/picom";
  xdg.configFile."dunst".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/dunst";
  xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/rofi";
  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/wezterm/starship.toml";












  home.stateVersion = "24.11";
}
