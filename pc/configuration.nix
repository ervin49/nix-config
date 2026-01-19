{ config, pkgs, ... }:

{
    imports =
        [ 
            ./hardware-configuration.nix
            ../common.nix
        ];

    networking.hostName = "nixp";

    #nvidia drivers
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    hardware.graphics = {
        enable = true;
        enable32Bit = true; 
    };

    system.stateVersion = "25.05"; 
}
