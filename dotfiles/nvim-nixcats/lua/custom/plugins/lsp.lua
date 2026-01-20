return {
  {
    "neovim/nvim-lspconfig",
    
    -- 1. Verificăm cu NixCats
    enabled = true,
    
    -- 2. Declarăm dependența de Blink (ca să avem capabilitățile gata încărcate)
    dependencies = { "saghen/blink.cmp" },

    -- 3. Configurare
    config = function()
        -- Importăm lspconfig
        local lspconfig = require("lspconfig")
        
        -- Obținem capabilitățile de la Blink (pentru autocomplete)
        -- Blink se ocupă automat să le combine cu cele default
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- ==========================================
        -- 1. Configurare CLANGD (C/C++)
        -- ==========================================
        lspconfig.clangd.setup({
            cmd = { 'clangd' },
            -- Acestea sunt gestionate automat de lspconfig, dar le putem forța
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
            capabilities = capabilities,
        })

        -- ==========================================
        -- 2. Configurare JDTLS (Java)
        -- ==========================================
        -- Notă: Pentru Java avansat se recomandă pluginul 'nvim-jdtls', 
        -- dar pentru început merge și așa dacă ai jdtls în PATH (din Nix).
        lspconfig.jdtls.setup({
            cmd = { 'jdtls' },
            capabilities = capabilities,
            -- root_dir este detectat automat de lspconfig pe baza pom.xml/.git
        })

        -- ==========================================
        -- 3. Shortcut-uri (Keymaps) - LspAttach
        -- ==========================================
        -- Acest cod rulează DE FIECARE DATĂ când un server LSP se atașează la un fișier
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                local opts = { buffer = event.buf }

                -- Helper pentru a mapa taste mai ușor
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                -- Definiții și Navigare
                map("gd", require('telescope.builtin').lsp_definitions, "[G]oto [D]efinition") -- Folosim Telescope daca il ai, sau vim.lsp.buf.definition
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                
                -- Dacă vrei să folosești funcțiile native (fără Telescope), decomentează:
                -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            end,
        })
    end
  }
}
