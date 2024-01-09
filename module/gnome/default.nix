{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11.
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable tray icon service.
  services.udev.packages = with pkgs; [ 
    gnome.gnome-settings-daemon 
  ];

  # Gnome apps.
  environment.systemPackages = with pkgs; [
    gnomeExtensions.move-clock
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.kimpanel
    gnome.gnome-tweaks

    whitesur-gtk-theme
    whitesur-icon-theme
  ];

  # Disable gnome default apps.
  environment.gnome.excludePackages = with pkgs.gnome; [
    baobab
    cheese
    eog
    epiphany
    gedit
    simple-scan
    totem
    yelp
    file-roller
    geary
    seahorse
    gnome-calculator 
    gnome-calendar 
    gnome-characters 
    gnome-clocks 
    gnome-contacts
    gnome-logs 
    gnome-maps 
    gnome-music 
    gnome-weather
    pkgs.gnome-tour
    pkgs.gnome-photos
  ];

  programs.gpaste.enable = true;
}
