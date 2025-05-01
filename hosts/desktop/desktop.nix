{ config, pkgs, ... }:

{
  # Enable X11
  services.xserver.enable = true;

  # Use both Intel and NVIDIA drivers
  services.xserver.videoDrivers = [ "nvidia" "modesetting" ];

  # Enable NVIDIA PRIME offload
  hardware.nvidia.prime = {
    sync.enable = false;    # Use offload mode (recommended)
    offload.enable = true;
    offload.enableOffloadCmd = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  # Enable OpenGL and Vulkan
  hardware.graphics.enable = true;
  # hardware.opengl.driSupport = true;
  hardware.graphics.enable32Bit = true;

  # Optional: Enable NVIDIA power management
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; # Optional
  };
}

