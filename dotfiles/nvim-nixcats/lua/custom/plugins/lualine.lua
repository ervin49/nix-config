return {
  {
    "nvim-lualine/lualine.nvim",
    
    -- 1. Verificare NixCats
    enabled = true,

    -- 2. Dependențe (pentru iconițe)
    dependencies = { "nvim-tree/nvim-web-devicons" },

    -- 3. Configurare
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_y = {},
                lualine_x = {'filetype'},
                lualine_z = {'location'}
            },
        }
    end
  }
}
