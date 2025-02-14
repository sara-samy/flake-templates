{
  description = "A Nix development environment for Scheme with Guile";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in {
      # Development shell
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.guile
        ];

        shellHook = ''
          echo "Use Scheme with Guile!"
        '';
      };
    };
}
