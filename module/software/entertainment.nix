{ config, pkgs, pkgs-unstable, ...}:

{
  environment.systemPackages = with pkgs; [
   qq
   go-musicfox
  ];
}
