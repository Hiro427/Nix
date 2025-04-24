{
  description = "Manage configurations for laptop and desktop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

#    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

#    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    nixosConfigurations = {
    	
	desktop = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux"; 
		modules = [ 
		 ./configuration.nix
		 ./hosts/desktop.nix
		];
			
	};
	laptop = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux"; 
		modules = [ 
		 ./configuration.nix
		 ./hosts/laptop.nix
		];
			
	};
    };

  };
}
