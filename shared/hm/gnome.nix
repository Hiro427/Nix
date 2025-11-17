{ config, pkgs, ... }: {
  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = pkgs.gnomeExtensions.vitals; }
      { package = pkgs.gnomeExtensions.spotify-tray; }
      { package = pkgs.gnomeExtensions.space-bar; }
      { package = pkgs.gnomeExtensions.top-bar-organizer; }
      { package = pkgs.gnomeExtensions.disable-workspace-animation; }
      { package = pkgs.gnomeExtensions.smart-auto-move-ng; }
      { package = pkgs.gnomeExtensions.dash-to-dock; }
      { package = pkgs.gnomeExtensions.windowswitcher; }
      { package = pkgs.gnomeExtensions.windowswitcher; }
    ];
  };
}
