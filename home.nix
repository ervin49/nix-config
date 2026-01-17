{ lib, config, pkgs, inputs,osConfig, ... }:

let
    dotfiles = "/home/ervin/.nix-config/dotfiles";
    username = "ervin";
    homeDirectory = "/home/ervin";
    isDesktop = osConfig.networking.hostName == "nixp";
in
    {
    home = {
        inherit username homeDirectory;
        stateVersion = "24.11";
    };

    home.packages = with pkgs; [
        #cli tools
        ripgrep
        bat
        fzf
        tmux
        gh
        maven
        nh
        libnotify
        python3
        matugen
        wl-clipboard
        clang-tools
        tldr
        cargo
        eza

        #gui apps
        zathura
        dbeaver-bin
        jetbrains-toolbox
        vesktop
        obsidian
        inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
        kdePackages.gwenview 
        brave
    ];

    programs.gh = {
        enable = true;

        settings = {
            git_protocol = "ssh"; 

            editor = "vim"; 
        };
    };


    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
    };

    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
        profiles.default = {
            extensions = with pkgs.vscode-extensions; [
                dracula-theme.theme-dracula
            ];
            userSettings = {
                "editor.fontSize" = 16;
                "workbench.colorTheme" = "Dracula";
                "files.autoSave" = "afterDelay";
            };
        };
    };

    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "ervin49";
                email = "ervin49@gmail.com";
            };
            init.defaultBranch = "main";
        };
    };

    programs.java = {
        enable = true;
        package = pkgs.jdk21;
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        dotDir = "${homeDirectory}/.config/zsh";
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        plugins = [
            {
                name = "powerlevel10k";
                src = pkgs.zsh-powerlevel10k;
                file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
        ];
        oh-my-zsh = {
            enable = true;
            plugins = [ "git" ];
        };
        setOptions = [ "AUTO_CD" ];
        shellAliases = {
            cd = "z";
            s = "sudo shutdown now";
            r = "sudo reboot now";
            ls = "eza";
            ll = "eza -l";
            nc = "nh clean all";
            nu = "cd ~/.nix-config && nh os switch . --update && ga . && gc -m \"Update: ${osConfig.networking.hostName} - $(date +'%Y-%m-%d %H:%M')\" && gp";
            n = "cd ~/.nix-config && nh os switch . && ga . && gc -m \"Rebuild: ${osConfig.networking.hostName} - $(date +'%Y-%m-%d %H:%M')\" && gp";
            ns = "nh search";
        };
        initContent = ''
            [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
            if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
              tmux new-session -A -s main
            fi
        '';
    };

    gtk = {
        enable = true;
        font.name = "TeX Gyre Adventor 10";
        theme = {
            name = "Juno";
            package = pkgs.juno-theme;
        };
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
        };
        gtk3.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
        gtk4.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
    };

    home.file = {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
        ".tmux".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmux";
        ".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmux.conf";
        ".tmux.conf.local".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmux.conf.local";
        ".config/niri".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/niri";
        ".config/DankMaterialShell".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/DankMaterialShell";
        ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/p10k.zsh";
        ".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/ideavimrc";
    };

    programs.alacritty = {
        enable = true;

        settings = {
            font = {
                size = if isDesktop then 14.0 else 16.0;
                normal = {
                    family = "0xProto";
                    style = "Regular";
                };
            };
        };
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    services.flatpak = {
        enable = true;
        remotes = [{
            name = "flathub";
            location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }];
        packages = [
            "eu.betterbird.Betterbird" 
        ];
        uninstallUnmanaged = true;
        update.onActivation = true;
    };

    nixpkgs.config.allowUnfree = true;
    programs.home-manager.enable = true;
}
