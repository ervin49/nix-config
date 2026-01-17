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
	options = {
          number = true;         # Arată numărul liniei curente
          relativenumber = true; # Arată numere relative pe celelalte linii
          shiftwidth = 4;        # (Opțional) Setează indentarea la 2 spații
          tabstop = 4;           # (Opțional) Setează tab-ul la 2 spații
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
