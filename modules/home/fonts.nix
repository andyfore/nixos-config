{ config, pkgs, lib, ... }:
{

    fonts.fontconfig.enable = true;
    fonts.packages = with pkgs; [
      corefonts
      hack-font
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      jetbrains-mono
      (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "IBMPlexMono" "Iosevka" "IosevkaTerm" ]; })
    ];

}
