{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        apps.default = {
          type = "app";
          program =
            let
              app = pkgs.writeShellApplication {
                name = "ergogen-run";
                runtimeInputs = [ pkgs.ergogen ];
                text = ''
                  set -euo pipefail
                  OUT_DIR="build"
                  mkdir -p "$OUT_DIR"
                  ergogen schematic -o "$OUT_DIR"
                  echo "Generated output files in ./$OUT_DIR"
                '';
              };
            in
            "${app}/bin/ergogen-run";
        };
      });
}
