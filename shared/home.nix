{ config, pkgs, catppuccin, lib, ... }:
let
  theme = import ./themes/rosepine.nix {
    inherit pkgs;
    inherit config;
  };
in {
  _module.args.theme = theme;

  home.username = "jacobrambarran";
  home.homeDirectory = "/home/jacobrambarran";
  home.sessionVariables = {
    # HOME = "/home/jacobrambarran/";
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
    (pkgs.writeShellScriptBin "run" (builtins.readFile ../dots/scripts/run))
    (pkgs.writeShellScriptBin "tsm" (builtins.readFile ../dots/scripts/tsm))
    (pkgs.writeShellScriptBin "sel_audio"
      (builtins.readFile ../dots/scripts/sel_audio))

    (pkgs.writeShellScriptBin "doom" ''
      #!/bin/sh
      # Execute the actual Doom Emacs binary
      exec "$HOME/.config/emacs/bin/doom" "$@"
    '')
    # (pkgs.appimageTools.wrapType2 {
    #   pname = "upnote";
    #   version = "2025.11";
    #   src = pkgs.fetchurl {
    #     url = "https://download.getupnote.com/app/UpNote.AppImage";
    #     sha256 = "sha256-P3EAh9+XFLzNvkAuSRhjc/X4/AbzPPLRyfvwOUtxwQ8=";
    #   };
    # })
  ];
  # xdg.desktopEntries.upnote = {
  #   name = "UpNote";
  #   genericName = "Note Taking App";
  #   exec = "upnote";
  #   icon = "${config.home.homeDirectory}/Nix/dots/assets/AppIcons/upnote.jpg";
  #   comment = "Beautiful note-taking app that syncs everywhere";
  #   categories = [ "Office" "Utility" ];
  #   terminal = false;
  # };

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
    ./hm/gnome.nix
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
      c.url.searchengines = {"DEFAULT": "https://search.brave.com/search?q={}"}
      c.url.start_pages = "https://search.brave.com"
      c.window.transparent = True
      c.colors.webpage.darkmode.enabled = True
      config.set(
        "content.user_stylesheets",
        ["~/Nix/dots/stylesheets/styles.css"],
      )

    '';
  };
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        useGrimAdapter = true;
        showDesktopNotification = false;
        showAbortNotification = false;
      };
    };

  };

  programs.mullvad-vpn = { enable = true; };

  programs.fuzzel.enable = true;
  programs.micro.enable = true;
  programs.alacritty.enable = true;
  # programs.neovide.enable = true;
  programs.foot = {
    enable = true;
    # settings.colors.alpha = lib.mkOverride 60 0.85;
    settings = {
      main = { pad = "10x10"; };
      cursor = {
        style = "beam";
        blink = "yes";
      };
    };
    # you can also override background alpha instead:
    # settings.colors.background = lib.mkOverride 60 "#1e1e2ecc";
  };
  programs.vicinae = {
    enable = true; # default: true
    systemd = {
      enable = true;
      autoStart = true;
    };
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
  home.file = { ".gitconfig" = { source = ../dots/git/.gitconfig; }; };

  home.stateVersion = "24.11";
}
