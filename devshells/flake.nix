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
          buildInputs = [
            pkgs.gcc
            pkgs.gnumake
            pkgs.rustc
            pkgs.cargo
            pkgs.pkg-config
            pkgs.libsixel
            pkgs.font-util
            pkgs.fontconfig
          ];
        };

        # Python development shell
        python = pkgs.mkShell {
          buildInputs = [
            pkgs.python3
            pkgs.python3Packages.numpy
            pkgs.python3Packages.requests
            pkgs.python3Packages.pandas
            pkgs.python3Packages.matplotlib
            pkgs.python3Packages.seaborn
          ];
          shellHook = ''
            export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH
            export SHELL=${pkgs.zsh}/bin/zsh
            exec $SHELL
          '';
        };

        # Rust development shell
        rust = pkgs.mkShell {
          buildInputs = [ pkgs.rustc pkgs.cargo pkgs.rust-analyzer ];
        };
      };
    };
}
