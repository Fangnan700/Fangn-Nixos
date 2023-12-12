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
    rpi-imager
    neofetch
    jetbrains.clion
    jetbrains.goland
    jetbrains.pycharm-professional
    
    pkgs-unstable.google-chrome

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
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
}
