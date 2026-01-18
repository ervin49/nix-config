require('blink.cmp').setup({
    keymap = {
        preset = 'none', 
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },

        -- SCROLL DOCS: Ctrl + Space pentru documentație (opțional)
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    },

    -- 2. COMPORTAMENTUL MENIULUI (Selectează primul automat)
    completion = {
        list = {
            selection = { preselect = true, auto_insert = false }
        },

        -- Documentația apare automat lângă sugestie (ca în IntelliJ)
        documentation = { auto_show = true, auto_show_delay_ms = 200 },

        -- Meniul nu apare dacă scrii doar 1 literă (opțional, reduce zgomotul)
        menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end },
    },

    -- 3. ORDINEA SURSELOR
    sources = {
        -- Snippets primele, apoi LSP
        default = { 'snippets', 'lsp', 'path', 'buffer' },
        providers = {
            snippets = {
                name = 'Snippets',
                module = 'blink.cmp.sources.snippets',
                score_offset = 100, 
            },
            lsp = {
                name = 'LSP',
                module = 'blink.cmp.sources.lsp',
                score_offset = 0, 
            },
        },
    };
})
