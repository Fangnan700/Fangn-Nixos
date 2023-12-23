{ config, pkgs, ... }:

{
  config.fileSystems."/mnt/sda1" = {
    device = "/dev/sda1";
    fsType = "ntfs";
    options = [ "rw" ];
  };
}
