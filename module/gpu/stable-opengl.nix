{ config, pkgs, lib, ... }:

with lib;

# NVIDIA-GPU related

{
  #imports = [
  #  # "./nvidia-docker.nix"    # Include the necessary file for Nvidia virtualization (if needed)
  #];

  
  # ---------------------------------------------------------------------
  # Direct Rendering Infrastructure (DRI) support, both for 32-bit and 64-bit, and 
  # Make sure opengl is enabled
  #---------------------------------------------------------------------
  hardware = {
    opengl = {
      enable = true;
      driSupport = lib.mkDefault true;
      driSupport32Bit = lib.mkDefault true;

      #---------------------------------------------------------------------
      # Install additional packages that improve graphics performance and compatibility.
      #---------------------------------------------------------------------
      extraPackages = with pkgs; [
        intel-media-driver 	# LIBVA_DRIVER_NAME=iHD
        libvdpau-va-gl
        nvidia-vaapi-driver
        vaapiIntel 		# LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        vaapiVdpau
        vulkan-validation-layers
      ];
    };
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;
      nvidiaPersistenced = true;

      # Enable the Nvidia settings menu
      nvidiaSettings = true;

      # Enable power management
      powerManagement.enable = true; # Fix Suspend issue

      # Select the appropriate driver version for your GPU
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  # Specify the Nvidia video driver for Xorg 
  services.xserver.videoDrivers = [ "nvidia" ];

  # Set environment variables related to NVIDIA graphics
  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  # Packages related to NVIDIA graphics
  environment.systemPackages = with pkgs; [
    clinfo
    nvtop-nvidia
    virtualglLib
    vulkan-loader
    vulkan-tools
  ];
}
