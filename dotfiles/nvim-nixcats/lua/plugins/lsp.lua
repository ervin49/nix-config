-- 1. Eliminăm complet require('lspconfig') care cauzează eroarea __index
-- În noua versiune, configurarea se face direct prin API-ul Neovim

local blink_status, blink = pcall(require, 'blink.cmp')
local capabilities = blink_status and blink.get_lsp_capabilities() or {}

-- 2. Configurare CLANGD (C++)
-- Folosim noua metodă integrată: vim.lsp.config
if vim.lsp.config then
    -- Metoda nouă (0.11+)
    vim.lsp.config('clangd', {
        install = {
            cmd = { "clangd" },
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_marker = function() return vim.fn.getcwd() end,
        capabilities = capabilities,
    })
    vim.lsp.enable('clangd')
else
    -- Fallback forțat dacă metoda de mai sus e prea nouă chiar și pentru build-ul tău
    -- Folosim sintaxa de tabel pentru a evita __index error de la .
    local ok, lspc = pcall(require, 'lspconfig')
    if ok then
        lspc['clangd'].setup({
            capabilities = capabilities,
            cmd = { "clangd" },
            root_dir = function() return vim.fn.getcwd() end,
        })
    end
end

-- 3. Configurare JAVA (JDTLS)
if vim.lsp.config then
    vim.lsp.config('jdtls', {
        install = {
            cmd = { "jdtls" },
        },
        root_marker = function()
            local root_files = {'.git', 'mvnw', 'gradlew', 'pom.xml'}
            local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
            return #paths > 0 and vim.fs.dirname(paths[1]) or vim.fn.getcwd()
        end,
        capabilities = capabilities,
    })
    vim.lsp.enable('jdtls')
end

-- 4. Shortcut-uri (Rămân neschimbate, folosesc direct vim.lsp)
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end,
})
