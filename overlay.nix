self: super: {
    # includes fix for building ansible from 2020-08-25
    poetry2nix = import super.fetchFromGitHub {
        owner = "nix-community";
        repo = "poetry2nix";
        rev = "c377518ddf06c391b2ef4e424c84e88f007f632d";
      };
}
