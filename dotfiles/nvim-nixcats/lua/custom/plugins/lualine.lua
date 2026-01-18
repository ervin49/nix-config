local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'iceberg_dark',
        component_separators = { left = '', right = '' },
section_separators = { left = '', right = '' },
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_z = {'location'}
    },
}
