local blink_status, blink = pcall(require, "blink.cmp")
if not blink_status then
    return
end

blink.setup({
    -- === SECTIUNEA NOUA: Logica pentru Quotes/Comments ===
    enabled = function()
        -- 1. Verifică dacă suntem într-un buffer de tip prompt (ex: Telescope) și oprește
        if vim.bo.buftype == 'prompt' then return false end

        -- 2. Încearcă să obțină nodul curent de la Treesitter
        local success, node = pcall(vim.treesitter.get_node)
        
        -- Dacă treesitter nu merge sau nu există nod, lăsăm completarea pornită (fallback)
        if not success or not node then return true end

        -- Lista de tipuri de noduri unde NU vrem completare
        local ignore_types = { 
            'string', 'string_content', -- Pentru ghilimele
            'comment', 'line_comment', 'block_comment' -- Pentru comentarii
        }

        -- Dacă tipul nodului curent este în listă, oprim blink
        if vim.tbl_contains(ignore_types, node:type()) then
            return false
        end

        return true
    end,
    -- =====================================================

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
        -- Am păstrat și regula ta pentru cmdline
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

            lsp       = {
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
