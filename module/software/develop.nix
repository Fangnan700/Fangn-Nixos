{ config, pkgs, pkgs-unstable, ...}:

{
  environment.systemPackages = with pkgs; [
    pkgs-unstable.jetbrains.pycharm-professional
  ];
}
