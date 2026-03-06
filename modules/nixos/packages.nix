{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    vim
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
