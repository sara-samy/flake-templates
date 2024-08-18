{
  description = "C++ Development Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs {
      inherit system;
    };
  in with pkgs; {
    devShells.default = mkShell {
      # important! prioritize system clang.
      shellHook = ''
        export PATH=/usr/bin:$PATH
      '';

      buildInputs = [
        # Development Tools
        # llvmPackages_14.clang
        cmakeCurses
        boost
        catch2
        suitesparse
      ] ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
        # important! add necessary darwin frameworks.
        # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/darwin/apple-sdk/frameworks.nix
        Cocoa
        Carbon
        Kernel
      ]);
    };
  });
}
