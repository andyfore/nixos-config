{ config, pkgs, lib, ... }:
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

    home.activation.createProjectDirs = lib.mkIf true (lib.mkForce ''
        echo "Creating custom directories..."
        ${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/Development
        ${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/Development/code
        ${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/Development/repos
        ${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/Development/projects
      '');

    # Zsh (example program module)
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        #autosuggestions.enable = true;
        #syntaxHighlighting.enable = true;
        # If you keep your .zshrc in chezmoi, don’t set interactiveShellInit here.
    };
  
    # (Optional quality-of-life)
    programs.alacritty.enable = true;
    programs.kitty.enable = true;
    programs.waybar.enable = false; # leave false if you use your own config file

    # XDG defaults: lets you reference dotfiles cleanly
    xdg.enable = true;
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };

}


  # User services example (disabled by default)
  # systemd.user.services."example-timer" = {
  #   Unit.Description = "Example user service";
  #   Service = { ExecStart = "${pkgs.coreutils}/bin/true"; };
  #   Install.WantedBy = [ "default.target" ];
  # };

