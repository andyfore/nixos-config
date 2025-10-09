{ config, pkgs, ... }:
{
    users.users.andyfore = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "audio" "video" "lp" "kvm" "input" ];
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDKwMzjUqqzdkGqjeUnH52afG8AB3yduzOLG7cJENbhd andyfore@windmill"
        ];
    };
    
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
}
