{ config, pkgs, pkgs-unstable, ...}:

{
  environment.systemPackages = with pkgs; [
   qq
   mpv
   go-musicfox
   telegram-desktop
  ];
}
