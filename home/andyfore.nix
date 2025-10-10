{ config, pkgs, ... }:
{
    home.username = "andyfore";
    home.homeDirectory = "/home/andyfore";
    programs.home-manager.enable = true;
    programs.zsh.enable = true;
    home.stateVersion = "25.11";

    home.packages = with pkgs; [
        # Wayland/Hyprland kit
        waybar wofi hyprpaper hyprlock
        wl-clipboard grim slurp cliphist
        # Terminals/editors/basics
        alacritty git curl unzip kitty brave
        # Audio/display tools
        pavucontrol brightnessctl
    ];

    # (Optional quality-of-life)
    programs.git.enable = true;
    programs.alacritty.enable = true;
    programs.waybar.enable = false; # leave false if you use your own config file
}
