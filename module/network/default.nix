{ config, pkgs, ... }:

{
  networking.hostName = "fangn-nixos"; 	# Define your hostname.

  # Configure network proxy if necessary
  networking.proxy.default = "http://127.0.0.1:7890";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
 
  # Enable ustc cache mirror.
  # nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];

  # Enable network manager.
  networking.networkmanager.enable = true;
 
  # Enables wireless support via wpa_supplicant.
  networking.wireless.enable = true;  
}
