{ config, pkgs, pkgs-unstable, ...}:

{
  environment.systemPackages = with pkgs; [
    pkgs-unstable.go
    pkgs-unstable.python312
  ]; 
}
