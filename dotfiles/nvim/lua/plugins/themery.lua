return {
    'zaldih/themery.nvim',
    config = function()
        -- Using before and after.
        require("themery").setup({
            themes = {
                {
                    name = "alabaster",
                    colorscheme = "alabaster",
                    before = [[
                    vim.opt.background = "dark"
                    ]],
                },
                {
                    name = "gruvbox material",
                    colorscheme = "gruvbox-material",
                    before = [[
      vim.opt.background = "dark"
    ]],
                },
                {
                    name = "tokyonight",
                    colorscheme = "tokyonight",
                    before = [[
      vim.opt.background = "dark"
    ]],
                    after = [[-- Same as before, but after if you need it]]
                }},
        })
    end
}
