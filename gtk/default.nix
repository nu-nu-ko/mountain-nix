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
    cp -r gtk-3.0 $out/share/themes/phocus-mountain/
    cp -r assets $out/share/themes/phocus-mountain/
    cp index.theme $out/share/themes/phocus-mountain/
  '';
}
