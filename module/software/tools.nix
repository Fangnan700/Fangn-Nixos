{ config, pkgs, pkgs-unstable, ...}:

{
  # Install packages
  environment.systemPackages = with pkgs; [
    git
    vim
    tree
    rpi-imager
    neofetch
    google-chrome

    pkgs-unstable.jetbrains.pycharm-professional
  ];
  
  # Enable clash-verge
  programs.clash-verge = {
    enable = true;
    tunMode = true;
    autoStart = true;
  };

  # Enable nvidia-docker
  # virtualisation.docker = {
  #   enable = true;
  #   enableNvidia = true;
  # };
}
