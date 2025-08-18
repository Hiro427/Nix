{ config, pkgs, ... }:

{
  # Enable X11
  services.xserver.enable = true;

  # Use AMD GPU driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable OpenGL and Vulkan
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr
      rocmPackages.rocminfo
      rocmPackages.rocm-smi
    ];
  };
  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };

  # Steam and Gamescope
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; # Optional
  };
}
