{ config, pkgs, pkgs-unstable, ...}:

{
  # Install packages
  environment.systemPackages = with pkgs; [
    git
    vim
    tree
    htop
    rpi-imager
    neofetch
    typora
    google-chrome
    jetbrains.clion
    jetbrains.goland
    jetbrains.pycharm-professional
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
