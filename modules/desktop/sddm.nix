{ config, pkgs, ... }:
{
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.xserver.displayManager.autoLogin.enable = false;
}
