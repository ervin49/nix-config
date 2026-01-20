-- Blink CMP capabilities
local blink_status, blink = pcall(require, "blink.cmp")
local capabilities = blink_status and blink.get_lsp_capabilities() or {}

---------------------------------------
-- 1. Configurare CLANGD (C/C++)
---------------------------------------
vim.lsp.config('clangd', {
    cmd = { 'clangd' }, -- Am inchis acolada aici. Nu lasa virgula in interior daca e un singur element, e mai safe.
    filetypes = { "h", "c", "cpp", "objc", "objcpp" },
    root_markers = { '.git', 'compile_commands.json', 'compile_flags.txt' },
    capabilities = capabilities,
}) 
-- NOTA: La finalul functiei trebuie '})' -> o acolada pentru tabela, o paranteza pentru functie.

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
