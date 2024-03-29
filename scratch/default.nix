let
  pkgs = import ../pkgs.nix;
in import "${pkgs.ihaskell}/release.nix" {
  nixpkgs = import pkgs.nixpkgs {};
  compiler = "ghc865";
  packages = self: with self; [
    ihaskell-aeson
    ihaskell-blaze
    ihaskell-charts
    ihaskell-diagrams

    aeson
    aeson-prettye
    bytestring
    containers
    text
    timeit
    vector
  ];
  systemPackages = pkgs: with pkgs; [ ];
}

