return {
    {
        "blink.nvim",
        lazy = false,
        config = function()
            require("blink.cmp").setup({
                keymap = {
                    preset = "none",
                    ["<CR>"] = { "accept", "fallback" },
                    ["<Tab>"] = { "snippet_forward", "fallback" },
                    ["<S-Tab>"] = { "snippet_backward", "fallback" },
                    ["<Up>"] = { "select_prev", "fallback" },
                    ["<Down>"] = { "select_next", "fallback" },
                    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                },
                completion = {
                    list = { selection = { preselect = true, auto_insert = false } },
                    documentation = { auto_show = true, auto_show_delay_ms = 200 },
                    menu = { auto_show = function(ctx) return ctx.mode ~= "cmdline" end },
                },
                sources = {
                    default = { "snippets", "lsp", "path", "buffer" },
                    providers = {
                        snippets = { name = "Snippets", module = "blink.cmp.sources.snippets", score_offset = 100 },
                        lsp      = { name = "LSP", module = "blink.cmp.sources.lsp", score_offset = 0 },
                    },
                },
            })
        end
    }
}

