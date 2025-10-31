{ config, pkgs, ... }:
{
    home.username = "andyfore";
    home.homeDirectory = "/home/andyfore";
    programs.home-manager.enable = true;
    home.stateVersion = "25.11";

    home.packages = with pkgs; [
        # Wayland/Hyprland kit
        # waybar wofi hyprpaper hyprlock
        # wl-clipboard grim slurp cliphist
	# Wayland/niri kit
	waybar wofi swww swaylock
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

  # niri config
  xdg.configFile."niri/config.kdl".text = ''
    # ~/.config/niri/config.kdl

    # Monitor layout (auto)
    outputs { }

    # Cursor + scale defaults
    cursor { speed 0.0 }
    default_workspace_scale 1.0

    # Launchers
    spawn "wofi --show drun"            mod=SUPER key=D
    spawn "kitty"                       mod=SUPER key=RETURN
    spawn "gtklock"                     mod=SUPER key=L

    # Basics
    close-window                        mod=SUPER key=Q
    quit                                 mod=SUPER key=SHIFT+E
    toggle-fullscreen                   mod=SUPER key=F

    # Screenshots (grim + slurp)
    spawn "grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%F_%T).png" mod=SUPER key=PRINT

    # Workspaces (Waybar has a niri module; generic bindings still help)
    focus-workspace 1                   mod=SUPER key=1
    focus-workspace 2                   mod=SUPER key=2
    focus-workspace 3                   mod=SUPER key=3
    focus-workspace 4                   mod=SUPER key=4
    focus-workspace 5                   mod=SUPER key=5
  '';


}


  # User services example (disabled by default)
  # systemd.user.services."example-timer" = {
  #   Unit.Description = "Example user service";
  #   Service = { ExecStart = "${pkgs.coreutils}/bin/true"; };
  #   Install.WantedBy = [ "default.target" ];
  # };

