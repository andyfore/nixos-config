{ config, pkgs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma5.enable = false;
  services.xserver.displayManager.autoLogin.enable = false;
}
