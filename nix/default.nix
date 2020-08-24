let
  sources = import ./sources.nix;
  pkgs = import sources.nixpkgs {
    config = {};
  };
in {
    env = pkgs.poetry2nix.mkPoetryEnv {
        projectDir = ./.;
    };
}
