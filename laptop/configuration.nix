{config, pkgs, lib, ...}:

{
    imports =
        [ 
            ./hardware-configuration.nix
            ../common.nix
        ];

    networking.hostName = "nixl";
    services.tlp.enable = true;
    services.power-profiles-daemon.enable = lib.mkForce false;

    system.stateVersion = "25.05"; 
}
