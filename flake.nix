{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  outputs = {nixpkgs, ...}: {
    devShells.x86_64-linux = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      default = pkgs.mkShell {packages = [pkgs.dart-sass];};
    };
    packages.x86_64-linux = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      gtk = pkgs.callPackage ./gtk {};

      nvim = pkgs.vimUtils.buildVimPlugin {
        name = "mountain-nvim";
        src = ./nvim;
      };
    };
  };
}
