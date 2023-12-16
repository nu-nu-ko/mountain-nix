{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        pkgs.dart-sass
      ];
    };
    packages.${system} = {
      gtk = pkgs.stdenvNoCC.mkDerivation {
        pname = "phocus-gtk-mountain";
        version = "1";
        src = ./gtk;
        buildInputs = [pkgs.dart-sass];
        buildPhase = ''
          dart-sass ./scss:./
        '';
        installPhase = ''
          mkdir -p $out/share/themes/phocus-mountain
          cp -r gtk-3.0 $out/share/themes/phocus-mountain/
          cp -r assets $out/share/themes/phocus-mountain/
          cp index.theme $out/share/themes/phocus-mountain/
        '';
      };
      nvim = pkgs.vimUtils.buildVimPlugin {
        name = "mountain-nvim";
        src = ./nvim;
      };
    };
  };
}
