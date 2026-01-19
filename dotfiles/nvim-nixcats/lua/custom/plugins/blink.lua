local blink_status, blink = pcall(require, "blink.cmp")
if not blink_status then
    return
end

blink.setup({
    -- === SECTIUNEA NOUA: Logica pentru Quotes/Comments ===
    enabled = function()
        -- 1. Dezactivăm în prompt-uri (Telescope, etc.)
        if vim.bo.buftype == 'prompt' then return false end
        
        -- 2. Verificăm dacă suntem în Command Line mode
        if vim.api.nvim_get_mode().mode == 'c' then return true end

        -- 3. Logica de Treesitter pentru Quotes și Comentarii
        local success, node = pcall(vim.treesitter.get_node)
        if success and node then
            -- Verificăm nodul curent ȘI părinții lui (pentru a prinde string_content)
            local cur_node = node
            while cur_node do
                local type = cur_node:type()
                if type:find("string") or type:find("comment") then
                    return false
                end
                cur_node = cur_node:parent()
            end
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
