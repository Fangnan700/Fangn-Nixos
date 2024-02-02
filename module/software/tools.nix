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
    dbeaver

    # teseract-ocr
    xclip
    tesseract
    imagemagick
    gnome.gnome-screenshot

    pkgs-unstable.drawio
    pkgs-unstable.typora
    pkgs-unstable.vscode
    pkgs-unstable.google-chrome
    pkgs-unstable.jetbrains.goland
    pkgs-unstable.jetbrains.webstorm
    pkgs-unstable.jetbrains.rust-rover
    pkgs-unstable.jetbrains.pycharm-professional

    pkgs-fangn.clash-verge
    pkgs-fangn.apifox

    # docker-compose
    pkgs-unstable.docker-compose
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
  virtualisation.virtualbox = {
    host.enable = true;
    host.enableExtensionPack = true;
    guest.enable = true;
    guest.x11 = true;
  };
}
