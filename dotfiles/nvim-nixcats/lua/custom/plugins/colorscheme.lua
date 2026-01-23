return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,    
    priority = 1000,

    -- 3. Configurare și Activare
    config = function()
        -- Setări opționale pentru gruvbox (le pui înainte de colorscheme)
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = 'hard' -- 'hard', 'medium', 'soft'
        
        -- AICI activăm tema efectiv
        vim.cmd.colorscheme('gruvbox-material')
    end
  }
}
