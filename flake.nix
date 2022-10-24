{
  description = "A flake for building yawsso";

  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    let pkgs = nixpkgs.legacyPackages.${system}; 
    tbdOnlyFramework = name: { private ? true }: pkgs.stdenv.mkDerivation {
      name = "apple-framework-${name}";
      dontUnpack = true;
      installPhase = ''
        mkdir -p $out/Library/Frameworks/
        cp -r ${self}/stubs/12.1/System/Library/${pkgs.lib.optionalString private "Private"}Frameworks/${name}.framework \
          $out/Library/Frameworks

        cd $out/Library/Frameworks/${name}.framework

        versions=(./Versions/*)
        if [ "''${#versions[@]}" != 1 ]; then
          echo "Unable to determine current version of framework ${name}"
          exit 1
        fi
        current=$(basename ''${versions[0]})

        chmod u+w -R .
        ln -s "$current" Versions/Current
        ln -s Versions/Current/* .
      '';
    }; in rec {
      

      packages = pkgs.lib.genAttrs [ "ContactsPersistence" "CoreSymbolication" "GameCenter" "SkyLight" "UIFoundation" ] (x: tbdOnlyFramework x {});
      #packages.default = packages.SkyLight;
    });
}


