{ config, pkgs, lib, ... }:
{

    programs.git = {
        enable = true;
        userName  = "Andrew Fore";
        userEmail = "andrewrfore@gmail.com";
        extraConfig = {
            init.defaultBranch = "main";
            pull.rebase = true;
        };
    };

}
