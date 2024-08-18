{
  pkgs,
  lib,
  cmake,
  boost,
  suitesparse,
  catch2,
}:

pkgs.stdenv.mkDerivation {
  name = "project_name";
  version = "0.1.0";

  # src = "./src";
  src = ./.;

  nativeBuildInputs = [ cmake ];
  buildInputs = with pkgs; [
    boost
    catch2
    suitesparse
    darwin.apple_sdk.frameworks.Cocoa
    darwin.apple_sdk.frameworks.Carbon
    darwin.apple_sdk.frameworks.Kernel
  ];

  cmakeFlags = [
    "-DENABLE_TESTING=OFF"
    "-DENABLE_INSTALL=ON"
  ];

  unpackPhase = "true";

  buildPhase = ''
    cmake ..
    make -j4
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp project_name $out/bin
  '';

  meta = with lib; {
    homepage = "";
    description = '''';
    licencse = licenses.mit;
    platforms = with platforms; linux ++ darwin;
    maintainers = [ maintainers.breakds ];
  };
}
