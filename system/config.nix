# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config
, lib
, pkgs
, ... }:

{
  ##################
  # Basic settings #
  ##################
  
  # System version.
  system.stateVersion = "23.11";

  # Enable CUPS to print documents.
  services.printing.enable = true; 
  
  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Enable NTFS support.
    supportedFilesystems = [ "ntfs" ];
  };

  
  #############################
  # Language and input method #
  #############################

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";
  
  # Select internationalisation properties.
  i18n.defaultLocale = "zh_CN.UTF-8"; 
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };
  
  # Input method settings.
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
    ];
  };

  # Fonts settings.
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      source-han-sans
      source-han-serif
      source-code-pro

      vistafonts
      vistafonts-chs
    ];
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  ######################
  # Bluetooth settings #
  ######################
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  
  ###############################
  # Garbage collection settings #
  ###############################

  # Auto gc
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 8h";
  }; 

  # Reduce the boot configurations
  boot.loader.systemd-boot.configurationLimit = 3;


  #########################
  # User account settings #
  #########################

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fangn = {
    isNormalUser = true;
    description = "fangn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
  };
}
