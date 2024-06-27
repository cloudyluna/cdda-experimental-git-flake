{
  description = "cdda-experimental-git";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
  };
  
  outputs = { self, nixpkgs, flake-utils, ... }:
    let supportedSystems = [ "x86_64-linux" ];
    in flake-utils.lib.eachSystem supportedSystems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
        rec {
          packages = {
            cdda-experimental-git = pkgs.stdenvNoCC.mkDerivation rec {
              name = "cdda-tiles-launcher";
              src = let
                releaseVersion = "2024-06-26-1623";
              in
                pkgs.fetchurl {
                  # if you want local tarball, use file://... url.
                  url = "https://github.com/CleverRaven/Cataclysm-DDA/releases/download/cdda-experimental-${releaseVersion}/cdda-linux-tiles-sounds-x64-${releaseVersion}.tar.gz";
                  hash = "sha256-Hf4LiPU7jjqWlP8Ic0Du9KUdKRqC7o51/65qSpL1wfI=";
                };
              
              nativeBuildInputs = with pkgs; [
                autoPatchelfHook
              ];
              
              buildInputs = with pkgs; [
                gettext
                SDL2
                SDL2_image
                SDL2_mixer
                SDL2_ttf
              ];
              
              dontStrip = true;

              installPhase = ''
                mkdir $out
                cp -R data gfx doc $out
                
                install -m755 -D cataclysm-tiles $out/bin/cataclysm-tiles

                cat << EOF > launcher
                #!${pkgs.runtimeShell}
                $out/bin/cataclysm-tiles --basepath $out --userdir \$HOME/.cdda-experimental-git
                EOF
                install -m755 -D launcher $out/bin/${name}
              '';
            };
          };
          packages.default = packages.cdda-experimental-git;
        });
}
