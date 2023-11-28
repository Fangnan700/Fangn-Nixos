{
  description = "fangn's nixos flake";
 
  nixConfig = {
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
 
  outputs = { self, nixpkgs, nixpkgs-unstable } @inputs: {
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
          ./system/hardware-configuration.nix
          ./system/gpu-configuration.nix
          ./system/configuration.nix
          ./module/applications.nix
          ./module/network.nix
          ./module/gnome.nix
          ./module/develop-environment.nix
        ];
      };
    };
  };
}
