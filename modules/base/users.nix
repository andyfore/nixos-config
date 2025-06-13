{ config, pkgs, ... }:
{
  users.users.andyfore = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3...yourgithubkeyhere"
    ];
    initialPassword = "yourSecurePassword"; # change after first boot
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
