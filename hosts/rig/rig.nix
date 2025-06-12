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
    };

  # Steam and Gamescope
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; # Optional
  };
}
