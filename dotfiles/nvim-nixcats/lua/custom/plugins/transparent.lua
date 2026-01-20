local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
    return
end

transparent.setup({
    -- Lista de grupuri standard care devin transparente
    groups = {
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
        'EndOfBuffer',
    },
    
    -- AICI E CHEIA: Adaugă plugin-urile pe care le folosești ca să fie și ele transparente
    extra_groups = {
        -- Ferestre plutitoare (LSP, Mason, Lazy)
        "NormalFloat", 
        "FloatBorder",
        "LspFloatWinNormal",
        "MasonNormal",
        "LazyNormal",
        
        -- WhichKey
        "WhichKey",
        "WhichKeyFloat",
        
        -- GitSigns
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
    },
    
    -- Dacă vrei să păstrezi fundalul la ceva anume, îl pui aici
    exclude_groups = {}, 
})

-- Opțional: Activare automată la pornire (dacă nu e deja)
-- transparent.clear_prefix('BufferLine') -- Dacă folosești bufferline și arată ciudat
