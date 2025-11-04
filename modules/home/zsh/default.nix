{ config, pkgs, lib, ... }:
{

    programs.zsh = {
        enable = true;
        enableCompletion = true;

        # Match your .histfile behavior
        history = {
          path = "${config.home.homeDirectory}/.histfile";
          size = 1000;
          save = 1000;
        };

        # Aliases from your .zshrc
        shellAliases = {
          code = "cd $HOME/Development/code/";
          dl   = "cd $HOME/Downloads/";
          proj = "cd $HOME/Development/projects/";
          repo = "cd $HOME/Development/repos/";
        };
    
        # Extra zsh init to replicate the rest of your .zshrc
        initContent = ''
          # Fix terminal/WM timing bug causing stray '%' on startup.
          sleep 0.05

          # Match "unsetopt beep" from your .zshrc
          unsetopt beep
    
          # Completion styling (compinit is handled by Home Manager when enableCompletion = true)
          zstyle ":completion:*" format $'\e[2;37mCompleting %d\e[m'
    
          # Up/Down search like your original setup
          autoload -U up-line-or-beginning-search
          autoload -U down-line-or-beginning-search
          zle -N up-line-or-beginning-search
          zle -N down-line-or-beginning-search
          bindkey "^[OA" up-line-or-beginning-search   # Up
          bindkey "^[OB" down-line-or-beginning-search # Down
    
          # Home/End keys
          bindkey  "^[[H" beginning-of-line
          bindkey  "^[[F" end-of-line
        '';
    };

}
