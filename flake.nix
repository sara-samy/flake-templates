{
  description = "Personal collection of flake templates";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    templates = {
      cpp = {
        path = ./templates/cpp;
        description = "C++ development and build project with CMake";
      };

      python = {
        path = ./templates/python;
        description = "Python development with poetry and direnv";
      };

    };
  };
}
