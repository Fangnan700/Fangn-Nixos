{ config
, pkgs
, pkgs-unstable
, pkgs-fangn
, ...
}:

{
  environment.systemPackages = with pkgs; [
    go
    gcc
  ];
}

