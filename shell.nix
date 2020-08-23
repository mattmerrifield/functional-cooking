{ pkgs ? import <nixpkgs> {} }:
with pkgs;
let
  bs-platform-src =
    pkgs.fetchFromGitHub {
      owner = "turboMaCk";
      repo = "bs-platform.nix";
      rev = "2cbefeb081303f6364f28fcdca750a4453886bc1";
      sha256 = "02axqi00g3w6glwhms8dlb2sg1ac0v7bp9g9cbik0ky3x38fa29b";
    };
  bs-platform =
    (import bs-platform-src { inherit pkgs; }).bs-platform7;
in
mkShell {
    buildInputs = [ bs-platform nodejs ];

    shellHook = ''
      mkdir -p node_modules
      ln -sfn ${bs-platform} ./node_modules/bs-platform
      ln -sfn ${bs-platform}/bin/* ./node_modules/.bin
      echo "bs-platform linked to $(pwd)/node_modules/bs-platform"

      npm install
    '';
}
