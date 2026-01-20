return {
    "themery.nvim",
    cmd = { "Themery" },
    load = function()
        require("themery").setup({
            livePreview = true,
            themes = {
                {
                    name = "gruvbox-material",
                    colorscheme = "gruvbox-material",
                    before = [[
                    vim.opt.background = "dark"
                    ]],
                },
                {
                    name = "jetbrains",
                    colorscheme = "jb",
                    before = [[
                    vim.opt.background = "dark"
                    ]],
                },
            },
        })
    end,
}
