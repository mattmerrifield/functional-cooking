# simple.nix
with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    nodejs
    git
  ];
}

