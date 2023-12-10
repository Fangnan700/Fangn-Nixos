{ config
, pkgs
, pkgs-unstable
, pkgs-fangn
, ...
}:

{
  environment.systemPackages = with pkgs; [
    vlc
    steam
    steam-run
    go-musicfox
    telegram-desktop

    pkgs-fangn.qq
  ];
}
