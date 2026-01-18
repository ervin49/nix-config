config = function()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = '',
            section_separators = '',
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
    }
end
