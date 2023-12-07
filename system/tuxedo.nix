{ config, pkgs, ... }:

{
  hardware.tuxedo-rs.enable = true;
  hardware.tuxedo-rs.tailor-gui.enable = true;
  hardware.tuxedo-keyboard.enable = true;
}

