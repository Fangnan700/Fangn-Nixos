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
          ./system
          ./module/gpu
          ./module/gnome
          ./module/network
          ./module/software
        ];
      };
    };
  };
}
