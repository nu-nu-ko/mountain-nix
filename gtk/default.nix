{
  stdenvNoCC,
  dart-sass,
}:
stdenvNoCC.mkDerivation {
  pname = "phocus-gtk-mountain";
  version = "1";
  src = ./.;
  buildInputs = [dart-sass];
  buildPhase = ''
    dart-sass ./scss:./
  '';
  installPhase = ''
    mkdir -p $out/share/themes/phocus-mountain
    cp -r gtk-3.0 assets gtk-2.0 index.theme $out/share/themes/phocus-mountain/
  '';
}
