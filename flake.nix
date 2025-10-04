{
  description = "Manage configurations for laptop and desktop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    spicetify-nix.url = "github:gerg-l/spicetify-nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    stylix.url = "github:danth/stylix";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    vicinae.url = "github:vicinaehq/vicinae";
    lobster.url = "github:justchokingaround/lobster";
  };

  outputs = { self, stylix, nixpkgs, home-manager, spicetify-nix, catppuccin
    , zen-browser, vicinae, lobster, ... }@inputs: {

      nixosConfigurations = {

        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./shared/configuration.nix
            ./shared/pkgs.nix
            ./hosts/desktop/desktop.nix
            ./hosts/desktop/hardware-configuration.nix
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            spicetify-nix.nixosModules.default
            ({ config, ... }: {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jacobrambarran = { pkgs, ... }: {
                imports = [
                  spicetify-nix.homeManagerModules.default
                  catppuccin.homeModules.catppuccin
                  stylix.homeModules.stylix
                  vicinae.homeManagerModules.default
                  ./shared/home.nix
                ];
              };
            })
          ];

        };

        rig = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./shared/configuration.nix
            ./shared/pkgs.nix
            ./hosts/rig/rig.nix
            ./hosts/rig/hardware-configuration.nix
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            spicetify-nix.nixosModules.default
            ({ config, ... }: {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jacobrambarran = { pkgs, ... }: {
                imports = [
                  spicetify-nix.homeManagerModules.default
                  catppuccin.homeModules.catppuccin
                  vicinae.homeManagerModules.default

                  ./shared/home.nix
                  stylix.homeModules.stylix
                ];
              };
            })
          ];

        };
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./shared/configuration.nix
            ./shared/pkgs.nix
            ./hosts/laptop/laptop.nix
            ./hosts/laptop/hardware-configuration.nix
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            spicetify-nix.nixosModules.default
            # stylix.nixosModules.stylix

            ({ config, ... }: {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jacobrambarran = { pkgs, ... }: {
                imports = [
                  spicetify-nix.homeManagerModules.default
                  vicinae.homeManagerModules.default
                  catppuccin.homeModules.catppuccin
                  ./shared/home.nix
                  stylix.homeModules.stylix
                ];
              };
            })
          ];

        };
      };

    };
}
