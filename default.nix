let
  sources = import ./sources.nix;
  pkgs = import sources.nixpkgs {
    config = {};
    # TODO: overlay doesn't work yet
    # overlays = [ (import ./overlay.nix) ];
  };
in {
    env = pkgs.poetry2nix.mkPoetryEnv {
        projectDir = ./.;
    };
}
