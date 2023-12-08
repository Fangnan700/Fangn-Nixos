{ config, pkgs, pkgs-unstable, ...}:

{
  environment.systemPackages = with pkgs; [
    qq
    vlc
    go-musicfox
    telegram-desktop
  ];
}
