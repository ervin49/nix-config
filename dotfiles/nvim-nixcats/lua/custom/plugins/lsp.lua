return {
    "nvim-lspconfig", -- Numele pachetului din Nix
    after = function()
        -- 1. Obținem capabilitățile de la Blink (care va fi încărcat automat dacă e nevoie)
        local blink_status, blink = pcall(require, "blink.cmp")
        local capabilities = blink_status and blink.get_lsp_capabilities() or {}

        ---------------------------------------
        -- 1. Configurare CLANGD (C/C++)
        ---------------------------------------
        vim.lsp.config('clangd', {
            cmd = { 'clangd' },
            filetypes = { "h", "c", "cpp", "objc", "objcpp" },
            root_markers = { '.git', 'compile_commands.json', 'compile_flags.txt' },
            capabilities = capabilities,
        }) 
        vim.lsp.enable('clangd')

        ---------------------------------------
        -- 2. Configurare JDTLS (Java)
        ---------------------------------------
        vim.lsp.config('jdtls', {
            cmd = { 'jdtls' },
            root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml' }, 
            capabilities = capabilities,
        })
        vim.lsp.enable('jdtls')

        ---------------------------------------
        -- 3. Shortcut-uri (Keymaps)
        ---------------------------------------
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })
    end,
}
