{ config, pkgs, ... }:
{
  users.users.andyfore = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8xUkBo0e9IpSLX6tlcjCcJnKiSDm91zzRsWikhzgg/ afore@VQX3K9Y2JC-M"
    ];
    initialPassword = "yourSecurePassword"; # change after first boot
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
