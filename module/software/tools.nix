{ config
, lib
, pkgs
, pkgs-unstable
, pkgs-fangn
, ...
}:

{
  # Install packages
  environment.systemPackages = with pkgs; [
    git
    vim
    tree
    htop
    hexo-cli
    rpi-imager
    neofetch

    # teseract-ocr
    xclip
    tesseract
    imagemagick
    gnome.gnome-screenshot

    pkgs-unstable.drawio
    pkgs-unstable.google-chrome
    pkgs-unstable.jetbrains.clion
    pkgs-unstable.jetbrains.goland
    pkgs-unstable.jetbrains.webstorm
    pkgs-unstable.jetbrains.pycharm-professional

    pkgs-fangn.typora-unlock
    pkgs-fangn.clash-verge
    pkgs-fangn.apifox
  ];

  # Enable nvidia-docker
  virtualisation.docker = {
    enable = true;
    enableNvidia = true ;
    daemon.settings = {
      bip = "192.168.88.1/24";
    };
  };

  # Enable virtualbox
  virtualisation.virtualbox.host.enable = true;
}
