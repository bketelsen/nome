{ nix }:

{
  package = nix;
  settings = {
     substituters = [ "https://cache.nixos.org" ];
    experimental-features = [ "flakes" "nix-command" ];
  };
}
