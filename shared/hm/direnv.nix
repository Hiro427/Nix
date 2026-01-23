{ config, pkgs, ... }: {

  # ...other config, other config...

  programs = {
    direnv = {
      enable = false;
      enableBashIntegration = true; # see note on other shells below
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    bash.enable = true; # see note on other shells below
  };
}

