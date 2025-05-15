{ config, pkgs, inputs, ... }:
{
  environment.systemPackages =
    (import ./packages/misc.nix { inherit pkgs inputs config; } )
    ++(import ./packages/editors.nix { inherit pkgs; })
    ++(import ./packages/terms.nix { inherit pkgs; })
    ++(import ./packages/i3.nix { inherit pkgs; })
    ++(import ./packages/gui_apps.nix { inherit pkgs; })
    ++(import ./packages/coding.nix { inherit pkgs; })
    ++(import ./packages/utils.nix { inherit pkgs; });
  
}


