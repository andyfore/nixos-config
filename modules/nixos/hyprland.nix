{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Common Hyprland system deps
  security.polkit.enable = true;
  xdg.portal.enable = true;
}
