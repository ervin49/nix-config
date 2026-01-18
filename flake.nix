{
    description = "Home Manager configuration of ervin";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";  # Ensure home-manager uses the same nixpkgs version
        };
        nix-flatpak.url = "github:gmodena/nix-flatpak";
        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                home-manager.follows = "home-manager";
            };
        };
        my-nixcats.url = "/home/ervin/.nix-config/dotfiles/nvim-nixcats/";
    };

    outputs = { nixpkgs, home-manager, nix-flatpak, zen-browser, my-nixcats, ... } @ inputs:
        let
        system = "x86_64-linux";  # Target architecture
        pkgs = nixpkgs.legacyPackages.${system};  # Get the correct packages for the system
        in
        {
# Define NixOS configuration for this system
            nixosConfigurations."nixl" = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    inherit inputs;
                };

                modules = [
                    ./laptop/configuration.nix  # System configuration file

                        home-manager.nixosModules.home-manager {

                            home-manager.extraSpecialArgs = { inherit my-nixcats inputs; };  # Pass inputs to home-manager

# Define user-specific configuration for "ervin"
                                home-manager.users."ervin" = {
                                    imports = [
                                        ./home.nix  # User's home configuration
                                            nix-flatpak.homeManagerModules.nix-flatpak  
                                    ];
                                };
                        }
                ];
            };
            nixosConfigurations."nixp" = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    inherit inputs;
                };

                modules = [
                    ./pc/configuration.nix  # System configuration file

                        home-manager.nixosModules.home-manager {
                            home-manager.extraSpecialArgs = { inherit my-nixcats inputs; };  # Pass inputs to home-manager

# Define user-specific configuration for "ervin"
                                home-manager.users."ervin" = {
                                    imports = [
                                        ./home.nix  # User's home configuration
                                            nix-flatpak.homeManagerModules.nix-flatpak  
                                    ];
                                };
                        }
                ];
            };
        };
}
