{ config, pkgs, pkgs-unstable, ...}:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Remove Xterm
  services.xserver.excludePackages = [ pkgs.xterm ];

  imports = [
    ./entertainment.nix
    ./develop.nix
    ./tools.nix
  ];
}
