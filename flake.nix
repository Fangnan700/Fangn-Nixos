{
  description = "fangn's nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    fangn-pkgs.url = "github:/Fangnan700/Fangn-Pkgs";
  };
 
  outputs = { self, nixpkgs, nixpkgs-unstable, fangn-pkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        "fangn-nixos" = nixpkgs.lib.nixosSystem rec {
          specialArgs = {
            inherit inputs; 
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
            pkgs-fangn = fangn-pkgs.legacyPackages.${system};
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
