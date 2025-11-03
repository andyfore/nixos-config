{ config, pkgs, lib, ... }:
{

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        #autosuggestions.enable = true;
        #syntaxHighlighting.enable = true;
        # If you keep your .zshrc in chezmoi, don’t set interactiveShellInit here.
    };

}
