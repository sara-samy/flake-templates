{
  description = "Personal collection of flake templates";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      templates = {
        cpp = {
          path = ./templates/cpp;
          description = "C++ development and build with CMake";
        };

        python = {
          path = ./templates/python;
          description = "Python development environment with poetry";
        };

        rust = {
          path = ./templates/rust;
          description = "Rust development environment with cargo";
        };

        julia-jupyter = {
          path = ./templates/julia-jupyter;
          description = "Jupyter notebook with julia and python";
        };

        lisp = {
          path = ./templates/lisp;
          description = "Common Lisp development environment";
        };

        guile = {
          path = ./templates/guile;
          description = "Scheme development environment with Guile";
        };

        hugo = {
          path = ./templates/hugo;
          description = "Static website development environment with hugo";
        };

      };
    };
}
