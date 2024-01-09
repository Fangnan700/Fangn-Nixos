{ config
, pkgs
, pkgs-unstable
, pkgs-fangn
, ...
}:

{
  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    cudaSupport = true;
  };
  
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Remove Xterm
  services.xserver.excludePackages = [ pkgs.xterm ];

  imports = [
    ./entertainment.nix
    ./development.nix
    ./tools.nix
  ];
}
