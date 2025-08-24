{ config, pkgs, ... }:
{
  users.users.andyfore = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDKJIyNEor3Uarf+6FUZTlkWr4TJ5fbaktEOfJpzpo/U andyf@windmill"
    ];
    initialPassword = "yourSecurePassword"; # change after first boot
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
