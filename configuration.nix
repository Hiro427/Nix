# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
#  imports =
#    [ # Include the results of the hardware scan.
#     ./hardware-configuration.nix
#  ];

  # ...other shared config


  #Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties. i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.windowManager.i3.enable = true;
  security.pam.services.i3lock.enableGnomeKeyring = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;


  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jacobrambarran = {
    isNormalUser = true;
    description = "Jacob Rambarran";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
   boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
  '';

  # Install firefox.
  programs.firefox.enable = true;
  programs.zsh.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.localBinInPath = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  security.pam.services.i3lock = {
  enable = true;
  # Use the standard login PAM stack
  text = ''
    auth     include login
    account  include login
    password include login
    session  include login
  '';
};


  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    jq
    catppuccin-gtk
    zip
    unzip
    viu
    file
    gum
    firefox
    neovim
    wezterm
    zsh
    gnumake
    gcc
    starship
    kitty
    i3
    i3status-rust
    touchegg
    feh
    lxappearance
    lazygit
    sqlite
    picom
    rofi
    dunst
    brave
    htmlq
    chafa
    btop
    thunderbird
    ripgrep
    dmenu
    fd
    bruno
    manga-tui
    go
    cargo
    fastfetch
    dwt1-shell-color-scripts
    nitch
    neofetch
    rustup
    python313
    nodejs_23
    gearlever
    bitwarden-desktop
    discord
    todoist-electron
    calcurse
    flameshot
    eza
    fzf
    tldr
    lm_sensors
    hwdata
    zoxide
    presenterm
    lua
    nerd-fonts.jetbrains-mono
    git-extras
    papirus-icon-theme
    gh
    libnotify
    pcmanfm
    prismlauncher
    pulseaudioFull
    brightnessctl
    rclone
    pokeget-rs
    dua
    ttyper
    is-fast
    cava
    pavucontrol
    whatsapp-for-linux
    pciutils
    mesa-demos
    ghostty
    ffmpeg
    gowall
    lshw
    vlc
    nixd
    spotify-tray
    networkmanager_dmenu
    tty-clock
    cudaPackages.cuda_nvcc
    ollama
    uv
    #helix stuff
    zig
    zls
    yaml-language-server
    typescript-language-server
    ruff
    nil
    mesonlsp
    lua-language-server
    gopls
    golangci-lint-langserver
    golangci-lint
    llvmPackages_19.clang-tools
    cmake-language-server
    glow
    cmake
    frogmouth
    mdr
    bash-language-server
    vscode-langservers-extracted
    md-tui
  ];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
    enabledExtensions = with spicePkgs.extensions; [
       adblockify
       hidePodcasts
       shuffle # shuffle+ (special characters are sanitized out of extension names)
     ];
  };
 # stylix = {
  #       enable = true;
  #       base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  #       targets = {
  #           gtk.enable = true;
  #           qt.enable = true;
  #       };
  #   };
  #

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
