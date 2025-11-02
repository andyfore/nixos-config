{ config, pkgs, ... }:
{
    home.username = "andyfore";
    home.homeDirectory = "/home/andyfore";
    programs.home-manager.enable = true;
    home.stateVersion = "25.11";

    home.packages = with pkgs; [
        # Wayland/Hyprland kit
        waybar wofi hyprpaper hyprlock
        wl-clipboard grim slurp cliphist
        # Terminals/editors/basics
        alacritty git curl unzip kitty brave
        # Audio/display tools
        pavucontrol brightnessctl
        neovim zsh
    ];

    # Zsh (example program module)
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        #autosuggestions.enable = true;
        #syntaxHighlighting.enable = true;
        # If you keep your .zshrc in chezmoi, don’t set interactiveShellInit here.
    };
  
    programs.git = {
        enable = true;
        userName  = "Andrew Fore";
        userEmail = "andrewrfore@gmail.com";
        extraConfig = {
            init.defaultBranch = "main";
            pull.rebase = true;
        };
    };

    # (Optional quality-of-life)
    programs.alacritty.enable = true;
    programs.kitty.enable = true;
    programs.waybar.enable = false; # leave false if you use your own config file

  # Fonts & theming are fine to manage here if you want
  fonts.fontconfig.enable = true;

  # XDG defaults: lets you reference dotfiles cleanly
  xdg.enable = true;
  xdg.userDirs.enable = true;

}


  # User services example (disabled by default)
  # systemd.user.services."example-timer" = {
  #   Unit.Description = "Example user service";
  #   Service = { ExecStart = "${pkgs.coreutils}/bin/true"; };
  #   Install.WantedBy = [ "default.target" ];
  # };

