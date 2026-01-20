return {
    "lualine.nvim",
    -- Folosim for_cat dacă vrei să respecți structura nixCats din documentație
    event = "DeferredUIEnter",
    after = function()
        -- require-ul trebuie să fie INSIDE funcției after sau load
        -- astfel încât să ruleze doar DUPĂ ce lze a încărcat plugin-ul
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
    end,
}
