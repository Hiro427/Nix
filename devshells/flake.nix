{
  description = "Dev Shells";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system} = {
        # C development shell
        c = pkgs.mkShell {
          buildInputs = [ pkgs.gcc pkgs.gnumake pkgs.gdb pkgs.valgrind ];
        };

        # Python development shell
        python = pkgs.mkShell {
          buildInputs = [
            pkgs.python3
            pkgs.python3Packages.numpy
            pkgs.python3Packages.requests
          ];
        };

        # Rust development shell
        rust = pkgs.mkShell {
          buildInputs = [ pkgs.rustc pkgs.cargo pkgs.rust-analyzer ];
        };
      };
    };
}
