{
  description = "Home Manager configuration of ervin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";  # Ensure home-manager uses the same nixpkgs version
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { nixpkgs, home-manager, nix-flatpak, ... } @ inputs:
    let
      system = "x86_64-linux";  # Target architecture
      pkgs = nixpkgs.legacyPackages.${system};  # Get the correct packages for the system
    in
      {
        # Define NixOS configuration for this system
        nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./configuration.nix  # System configuration file

            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = { inherit inputs; };  # Pass inputs to home-manager

              # Define user-specific configuration for "ervin"
              home-manager.users."ervin" = {
                imports = [
                  ./home.nix  # User's home configuration
                  nix-flatpak.homeManagerModules.nix-flatpak  # Flatpak integration for Home Manager
                ];
              };
            }
          ];
        };
      };
}
