local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

return {
    "lualine.nvim",
    event = "DeferredUIEnter",
    load = function()
        lualine.setup {
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
