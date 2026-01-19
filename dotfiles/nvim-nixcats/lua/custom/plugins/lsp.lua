-- Blink CMP capabilities
local blink_status, blink = pcall(require, "blink.cmp")
local capabilities = blink_status and blink.get_lsp_capabilities() or {}

-- NOTA: Nu mai folosim require('lspconfig') aici, folosim API-ul nativ vim.lsp

---------------------------------------
-- 1. Configurare CLANGD (C/C++)
---------------------------------------
-- Definim configuratia
vim.lsp.config('clangd', {
        cmd = { 'clangd'},
    filetypes = { "h", "c", "cpp", "objc", "objcpp" },
    root_markers = { '.git', 'compile_commands.json', 'compile_flags.txt' },
    capabilities = capabilities,
})

-- Activam serverul
vim.lsp.enable('clangd')

---------------------------------------
-- 2. Configurare JDTLS (Java)
---------------------------------------
vim.lsp.config('jdtls', {
        cmd = { 'jdtls' },
        -- root_markers inlocuieste root_dir in noua versiune
        root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml' }, 
        capabilities = capabilities,
})

-- Activam serverul
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
