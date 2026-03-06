{ inputs, pkgs, ... }:

{
  imports = [
    ./desktop.nix
    ./niri.nix
    ./waybar.nix
    ./fuzzel.nix
    ./mako.nix
    ./git.nix
    ./shell.nix
  ];

  home.username = "andyfore";
  home.homeDirectory = "/home/andyfore";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
