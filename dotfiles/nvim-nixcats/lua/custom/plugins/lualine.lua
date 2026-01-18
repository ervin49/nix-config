local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = '',
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
}
