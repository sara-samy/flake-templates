{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            julia_19-bin
            (python3.withPackages (ps:
              with ps; [
                ipython
                jupyter
                xlrd
                matplotlib
                pyqt5
              ]))
          ];
          shellHook = "jupyter notebook";
        };
      }
    );
}
