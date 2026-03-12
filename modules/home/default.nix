{ inputs, pkgs, ... }:

{
  imports = [
    ./desktop.nix
#    ./niri.nix
    ./hyprland.nix
    ./waybar.nix
    ./fuzzel.nix
    ./mako.nix
    ./git.nix
    ./shell.nix
  ];

  home.username = "andyfore";
  home.homeDirectory = "/home/andyfore";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
