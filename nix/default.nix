let
  sources = import ./sources.nix;

  pkgs = import sources.nixpkgs {};
in {
  inherit pkgs;

  # Next level Hack: Ansible 2.7 doesn't try to detect the python interpreter
  # for localhost if it exists in the inventory, but defaults to /usr/bin/python.
  # Expose the Python we use for ansible as a separate attribute, so we can at least symlink
  # /usr/bin/python inside docker containers until we migrated to Ansible > 2.7.
  pythonForAnsible = (pkgs.python37.withPackages (_: pkgs.ansible_2_7_with_libs.requiredPythonModules));

  env = pkgs.buildEnv {
    name = "dev-env";
    paths = [
      pkgs.ansible_2_7_with_libs
      pkgs.niv

      pkgs.python37 # needed for local_action in ansible. Use 3.7 until https://github.com/zinfra/backend-issues/issues/1661 is fixed
      pkgs.molecule

    ];
  };
}
