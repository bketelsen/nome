{ homeDirectory
, pkgs
}:

let
  bin = import ./bin.nix {
    inherit homeDirectory pkgs;
  };

  local = import ./local.nix {
    inherit pkgs;
  };

  buildTools = with pkgs; [
    buf
    bun
    cmake
    protobuf
  ];

  configTools = with pkgs; [
    cue
  ];

  devOpsTools = with pkgs; [
    doppler
    flyctl
    heroku
    packer
    terraform
  ];

  fonts = with pkgs.nerdfonts;
    [ (override { fonts = [ "CascadiaCode" "FiraCode" "JetBrainsMono" ]; }) ];

  gitTools = with pkgs.gitAndTools;
    [ diff-so-fancy git-codeowners gitflow ]
    ++ (with pkgs; [ difftastic git-annex git-crypt ]);



  macTools = with pkgs.darwin.apple_sdk.frameworks; [
    CoreServices
    Foundation
    Security
  ];

  jsTools = with pkgs.nodePackages; [
    pnpm
    yarn
  ];
  # Shell tools
  shell = with pkgs; [
    btop
    htop
    lazygit
    ripgrep
    tree
    tree-sitter
    xz
  ];
  # I'll categorize these later :)
  misc = with pkgs; [
    coreutils
    findutils
    gleam
    htmltest
    hugo
    libiconv
    ncurses
    nodejs-16_x
    openssl
    pikchr
    pinentry_mac
    pkg-config
    reattach-to-user-namespace # for tmux
    sqlite
    stow
    subversion
    tailscale
    tree
    treefmt
    vale
    watchexec
    wget
    zellij
    zstd
  ];

  nixTools = with pkgs; [ cachix lorri nixfmt nixpkgs-fmt vulnix ];

  pythonTools = with pkgs; [ python39 ] ++ (with pkgs.python39Packages; [ httpie mkdocs pip virtualenv ]);

  rubyTools = with pkgs; [
    rbenv
  ];

  rustTools = with pkgs; [
    cargo-web
    rust-analyzer # For VS Code
    rustup
    sqlx-cli
  ];

  virtualizationTools = with pkgs; [ vagrant qemu ];

  wasmTools = with pkgs; [
    binaryen
    wabt
    wapm-cli
    #broken wasm3
    wasm-bindgen-cli
    wasm-pack
    wasm-text-gen
    wasmtime
    wast-refmt
    webassemblyjs-cli
    webassemblyjs-repl
  ];

  # These are broken on aarch64-darwin but I hope to add them someday
  broken = with pkgs; [ deno materialize wasmer ];
in
bin
++ local
++ buildTools
++ configTools
++ devOpsTools
++ fonts
++ gitTools
++ macTools
++ jsTools
++ misc
++ shell
++ nixTools
++ pythonTools
++ rustTools
++ virtualizationTools
++ wasmTools
