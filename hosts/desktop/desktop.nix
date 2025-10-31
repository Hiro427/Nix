{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  # services.xserver.videoDrivers = [ "nvidia" "modesetting" ];

  # hardware.nvidia.prime = {
  #   sync.enable = false; # Use offload mode (recommended)
  #   offload.enable = true;
  #   offload.enableOffloadCmd = true;
  #   intelBusId = "PCI:0:2:0";
  #   nvidiaBusId = "PCI:1:0:0";
  # };

  # hardware.graphics.enable = true;
  # hardware.graphics.enable32Bit = true;

  # hardware.nvidia.powerManagement.enable = true;
  # hardware.nvidia.modesetting.enable = true;
  # hardware.nvidia.open = true;

  # programs.steam = {
  #   enable = true;
  #   gamescopeSession.enable = true; # Optional
  # };
  boot.extraModprobeConfig = ''
    blacklist nouveau
    options nouveau modeset=0
  '';

  services.udev.extraRules = ''
    # Remove NVIDIA USB xHCI Host Controller devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
    # Remove NVIDIA USB Type-C UCSI devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
    # Remove NVIDIA Audio devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
    # Remove NVIDIA VGA/3D controller devices
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
  '';
  boot.blacklistedKernelModules =
    [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
}

