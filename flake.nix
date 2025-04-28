{
  description = "Manage configurations for laptop and desktop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin }: {

#    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

#    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    nixosConfigurations = {
    	
	desktop = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux"; 
		modules = [ 
		 ./configuration.nix
		 ./hosts/desktop/desktop.nix
		 ./hosts/desktop/hardware-configuration.nix
         ./hosts/desktop/homeuniq.nix
	        catppuccin.nixosModules.catppuccin
	        home-manager.nixosModules.home-manager
	         ({ config, ... }: {
	           home-manager.useGlobalPkgs = true;
	           home-manager.useUserPackages = true;
	           home-manager.users.jacobrambarran = { pkgs, ... }: {
	               imports = [ catppuccin.homeModules.catppuccin ./home.nix ];
	           };
	         })
		];

	};
	laptop = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux"; 
		modules = [ 
		 ./configuration.nix
		 ./hosts/laptop/laptop.nix
		 ./hosts/laptop/hardware-configuration.nix
		];
			
	};
    };

  };
}
