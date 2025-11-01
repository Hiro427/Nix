{ config, pkgs, catppuccin, ... }:
let
  theme = import ./themes/gruvbox.nix {
    inherit pkgs;
    inherit config;
  };
in {
  _module.args.theme = theme;

  home.username = "jacobrambarran";
  home.homeDirectory = "/home/jacobrambarran";
  home.sessionVariables = {
    GOPATH = "$HOME/.go";
    GPUI_X11_SCALING_FACTOR = "1";
  };

  # home.sessionPath = [
  #   "$HOME/.nimble/bin"
  #   "$HOME/.cargo/bin"
  #   "$HOME/.local/bin"
  #   "$HOME/.go/bin"
  # ];
  home.packages = [
    (pkgs.writeShellScriptBin "gm" (builtins.readFile ../dots/scripts/gm))
    (pkgs.writeShellScriptBin "rw" (builtins.readFile ../dots/scripts/rw))
    (pkgs.writeShellScriptBin "git_i3bar"
      (builtins.readFile ../dots/scripts/git_i3bar))

    (pkgs.writeShellScriptBin "run" (builtins.readFile ../dots/scripts/run))
    (pkgs.writeShellScriptBin "tsm" (builtins.readFile ../dots/scripts/tsm))
    (pkgs.writeShellScriptBin "sel_audio"
      (builtins.readFile ../dots/scripts/sel_audio))

    (pkgs.writeShellScriptBin "doom" ''
      #!/bin/sh
      # Execute the actual Doom Emacs binary
      exec "$HOME/.config/emacs/bin/doom" "$@"
    '')
  ];
  imports = [
    ./hm/freetube.nix
    ./hm/zsh.nix
    ./hm/spotify_player.nix
    # ./hm/zed.nix
    ./hm/brave.nix
    ./hm/ghostty.nix
    ./hm/wezterm.nix
    ./hm/kitty.nix
    ./hm/gtk.nix
    ./hm/i3.nix
    ./hm/vesktop.nix
    ./hm/yazi.nix
    ./hm/helix.nix
    ./hm/picom.nix
    ./hm/extras.nix
    ./hm/cpt.nix
    ./hm/tm.nix
    ./hm/vim.nix
    ./hm/dots.nix
    ./hm/dunst.nix
    ./hm/starship.nix
    ./hm/stylix.nix
    ./hm/spicetify.nix
    ./hm/i3status.nix
    ./hm/rofi.nix
    ./hm/direnv.nix
    ./hm/sway.nix
    ./hm/waybar.nix
  ];
  programs.zed-editor.enable = true;

  programs.ncspot.enable = true;
  programs.lapce = { enable = true; };
  qt.enable = true;
  programs.qutebrowser.enable = true;
  programs.qutebrowser = {
    extraConfig = ''
      c.tabs.show = "never"
      c.statusbar.show = "in-mode" 
      c.scrolling.smooth = True  
      c.url.searchengines = {"DEFAULT": "https://google.com/search?q={}"}
      c.url.start_pages = "https://search.google.com"
      c.window.transparent = True
      c.colors.webpage.darkmode.enabled = True
    '';
  };
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
      };
    };

  };

  programs.mullvad-vpn = { enable = true; };

  programs.fuzzel.enable = true;
  programs.micro.enable = true;

  services.vicinae = {
    enable = true; # default: true
    autoStart = true; # default: true
    # settings = {
    #   font.size = 12;
    #   theme.name = "github_dark_high_contrast";
    # };
  };

  # home.file = {
  #     ".wezterm.lua" = {
  #         source = ../dots/wezterm/.wezterm.lua;
  #     };
  # };

  home.stateVersion = "24.11";
}
