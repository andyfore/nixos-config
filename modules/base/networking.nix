{ config, pkgs, ... }:
{
    networking.networkmanager.enable = true;
    networking.useDHCP = false;
    services.resolved.enable = true;
    programs.mtr.enable = true;

    services.openssh = {
        enable = true;
        openFirewall = true;
        UseDns = false;
        settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
        };
    };
}
