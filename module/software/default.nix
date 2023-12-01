{ config, pkgs, pkgs-unstable, ...}:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    # stable
    qq
    git
    vim
    tree
    rpi-imager
    google-chrome
    go-musicfox
    neofetch
  ];

  # Remove Xterm
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable clash-verge
  programs.clash-verge = {
    enable = true;
    autoStart = true;
  };
}
