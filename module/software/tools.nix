{ config
, pkgs
, pkgs-unstable
, pkgs-fangn
,...
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
    google-chrome
    jetbrains.clion
    jetbrains.goland
    jetbrains.pycharm-professional

    pkgs-fangn.typora-unlock
    pkgs-fangn.apifox
  ];

  # Enable clash-verge
  programs.clash-verge = {
    enable = true;
    autoStart = true;
  };

  # Enable nvidia-docker
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  # Enable virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
}
