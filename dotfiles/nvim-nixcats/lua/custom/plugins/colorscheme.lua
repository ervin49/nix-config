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

            vim.cmd("colorscheme gruvbox-material")
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({})
            vim.cmd("colorscheme rose-pine")
        end
    }
}
