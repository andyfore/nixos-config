{ config, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  services.resolved.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;
  networking.interfaces.wlan0.useDHCP = true;
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.PasswordAuthentication = false;
  programs.mtr.enable = true;
}
