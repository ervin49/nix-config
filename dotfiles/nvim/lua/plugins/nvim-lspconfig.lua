return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'saghen/blink.cmp', -- Blink pentru capabilități LSP
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        local on_attach = function(client, bufnr)
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr, async = false })
                    end,
                })
            end

            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        end

        -- UI hover & signatureHelp cu border rotund
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, { border = "rounded" }
        )
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, { border = "rounded" }
        )

        -- ==============================
        -- Lua LSP
        -- ==============================
        vim.lsp.start({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            filetypes = { "lua" },
            root_dir = vim.fs.dirname(vim.fs.find({'.git', 'lua'}, { upward = true })[1]),
            settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- ==============================
        -- Clangd
        -- ==============================
        vim.lsp.start({
            name = "clangd",
            cmd = { "clangd" },
            filetypes = { "c", "cpp", "objc", "objcpp" },
            root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end
}

