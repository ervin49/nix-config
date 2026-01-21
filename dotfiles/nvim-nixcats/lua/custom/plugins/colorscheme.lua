return {
  {
    "sainnhe/gruvbox-material",
    -- 2. Setări critice pentru temă
    lazy = false,    -- NU vrem lazy loading, tema trebuie să apară instant
    priority = 1000, -- Prioritate maximă (se încarcă înaintea tuturor celorlalte plugin-uri)

    -- 3. Configurare și Activare
    config = function()
        -- Setări opționale pentru gruvbox (le pui înainte de colorscheme)
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = 'medium' -- 'hard', 'medium', 'soft'
        
        -- AICI activăm tema efectiv
        vim.cmd.colorscheme('gruvbox-material')
    end
  }
}
