-- Blink CMP capabilities
local blink_status, blink = pcall(require, "blink.cmp")
local capabilities = blink_status and blink.get_lsp_capabilities() or {}

-- NOTA: Folosim API-ul nativ vim.lsp (specific Neovim modern/nightly)

---------------------------------------
-- 1. Configurare CCLS (C/C++)
---------------------------------------
-- Inlocuim blocul clangd cu ccls
vim.lsp.config('ccls', {
    cmd = { 'ccls' },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    -- Este CRITIC sa ai '.ccls' aici, ca sa stie unde e radacina proiectului
    root_markers = { '.ccls', 'compile_commands.json', '.git' }, 
    capabilities = capabilities,
    init_options = {
        compilationDatabaseDirectory = ".", -- Cauta json-ul daca exista
        index = {
            threads = 0, -- Foloseste toate nucleele CPU
        },
        clang = {
            excludeArgs = { "-frounding-math" }, -- Fix pentru erori comune
        },
    },
})

-- Activam serverul CCLS
vim.lsp.enable('ccls')

---------------------------------------
-- 2. Configurare JDTLS (Java)
---------------------------------------
vim.lsp.config('jdtls', {
    cmd = { 'jdtls' },
    root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml' }, 
    capabilities = capabilities,
})

-- Activam serverul JDTLS
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
