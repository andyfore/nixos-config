{ config, pkgs, ... }:
{
  home.username = "andyfore";
  home.homeDirectory = "/home/andyfore";
  programs.home-manager.enable = true;
  programs.zsh.enable = true;
  home.stateVersion = "25.11";

  xdg.configFile."hypr/hyprland.conf".source = ../home/dotfiles/config/hypr/hyprland.conf;
}
