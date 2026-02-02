{ config, pkgs, inputs, ... }:

{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

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

# Power Management
    services.upower.enable = true;

    services.flatpak.enable = true;

# Environment variables
    environment.variables = {

    };
    hardware.keyboard.qmk.enable = true;

    services.udev.extraRules = ''
# Keychron Universal Rule
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
        '';

    services.keyd = {
        enable = true;

        keyboards.default = {
            ids = [ "*" ];

            settings = {
                main = {
                    capslock = "overload(control, escape)";
                    space = "overload(nav, space)";
                };
                nav = {
                    h = "left";
                    j = "down";
                    k = "up";
                    l = "right";

                    u = "backspace";
                    i = "delete";

                    y = "home";
                    o = "end";

                    n = "pagedown";
                    p = "pageup";
                };
            };
        };
    };

    system.stateVersion = "25.05"; 
}
