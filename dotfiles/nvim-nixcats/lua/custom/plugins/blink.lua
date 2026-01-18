local blink_status, blink = pcall(require, "blink.cmp")
if not blink_status then
    return
end

blink.setup({
    keymap = {
        preset = "none",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "snippet_forward","select_next", "fallback" },
        ["<S-Tab>"] = { "snippet_backward","select_prev", "fallback" },
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
        default = { "snippets", "lsp", "buffer", "path" },
        providers = {
            snippets = {
                name = "Snippets",
                module = "blink.cmp.sources.snippets",
                score_offset = 100 
            },

            lsp      = {
                name = "LSP",
                module = "blink.cmp.sources.lsp",
                score_offset = 90 
            },

            buffer = {
                name = "Buffer",
                module = "blink.cmp.sources.buffer",
                score_offset = 50,  -- Backup
            },

            path = {
                name = "Path",
                module = "blink.cmp.sources.path",
                score_offset = 3,
            },
        },
    },
})
