{ homeDirectory
, pkgs
}:

{
  enable = true;
  userName = "Brian Ketelsen";
  userEmail = "bketelsen@gmail.com";
  package = pkgs.gitAndTools.gitFull;

  delta = { enable = true; };

  lfs = { enable = true; };

  ignores = [
    ".cache/"
    ".DS_Store"
    ".direnv/"
    ".idea/"
    "*.swp"
    "built-in-stubs.jar"
    "dumb.rdb"
    ".elixir_ls/"
    ".vscode/"
    "npm-debug.log"
  ];
  aliases = (import ./aliases.nix { inherit homeDirectory; }).git;

  extraConfig = {
    core = {
      editor = "nvim";
      whitespace = "trailing-space,space-before-tab";
    };

    #commit.gpgsign = "true";
    #gpg.program = "gpg2";

    #protocol.keybase.allow = "always";
    credential.helper = "osxkeychain";
    pull.rebase = "false";
    init.defaultBranch = "main";

    #user = { signingkey = "3987C314C5E59CBF"; };
  };
}
