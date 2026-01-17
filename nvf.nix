{ pkgs, ... }:

{
  programs.nvf = {
    enable = true;

    settings = {
      # 1. Everything must be inside the 'vim' block
      vim = {
        theme = {
          enable = true;
          name = "dracula";
          style = "dark";
        };

        # 2. Separate treesitter from LSP
        treesitter = {
          enable = true;
        };

        lsp = {
          enable = true;
        };

        # 3. I have removed extraPlugins because enabling lsp and treesitter 
        # above AUTOMATICALLY installs these plugins for you.
        # If you add them manually here, it will cause conflicts.
      };
    };
  };
}
