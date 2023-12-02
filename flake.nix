{
  description = "fangn's nixos flake";
 
  nixConfig = {
  };


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
 
  outputs = { self, nixpkgs, nixpkgs-unstable, ... } @inputs: {
    nixosConfigurations = {
      "fangn-nixos" = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            system = system;
            config.allowUnfree = true;
          };
        }; 
       
        modules = [
          ./system/configuration.nix
          ./system/hardware.nix
          ./system/disk.nix
          ./system/environment.nix
          ./module/gpu/stable-opengl.nix
          ./module/gnome/default.nix
          ./module/network/default.nix
          ./module/software/default.nix
          ./module/software/tools.nix 
          ./module/software/entertainment.nix 
        ];
      };
    };
  };
}
