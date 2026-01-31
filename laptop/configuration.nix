{ config, pkgs, lib, ... }:

{
    imports =
        [ 
        ./hardware-configuration.nix
            ../common.nix
        ];

    networking.hostName = "nixl";

    services.power-profiles-daemon.enable = lib.mkForce false;

    services.tlp = {
        enable = true;

        settings = {
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

            CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

            START_CHARGE_THRESH_BAT0 = 20;
            STOP_CHARGE_THRESH_BAT0 = 80;
        };
    };
    services.keyd = {
        enable = true;

        keyboards.default = {
            ids = [ "*" ];

            settings = {
                main = {
                    capslock = "overload(control, escape)";
                };
            };
        };
    };

    system.stateVersion = "25.05"; 
}
