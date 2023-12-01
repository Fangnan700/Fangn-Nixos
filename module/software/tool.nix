{ config, pkgs, pkgs-unstable, ...}:

{
  # Install packages
  environment.systemPackages = with pkgs; [
    git
    vim
    tree
    rpi-imager
    google-chrome
    neofetch

    pkgs-unstable.docker
    pkgs-unstable.nvidia-docker
  ];

  # Enable clash-verge
  programs.clash-verge = {
    enable = true;
    autoStart = true;
  };

  # Enable docker daemon
  virtualisation.docker.enable = true;
  virtualisation.docker.enableNvidia = true;
}
