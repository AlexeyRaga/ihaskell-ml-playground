let
  pkgs = import ../pkgs.nix;
  overlay = sel: sup: {
    haskell = sup.haskell // {
      packages = sup.haskell.packages // {
        ghc865 = sup.haskell.packages.ghc865.override {
          overrides = self: super: {
            sgd = sup.haskell.lib.markUnbroken super.sgd;
            # hmatrix = self.callHackage "hmatrix" "0.19.0.0" {};
          };
        };
      };
    };
  };
in import "${pkgs.ihaskell}/release.nix" {
  # nixpkgs = import pkgs.nixpkgs { config.allowBroken = true; };
  nixpkgs = import pkgs.nixpkgs {  overlays = [ overlay ]; };
  compiler = "ghc865";
  packages = self: with self; [
    ihaskell-aeson
    ihaskell-blaze
    ihaskell-charts
    ihaskell-diagrams

    aeson
    aeson-pretty
    bytestring
    cassava
    containers
    hmatrix
    hmatrix-csv
    hmatrix-gsl
    hmatrix-gsl-stats
    hmatrix-special
    # sgd
    text
    timeit
    vector
  ];
  systemPackages = pkgs: with pkgs; [ ];
  pythonPackages = p: with p; [ setuptools
            # python-mnist
            pillow
            numpy
            scipy
            scikitimage
            opencv3
            Keras
            ipython
            h5py
            matplotlib
            pandas
            scikitlearn
            # mnist
            # resnet50
  ];
}

