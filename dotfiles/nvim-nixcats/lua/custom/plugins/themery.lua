return {
    "themery.nvim",
    -- Trigger: Încărcare doar la comandă
    cmd = { "Themery" },
    
    -- Folosim after pentru a rula setup-ul după ce plugin-ul e în runtimepath
    after = function()
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
