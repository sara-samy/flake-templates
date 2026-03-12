{
  description = "Haskell project with haskell-flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    haskell-flake,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["aarch64-darwin"];

      imports = [
        haskell-flake.flakeModule
      ];
      perSystem = {
        self',
        system,
        lib,
        config,
        pkgs,
        ...
      }: {
        haskellProjects.default = {
          basePackages = pkgs.haskell.packages.ghc98;

          devShell = {
            hlsCheck.enable = true;
          };

          autoWire = ["packages" "apps" "checks"]; # Wire all but the devShell
        };

        devShells.default = pkgs.mkShell {
          name = "λ Haskell shell with GHC (9.8.4), cabal, and HLS.";
          inputsFrom = [
            config.haskellProjects.default.outputs.devShell
          ];
          nativeBuildInputs = with pkgs; [
            # Add other development tools.
          ];
        };
      };
    };
}
