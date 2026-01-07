# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
        ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixp"; # Define your hostname.
    networking.networkmanager.enable = true;

    hardware.bluetooth.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Bucharest";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "ro_RO.UTF-8";
        LC_IDENTIFICATION = "ro_RO.UTF-8";
        LC_MEASUREMENT = "ro_RO.UTF-8";
        LC_MONETARY = "ro_RO.UTF-8";
        LC_NAME = "ro_RO.UTF-8";
        LC_NUMERIC = "ro_RO.UTF-8";
        LC_PAPER = "ro_RO.UTF-8";
        LC_TELEPHONE = "ro_RO.UTF-8";
        LC_TIME = "ro_RO.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Define a user account.
    users = {
        users.ervin = {
            isNormalUser = true;
            description = "ervin";
            extraGroups = [ "networkmanager" "wheel" ];
            packages = with pkgs; [];
        };
        defaultUserShell = pkgs.zsh;
    };

    security.sudo = {
        enable = true;
        wheelNeedsPassword = false;
    };

    services.getty.autologinUser = "ervin";
    nixpkgs.config.allowUnfree = true;

    fonts.packages = with pkgs; [
        _0xproto
        meslo-lgs-nf
    ];

    environment.systemPackages = with pkgs; [
        neovim
        kitty
        lua-language-server
        unzip
        brightnessctl
        zsh-powerlevel10k
        gcc
        clang
        xwayland-satellite
        greetd

    ];


    programs.thunar = {
        enable = true;
        plugins = with pkgs; [
            thunar-archive-plugin
            thunar-volman
        ];
    };

    programs.zsh.enable = true;
    programs.dms-shell.enable = true;
    programs.xwayland.enable = true;
    programs.niri.enable = true;

    # thunar
    services.gvfs.enable = true;
    services.udisks2.enable = true;

    # dms greeter
    services.xserver.enable = true;
    services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "niri";
    };

    #power management
    services.upower.enable = true;

    #flatpak
    services.flatpak.enable = true;

    #environment variables
    environment.variables = {
        YSU_HARDCORE = "1";
    };

    #nvidia drivers
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    system.stateVersion = "25.05"; 
}
