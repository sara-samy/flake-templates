{
  description = "Hugo development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "hugo-dev";

          # Hugo + essential dependencies
          packages = with pkgs; [
            hugo                     # Static site generator
            go                       # Required for Hugo modules

            # Optional
            sass
          ];

          env = {
            # Enable extended Hugo features (Sass/SCSS)
            HUGO_ENABLEEXTENDED = "1";
          };

          shellHook = ''
            echo "Entering Hugo development environment 🐕 "
            echo "Hugo version: $(hugo version)"
            echo "Go version: $(go version)"
          '';
        };
      }
    );
}
