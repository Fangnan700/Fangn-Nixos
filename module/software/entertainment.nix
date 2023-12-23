{ config
, pkgs
, pkgs-unstable
, pkgs-fangn
, ...
}:

{
  environment.systemPackages = with pkgs; [
    vlc
    go-musicfox
    telegram-desktop

    pkgs-fangn.qq
    pkgs-fangn.feishu
    pkgs-fangn.wine-wechat-x86
  ];
}
