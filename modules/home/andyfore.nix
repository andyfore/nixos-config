{ config, pkgs, lib, inputs, ... }:
let
  ul6Pkg = (inputs.ulauncher.packages.${pkgs.system}.ulauncher);
in
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
        waypaper blueman kdeconnect swayosd
        thunar
        ul6Pkg
    ];

    home.sessionVariables = {
      terminal = "alacritty";
      fileManager = "thunar";
      menu = "ulauncher-toogle";
      browser = "brave --flag-switches-begin --flag-switches-end";
    };

    imports = [
      ./hyprland
      ./zsh
    ];

    home.activation.createProjectDirs = lib.mkIf true (lib.mkForce ''
        echo "Creating custom directories..."
        ${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/Development
        ${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/Development/code
        ${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/Development/repos
        ${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/Development/projects
      '');

  
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

    systemd.user.services.ulauncher = {
      Unit = {
        Description = "Ulauncher";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${ul6Pkg}/bin/ulauncher";
        Restart = "on-failure";
        Environment = "XDG_CURRENT_DESKTOP=${config.xdg.portal.desktop || "wlroots"}";
      };
      Install = { WantedBy = [ "graphical-session.target" ]; };
    };

}


  # User services example (disabled by default)
  # systemd.user.services."example-timer" = {
  #   Unit.Description = "Example user service";
  #   Service = { ExecStart = "${pkgs.coreutils}/bin/true"; };
  #   Install.WantedBy = [ "default.target" ];
  # };

