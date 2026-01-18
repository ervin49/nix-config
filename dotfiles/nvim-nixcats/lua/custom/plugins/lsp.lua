return {
    {
        "nvim-lspconfig",  -- doar ca marker, poate fi null dacă deja builtin LSP
        lazy = false,
        config = function()
            -- Blink capabilities
            local blink_status, blink = pcall(require, "blink.cmp")
            local capabilities = blink_status and blink.get_lsp_capabilities() or {}

            -- Configurare CLANGD (C++)
            if vim.lsp.config then
                vim.lsp.config("clangd", {
                    cmd = { "clangd" },
                    filetypes = { "h", "c", "cpp", "objc", "objcpp" },
                    root_marker = function() return vim.fn.getcwd() end,
                    capabilities = capabilities,
                })
                vim.lsp.enable("clangd")
            end

            -- Configurare JDTLS (Java)
            if vim.lsp.config then
                vim.lsp.config("jdtls", {
                    cmd = { "jdtls" },
                    root_marker = function()
                        local root_files = { ".git", "mvnw", "gradlew", "pom.xml" }
                        local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
                        return #paths > 0 and vim.fs.dirname(paths[1]) or vim.fn.getcwd()
                    end,
                    capabilities = capabilities,
                })
                vim.lsp.enable("jdtls")
            end

            -- Shortcut-uri LSP
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end,
            })
        end
    }
}

