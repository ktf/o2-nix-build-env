{ 
  pkgs ? import <nixpkgs> { },
  pkgs193 ? import <nixpkgs-19.3> { },
  unstable ? import <nixpkgs-unstable> {} 
}:
let
    myPython = pkgs.python3.withPackages (ps: with ps; [
      ipykernel
      ipython
      ipywidgets
      mock
      notebook
      numpy
      pandas
      requests
      scikitlearn
      scipy
      seaborn
      uproot
#      xgboost
      pyyaml
      pip
    ]);
    myLz4 = pkgs.lz4.override { enableStatic = true; };
in
    pkgs.mkShell {
      buildInputs = [
        myPython
        pkgs.curl
        pkgs.boost168
        pkgs.msgpack
        pkgs.protobuf
        pkgs.libyamlcpp
        myLz4
        pkgs.protobuf
        pkgs.gfortran
        unstable.cmake
        pkgs.lzma
        pkgs.flatbuffers
        pkgs.libxml2
        pkgs.gsl
        pkgs.freetype
        pkgs.libpng
        pkgs.zeromq
        pkgs.glfw3
        pkgs.pcre
        pkgs.xxHash
        pkgs.glew
        pkgs.gettext
        pkgs.automake
        pkgs.autoconf
        pkgs.libtool
        pkgs.pkgconfig
        pkgs.sqlite
        unstable.stack
        unstable.darwin.cf-private 
        unstable.darwin.objc4
        unstable.darwin.apple_sdk.frameworks.Cocoa 
        unstable.darwin.apple_sdk.frameworks.OpenGL
        unstable.darwin.apple_sdk.frameworks.CoreServices
        unstable.darwin.apple_sdk.frameworks.CoreFoundation
        unstable.darwin.apple_sdk.frameworks.CoreText
        unstable.darwin.CoreSymbolication
        unstable.darwin.usr-include
        #unstable.darwin.apple_sdk.sdk
        #pkgs.darwin.apple_sdk.sdk
        #pkgs.darwin.apple_sdk.frameworks.CF 
        #pkgs.darwin.apple_sdk.frameworks.Security 
        #pkgs.darwin.apple_sdk.frameworks.ApplicationServices 
        #pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
      ];
    }
