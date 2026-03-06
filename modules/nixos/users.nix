{ pkgs, ... }:

{
  users.users.andyfore = {
    isNormalUser = true;
    description = "Andrew Fore";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
